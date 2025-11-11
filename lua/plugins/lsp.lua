-- ============================================================================
-- ESLint Configuration
-- ============================================================================

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

-- Disable stylistic/formatting rules in ESLint (handled by formatter)
local eslint_rules_customizations = {
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

-- LSP servers that should defer formatting to ESLint
local lsp_defer_to_eslint = {
  "vtsls",
  "cssls",
  "jsonls",
  "yamlls",
  "astro",
  "marksman",
  "taplo",
}

-- ============================================================================
-- Helper Functions
-- ============================================================================

-- Check if ESLint config exists in current working directory
local function has_eslint_config()
  local config_files = { "eslint.config.js", "eslint.config.mjs" }
  local root_dir = vim.fn.getcwd()

  for _, filename in ipairs(config_files) do
    local config_path = root_dir .. "/" .. filename
    local stat = vim.uv.fs_stat(config_path)
    if stat and stat.type == "file" then
      return true
    end
  end

  return false
end

local has_eslint = has_eslint_config()

-- Enable ESLint auto-formatting
vim.g.lazyvim_eslint_auto_format = true

-- ============================================================================
-- Plugin Configurations
-- ============================================================================

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- CSS Language Server
        cssls = {},

        -- CSS Modules Language Server
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

        -- ESLint Language Server
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            rulesCustomizations = eslint_rules_customizations,
          },
          filetypes = eslint_file_types,
        },

        -- YAML Language Server
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = not has_eslint, -- Disable if ESLint handles formatting
              },
            },
          },
        },

        -- Global LSP keymaps
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
          if not has_eslint then
            return
          end

          -- Configure formatting providers when ESLint is available
          Snacks.util.lsp.on(function(bufnr, client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif vim.tbl_contains(lsp_defer_to_eslint, client.name) then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },

  -- Conform.nvim - Formatter Configuration
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      if not has_eslint then
        return opts
      end

      -- Remove prettier from specific filetypes when ESLint is present
      local function remove_prettier(formatters)
        return vim.tbl_filter(function(value)
          return value ~= "prettier"
        end, formatters)
      end

      local filetypes = { "markdown", "markdown.mdx" }
      for _, ft in ipairs(filetypes) do
        opts.formatters_by_ft[ft] = remove_prettier(opts.formatters_by_ft[ft])
      end

      return opts
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft.markdown = {}
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = false,
    },
  },

  -- Rust Tools
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

  {
    {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy",
      priority = 1000,
      opts = {
        options = {
          multilines = {
            enabled = true,
            always_show = true,
          },
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = { diagnostics = { virtual_text = false } },
    },
  },
}
