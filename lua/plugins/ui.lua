return {
  {
    "tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        -- floats = "transparent",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {},
    opts = {
      options = {
        -- mode = "tabs",
        -- separator_style = "slant",
        indicator = {
          icon = "▌", -- this should be omitted if indicator style is not 'icon'
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  { "folke/noice.nvim", enabled = true, commit = "d9328ef903168b6f52385a751eb384ae7e906c6f" },
  -- {
  --   "folke/edgy.nvim",
  --   opts = function(_, opts)
  --     local left = opts.left
  --     local right = opts.right
  --     opts.left = right
  --     opts.right = left
  --     opts.animate = {
  --       enabled = false,
  --     }
  --   end,
  -- },
}
