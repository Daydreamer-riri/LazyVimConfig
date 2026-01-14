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
    vim.bo.filetype = "json5"
  end,
})

if vim.env.TERM == "tmux-256color" then
  vim.cmd([[let &t_Cs = "\e[4:3m"]])
  vim.cmd([[let &t_Ce = "\e[4:0m"]])
end

require("custom.deferClip").setup()
