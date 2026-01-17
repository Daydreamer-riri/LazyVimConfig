_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd

_G.IS_WSL = vim.fn.has("wsl") == 1
_G.IS_MAC = vim.fn.has("macunix") == 1
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
