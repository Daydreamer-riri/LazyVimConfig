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
      },
    },
  },
}
