-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.clipboard = "unnamedplus"
-- vim.opt.clipboard = ""
if vim.fn.has("wsl") ~= 1 then
  vim.opt.shell = "pwsh.exe"
end

if vim.fn.has("wsl") == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.schedule(function()
        vim.fn.system("clip.exe", vim.fn.getreg("0"))
      end)
    end,
  })

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
-- vim.g.neovide_transparency = 0.8
