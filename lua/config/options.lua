-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove_Nerd_Font:h13"
  vim.g.neovide_theme = "dark"
  vim.opt.linespace = 4

  vim.g.neovide_title_background_color = "#232136"

  vim.api.nvim_set_keymap("v", "<c-c>", '"y', { noremap = true })
  vim.api.nvim_set_keymap("c", "<c-v>", '<C-r>"', { noremap = true })
  vim.api.nvim_set_keymap("i", "<c-v>", '<C-r>"', { noremap = true })
  vim.api.nvim_set_keymap("t", "<c-v>", '<C-r>"', { noremap = true })
end

vim.opt.title = true
local cwd = vim.fn.getcwd()
local cwd_folder_name = vim.fn.fnamemodify(cwd, ":t")
vim.opt.titlestring = cwd_folder_name

local _border = "rounded"
vim.diagnostic.config({
  float = { border = _border },
})

vim.g.rustaceanvim = {
  tools = {
    float_win_config = {
      border = _border,
    },
  },
}

vim.opt.smarttab = true
vim.opt.clipboard = ""
vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"

vim.opt.laststatus = 3

vim.opt.conceallevel = 0
