local transparent_mode = vim.g.neovide and 0 or 2
return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
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
          local config = vim.fn["gruvbox_material#get_configuration"]()
          local palette =
            vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
          local set_hl = vim.fn["gruvbox_material#highlight"]

          set_hl("NormalFloat", palette.fg1, palette.none)
          set_hl("FloatTitle", palette.orange, palette.none, "bold")
          set_hl("FloatBorder", palette.grey1, palette.none)
          set_hl("HasBgNormal", palette.none, palette.bg_dim)
          vim.api.nvim_set_hl(0, "NoiceMini", { link = "HasBgNormal" })
          vim.api.nvim_set_hl(0, "GlanceListNormal", { link = "HasBgNormal" })
          vim.api.nvim_set_hl(0, "GlancePreviewNormal", { link = "HasBgNormal" })
          vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "PMenu" })
          vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "PMenu" })
          vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { link = "PmenuExtra" })
          vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { link = "PmenuExtra" })
          vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { link = "PmenuExtra" })
          set_hl("GlanceWinBarTitle", palette.fg0, palette.bg_dim)
          set_hl("GlanceWinBarFilename", palette.fg0, palette.bg_dim)
          set_hl("GlanceWinBarFilepath", palette.grey1, palette.bg_dim)
          set_hl("TreesitterContext", palette.none, palette.bg3)
          vim.api.nvim_set_hl(0, "Cursor", { bg = "#d4be98", fg = "#282828" })
        end,
      })
      vim.cmd.colorscheme("gruvbox-material")
    end,
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
