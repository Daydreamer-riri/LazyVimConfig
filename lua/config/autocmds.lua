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

-- if vim.fn.has("wsl") ~= 1 then
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--     callback = function()
--       vim.lsp.start({
--         name = "cssmodules_ls",
--         cmd = {
--           "D:\\Users\\ding.zhao\\AppData\\Local\\fnm_multishells\\54112_1723802932090\\cssmodules-language-server.CMD",
--         },
--         root_dir = vim.uv.cwd(),
--       })
--     end,
--   })
-- end
--
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*",
--   callback = function()
--     vim.bo.fileformat = "unix"
--   end,
-- })
