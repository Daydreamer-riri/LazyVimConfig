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
        win = {
          split = {
            width = math.min(math.floor(vim.o.columns * 0.35), 80),
          },
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
