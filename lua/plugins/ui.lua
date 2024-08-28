return {
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
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "LazyFile",
    opts = function()
      return {
        chunk = {
          enable = true,
          -- duration = 5,
          delay = 0,
        },
        indent = {
          enable = true,
        },
      }
    end,
  },
  {
    "DNLHC/glance.nvim",
    keys = {
      { "gpd", "<CMD>Glance definitions<CR>", mode = { "n" }, desc = "Glance definitions" },
      { "gpr", "<CMD>Glance references<CR>", mode = { "n" }, desc = "Glance references" },
      { "gpy", "<CMD>Glance type_definitions<CR>", mode = { "n" }, desc = "Glance type definitions" },
      { "gpi", "<CMD>Glance implementations<CR>", mode = { "n" }, desc = "Glance implementations" },
    },
  },
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
