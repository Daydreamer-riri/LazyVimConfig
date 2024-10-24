local transparent_mode = vim.g.neovide and 0 or 2
return {
  {
    "ellisonleao/gruvbox.nvim",
    -- enabled = false,
    opts = function()
      if vim.g.neovide then
        return {}
      end
      return {
        transparent_mode = true,
        -- overrides = {
        --   ["@string"] = { fg = "#d8a657" },
        -- },
        -- palette_overrides = {
        --   bright_red = "#ea6962",
        --   bright_green = "#a9b665",
        -- },
      }
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_transparent_background = transparent_mode
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      vim.g.gruvbox_material_enablie_italic = true
      vim.g.gruvbox_material_current_word = "grey background"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_foreground = "mix"
    end,
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_transparent_background = transparent_mode
      vim.g.everforest_diagnostic_virtual_text = "highlighted"
      vim.g.everforest_enablie_italic = true
      vim.g.everforest_current_word = "grey background"
      vim.g.everforest_float_style = "dim"
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    opts = {
      transparent_background = true,
    },
  },
  {
    "projekt0n/github-nvim-theme",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "lotus",
    },
  },
  {
    "xero/miasma.nvim",
  },
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
