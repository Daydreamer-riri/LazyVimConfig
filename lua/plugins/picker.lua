return {
  {

    "folke/snacks.nvim",
    opts = function(_, opts)
      local layouts = require("snacks.picker.config.layouts")
      layouts.sidebar.layout.position = "right"

      return opts
    end,
  },
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
        ---@class snacks.picker.previewers.Config
        previewers = {
          diff = {
            builtin = false,
            cmd = { "delta" },
          },
          git = {
            builtin = false,
          },
        },
      },
    },
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Find Files (Root Dir)",
      },
    },
  },
}
