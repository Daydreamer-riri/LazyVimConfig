return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      if vim.g.neovide then
        return {}
      end
      return {
        transparent_mode = true,
        overrides = {
          ["@string"] = { fg = "#d8a657" },
        },
        palette_overrides = {
          bright_red = "#ea6962",
          bright_green = "#a9b665",
        },
      }
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      if vim.g.neovide then
        return
      end
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      vim.g.gruvbox_material_enablie_italic = true
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
