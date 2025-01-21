return {
  { "sainnhe/gruvbox-material" },
  {
    "sainnhe/everforest",
    enabled = false,
    config = function()
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_diagnostic_virtual_text = "highlighted"
      vim.g.everforest_enablie_italic = true
      vim.g.everforest_current_word = "grey background"
      vim.g.everforest_float_style = "dim"
    end,
  },
  { "rose-pine/neovim" },
  { "catppuccin/nvim" },
}
