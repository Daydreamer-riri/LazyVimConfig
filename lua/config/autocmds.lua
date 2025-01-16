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

require("custom.deferClip").setup()

require("snacks.toggle")
  .new({
    name = "transparent background",
    get = function()
      local bg = Snacks.util.color("Normal", "bg")
      return bg == nil
    end,
    set = function(state)
      local config = vim.fn["gruvbox_material#get_configuration"]()
      local palette =
        vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
      local set_hl = vim.fn["gruvbox_material#highlight"]
      if state then
        set_hl("Normal", palette.fg0, palette.none)
      else
        set_hl("Normal", palette.fg0, palette.bg0)
      end
    end,
  })
  :map("<leader>uB")
