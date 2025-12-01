return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        completion = {
          menu = { border = "rounded" },
          documentation = { window = { border = "rounded" } },
        },
        signature = { window = { border = "rounded" } },
      })

      return opts
    end,
  },
  {
    "Daydreamer-riri/bufferline.nvim",
    opts = function(_, opts)
      local bufferline = require("bufferline")
      opts.options.separator_style = { "", "" }
      opts.options.tab_size = 20
      opts.options.style_preset = bufferline.style_preset.no_italic

      local get_hl = require("custom.hl-bufferline").hl

      opts.highlights = vim.tbl_deep_extend(
        "force",
        require("rose-pine.plugins.bufferline"),
        get_hl({
          c = {
            active_bg = "#3a3554",
            inactive_bg = "#232136",
          },
        }),
        {
          buffer_selected = {
            italic = false,
          },
        }
      )

      return opts
    end,
  },
  {
    "Daydreamer-riri/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true

      return opts
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = function(_, opts)
      opts.cursor_color = "#8d87a3"
      opts.legacy_computing_symbols_support = true

      return opts
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.section_separators = { right = "", left = "" }
      -- opts.options.component_separators = { right = "|", left = "|" }
      opts.options.component_separators = { right = " ", left = " " }
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = function(_, opts)
      opts = opts or {}

      local set_hl = require("snacks.util").set_hl
      set_hl({
        BlinkCmpDoc = { bg = nil },
        BlinkCmpDocSeparator = { bg = nil },
      }, {
        default = false,
      })

      opts = vim.tbl_deep_extend("force", opts, {
        dark_variant = "moon",
        styles = {
          transparency = true,
          italic = false,
        },
        highlight_groups = {
          CurSearch = { fg = "base", bg = "leaf", inherit = false },
          Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
          GlancePreviewNormal = { bg = "overlay", blend = 80, inherit = false },
          Number = { fg = "love" },
          BlinkCmpLabel = { fg = "subtle" },
          BlinkCmpDoc = { bg = nil },
          MsgArea = { bg = "overlay", blend = 60 },
        },
      })

      return opts
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        disable_background = { "lua", "typescript", "typescriptreact", "javascript" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
