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
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
  },
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      local left = opts.left
      local right = opts.right
      opts.left = right
      opts.right = left
      opts.animate = {
        enabled = false,
      }
    end,
  },
}
