-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.cmd([[
--   autocmd BufWritePost *.tsx,*.ts,*.jsx,*.js,*.json,*.scss EslintFixAll
-- ]])

-- -- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "typescriptreact",
    "javascriptreact",
    "typescript",
    "javascript",
    "json",
    "jsonc",
    "sass",
    "scss",
    "markdown",
  },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(event)
--     local lsp = vim.lsp
--     lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })
--     lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" })
--
--     local opts = { buffer = event.buf }
--     local map = vim.keymap.set
--     local lsp_buf = lsp.buf
--
--     map("n", "K", lsp_buf.hover, opts)
--     map("n", "gs", lsp_buf.signature_help, opts)
--     -- more keymaps
--   end,
-- })

-- require("transparent").setup({
--   enable = true,
--   group = {},
--   extra_groups = { -- table/string: additional groups that should be cleared
--     -- "BufferLineTabClose",
--     -- "BufferlineBufferSelected",
--     -- "BufferLineFill",
--     -- "BufferLineBackground",
--     -- "BufferLineSeparator",
--     -- "BufferLineIndicatorSelected",
--     -- "EndOfBuffer",
--     -- "IndentBlanklineChar",
--
--     -- make floating windows transparent
--     -- "LspFloatWinNormal",
--     -- "Normal",
--     "NormalFloat",
--     "FloatBorder",
--     -- "TelescopeNormal",
--     -- "TelescopeBorder",
--     -- "TelescopePromptBorder",
--     -- "SagaBorder",
--     -- "SagaNormal",
--   },
--   -- exclude = {}, -- table: groups you don't want to clear
-- })
