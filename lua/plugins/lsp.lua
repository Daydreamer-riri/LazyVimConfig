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

vim.g.lazyvim_eslint_auto_format = true

local hasEslintConfig = false
local eslint_config_file = "eslint.config.js"
local rood_dir = vim.fn.getcwd()
if vim.uv.fs_stat(rood_dir .. "/" .. eslint_config_file) then
  hasEslintConfig = true
end

return {
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
}
