return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ focus = true, name = "copilot" })
        end,
        desc = "Sidekick Toggle CLI",
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").select_prompt()
        end,
        desc = "Sidekick Prompt Picker",
        mode = { "n", "v" },
      },
    },
  },
}
