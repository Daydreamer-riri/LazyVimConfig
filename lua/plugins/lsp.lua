local eslint_file_types = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
  "vue",
  "html",
  "markdown",
  "json",
  "jsonc",
  "yaml",
  "toml",
  "xml",
  "gql",
  "graphql",
  "astro",
  "svelte",
  "css",
  "less",
  "scss",
}

local customizations = {
  { rule = "style/*", severity = "off", fixable = true },
  { rule = "format/*", severity = "off", fixable = true },
  { rule = "*-indent", severity = "off", fixable = true },
  { rule = "*-spacing", severity = "off", fixable = true },
  { rule = "*-spaces", severity = "off", fixable = true },
  { rule = "*-order", severity = "off", fixable = true },
  { rule = "*-dangle", severity = "off", fixable = true },
  { rule = "*-newline", severity = "off", fixable = true },
  { rule = "*quotes", severity = "off", fixable = true },
  { rule = "*semi", severity = "off", fixable = true },
}

vim.g.lazyvim_eslint_auto_format = true

-- Define common LSP types that should defer to eslint for formatting
local lspType = {
  "vtsls",
  "cssls",
  "jsonls",
  "yamlls",
  "astro",
  "marksman",
  "taplo",
}

-- Check for eslint config
local eslint_config_files = { "eslint.config.js", "eslint.config.mjs" }
local root_dir = vim.fn.getcwd()
local hasEslintConfig = false

for _, filename in ipairs(eslint_config_files) do
  local config_path = root_dir .. "/" .. filename
  local stat = vim.uv.fs_stat(config_path)
  if stat and stat.type == "file" then
    hasEslintConfig = true
    break
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        cssmodules_ls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
        },
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
            -- Silent the stylistic rules in you IDE, but still auto fix them
            rulesCustomizations = customizations,
          },
          filetypes = eslint_file_types,
        },
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = not hasEslintConfig,
              },
            },
          },
        },
        ["*"] = {
          keys = {
            {
              "<leader>k",
              function()
                vim.lsp.buf.hover()
              end,
              desc = "Hover",
            },
            { "<leader>cR", false },
          },
        },
      },
      setup = {
        eslint = function(_, opts)
          if not hasEslintConfig then
            return
          end

          ---@diagnostic disable-next-line: undefined-field
          require("lazyvim.util").lsp.on_attach(function(client, bufnr)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif vim.tbl_contains(lspType, client.name) then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      if hasEslintConfig ~= true then
        return opts
      end
      local function removePrettier(t)
        return vim.tbl_filter(function(value)
          return value ~= "prettier"
        end, t)
      end
      local fts = { "markdown", "markdown.mdx" }
      for _, ft in ipairs(fts) do
        opts.formatters_by_ft[ft] = removePrettier(opts.formatters_by_ft[ft])
      end

      return opts
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    opts = {
      tools = {
        float_win_config = {
          border = "rounded",
        },
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>cE", function()
            vim.cmd.RustLsp({ "explainError", "current" })
          end, { desc = "Explain Error", buffer = bufnr })
          vim.keymap.set("n", "<leader>ce", function()
            vim.cmd.RustLsp({ "renderDiagnostic", "current" })
          end, { desc = "Render Diagnostic", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            keys = {
              { "<leader>cR", false },
            },
            diagnostics = {
              experimental = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}
