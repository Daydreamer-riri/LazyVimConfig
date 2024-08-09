return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {},
      -- somesass_ls = {
      --   root_dir = function(...)
      --     return require("lspconfig.util").root_pattern(".git")(...)
      --   end,
      --   init_options = {
      --     workspace = require("lspconfig.util").root_pattern(".git")(...),
      --   },
      -- },
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },

          eslint = {
            filetypes = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "json",
              "jsonc",
              "json5",
              "scss",
              "css",
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "json",
          "jsonc",
          "json5",
          "scss",
          "css",
        },
      },
    },
    setup = {
      eslint = function()
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --   callback = function(ev)
        --     if require("lapconfig.util").get_active_client_by_name(ev.buf, "eslint") then
        --       vim.cmd("EslintFixAll")
        --     end
        --   end,
        -- })
        --
        -- vim.cmd([[
        --   autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
        -- ]])

        require("lazyvim.util").lsp.on_attach(function(client, bufnr)
          -- vim.api.nvim_create_autocmd("BufWritePre", {
          --   buffer = bufnr,
          --   command = "EslintFixAll",
          -- })
          client.server_capabilities.documentRangeFormattingProvider = true
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
        -- local function get_client(buf)
        --   return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
        -- end
        --
        -- local formatter = LazyVim.lsp.formatter({
        --   name = "eslint: lsp",
        --   primary = false,
        --   priority = 200,
        --   filter = "eslint",
        -- })
        --
        -- -- register the formatter with LazyVim
        -- LazyVim.format.register(formatter)
      end,
    },
  },
}
