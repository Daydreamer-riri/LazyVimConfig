-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if _G.IS_WSL ~= true then
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    callback = function()
      vim.bo.fileformat = "unix"
    end,
  })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/.vscode/*.json",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

require("custom.deferClip").setup()
