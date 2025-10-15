-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.has("wsl") ~= 1 then
  if vim.env.CURRENT_SHELL == "pwsh" then
    vim.opt.shell = "pwsh.exe"
    vim.opt.shellxquote = ""
    vim.opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
  end

  if vim.env.NU_VERSION then
    vim.opt.shell = "nu.exe"
    vim.opt.shellxquote = ""
    vim.opt.shellquote = ""
    vim.opt.shellcmdflag = "-c"
    -- vim.o.shellslash = true
  end
end

if vim.g.neovide then
  vim.o.guifont = "Cascadia Code NF,Cascadia Next SC:h14"
  vim.g.neovide_theme = "dark"
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
