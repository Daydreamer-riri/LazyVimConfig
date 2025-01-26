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

local hasEslintConfig = false
local eslint_config_files = { "eslint.config.js", '"eslint.config.mjs"' }
local rood_dir = vim.fn.getcwd()
for _, filename in ipairs(eslint_config_files) do
  if vim.uv.fs_stat(rood_dir .. "/" .. filename) then
    hasEslintConfig = true
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
        vtsls = {
          root_dir = function()
            local lazyvimRoot = require("lazyvim.util.root")
            return lazyvimRoot.git()
          end,
        },
      },
      setup = {
        eslint = function(_, opts)
          if hasEslintConfig == false then
            return
          end
          local lspType = {
            "vtsls",
            "cssls",
            "jsonls",
            "yamlls",
            "astro",
            "marksman",
            "taplo",
          }
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
    "artemave/workspace-diagnostics.nvim",
    lazy = true,
    keys = {
      {
        "<leader>cx",
        function()
          local clients = require("lazyvim.util").lsp.get_clients({
            filter = function(client)
              return client.name == "vtsls"
            end,
          })
          for _, client in ipairs(clients) do
            require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
          end
        end,
        desc = "Populate workspace diagnostics",
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
}
