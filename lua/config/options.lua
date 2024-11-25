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

if vim.fn.has("wsl") == 1 then
  -- vim.api.nvim_create_autocmd("TextYankPost", {
  --   callback = function()
  --     vim.schedule(function()
  --       vim.fn.system("clip.exe", vim.fn.getreg("0"))
  --     end)
  --   end,
  -- })

  -- 粘贴缓慢
  -- vim.g.clipboard = {
  --   name = "WslClipboard",
  --   copy = {
  --     ["+"] = "clip.exe",
  --     ["*"] = "clip.exe",
  --   },
  --   paste = {
  --     ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  --     ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  --   },
  --   cache_enabled = 0,
  -- }
end

-- vim.o.fsync = false
-- vim.g.neovide_transparency = 0.8
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
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
