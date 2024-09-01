return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
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
  -- {
  --   "sainnhe/gruvbox-material",
  --   config = function()
  --     if vim.g.neovide then
  --       return
  --     end
  --     vim.g.gruvbox_material_transparent_background = 2
  --     vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
  --     vim.g.gruvbox_material_enablie_italic = true
  --
  --     require("transparent").setup({
  --       enable = true,
  --       group = {},
  --       extra_groups = { -- table/string: additional groups that should be cleared
  --         -- "BufferLineTabClose",
  --         -- "BufferlineBufferSelected",
  --         -- "BufferLineFill",
  --         -- "BufferLineBackground",
  --         -- "BufferLineSeparator",
  --         -- "BufferLineIndicatorSelected",
  --         -- "EndOfBuffer",
  --         -- "IndentBlanklineChar",
  --
  --         -- make floating windows transparent
  --         -- "LspFloatWinNormal",
  --         -- "Normal",
  --         "NormalFloat",
  --         "FloatBorder",
  --         -- "TelescopeNormal",
  --         -- "TelescopeBorder",
  --         -- "TelescopePromptBorder",
  --         -- "SagaBorder",
  --         -- "SagaNormal",
  --       },
  --       -- exclude = {}, -- table: groups you don't want to clear
  --     })
  --   end,
  -- },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_diagnostic_virtual_text = "highlighted"
      vim.g.everforest_enablie_italic = true
      vim.g.everforest_current_word = "grey background"
      vim.g.everforest_float_style = "dim"
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    enabled = false,
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
    enabled = false,
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
