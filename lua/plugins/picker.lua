return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<c-l>"] = { "toggle_live", mode = { "i", "n" } },
            },
          },
        },
        formatters = {
          file = {
            filename_first = true,
          },
        },
      },
    },
  },
}
