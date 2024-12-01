local transparent_mode = vim.g.neovide and 0 or 2
return {
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_transparent_background = transparent_mode
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      vim.g.gruvbox_material_enablie_italic = true
      vim.g.gruvbox_material_current_word = "grey background"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_foreground = "mix"
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
          vim.api.nvim_set_hl(0, "FloatBorder", { bg = nil, fg = "#928374" })
          vim.api.nvim_set_hl(0, "NoiceMini", { bg = "#1b1b1b" })
          vim.api.nvim_set_hl(0, "GlanceListNormal", { bg = "#1b1b1b" })
          vim.api.nvim_set_hl(0, "GlancePreviewNormal", { bg = "#1b1b1b" })
          vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { bg = "#1b1b1b", fg = "#e2cca9" })
          vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { bg = "#1b1b1b", fg = "#e2cca9" })
          vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { bg = "#1b1b1b", fg = "#928374" })
        end,
      })
    end,
    lazy = false,
    priority = 1000,
  },
  {
    "sainnhe/everforest",
    enabled = false,
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
    enabled = false,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    enabled = false,
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
    enabled = false,
  },
  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    opts = {
      variant = "moon",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    opts = {
      theme = "lotus",
    },
  },
  {
    "xero/miasma.nvim",
    enabled = false,
  },
  {
    "2nthony/vitesse.nvim",
    enabled = false,
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
