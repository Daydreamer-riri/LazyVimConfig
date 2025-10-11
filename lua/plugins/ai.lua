return {
  {
    "folke/sidekick.nvim",
    --- @module 'sidekick'
    --- @type sidekick.config
    opts = {
      signs = {
        icon = "󰞔 ",
      },
      cli = {
        prompts = {
          commit = "Can you help me commit current changes",
        },
        mux = {
          enabled = true,
          -- create = "window",
        },
      },
    },
    keys = {
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}\n{this}\n" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
    },
  },
}
