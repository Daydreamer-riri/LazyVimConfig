return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {},
      cssmodules_ls = {},
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },

          -- eslint = {
          --   filetypes = {
          --     "javascript",
          --     "typescript",
          --     "javascriptreact",
          --     "typescriptreact",
          --     "json",
          --     "jsonc",
          --     "json5",
          --     "scss",
          --     "css",
          --   },
          -- },
        },
        filetypes = {
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
        },
      },
      -- somesass_ls = {
      --   root_dir = function(...)
      --     return require("lspconfig.util").root_pattern(".git")(...)
      --   end,
      --   init_options = {
      --     workspace = require("lspconfig.util").root_pattern(".git")(...),
      --   },
      -- },
    },
    setup = {
      eslint = function(_, opts)
        require("lazyvim.util").lsp.on_attach(function(client, bufnr)
          client.server_capabilities.documentRangeFormattingProvider = true
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
