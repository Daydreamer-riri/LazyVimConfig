local isWSL = vim.fn.has("wsl") == 1
local avante_build_cmd = isWSL and "make"
  or "powershell -nologo -noprofile -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  }, -- for providers='copilot'
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    -- enabled = false,
    lazy = true,
    -- version = true,
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      -- add any opts here
      behaviour = {
        auto_suggestions = true, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      -- recommended settings
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        -- required for Windows users
        use_absolute_path = true,
      },
      -- copilot = {
      --   endpoint = "https://api.githubcopilot.com",
      --   model = "claude-3-5-sonnet-20241022",
      --   proxy = nil, -- [protocol://]host[:port] Use this proxy
      --   allow_insecure = false, -- Allow insecure server connections
      --   timeout = 30000, -- Timeout in milliseconds
      --   temperature = 0,
      --   max_tokens = 4096,
      -- },
    },
    -- if you want to download pre-built binary, then pass source=false. Make sure to follow instruction above.
    -- Also note that downloading prebuilt binary is a lot faster comparing to compiling from source.
    build = avante_build_cmd,
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      --- The below dependencies are optional,
      "echasnovski/mini.icons", -- or echasnovski/mini.icons
      -- {
      --   -- support for image pasting
      --   "HakonHarnes/img-clip.nvim",
      --   event = "VeryLazy",
      --   opts = {
      --     -- recommended settings
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       -- required for Windows users
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
      -- {
      --   -- Make sure to set this up properly if you have lazy=true
      --   'MeanderingProgrammer/render-markdown.nvim',
      --   opts = {
      --     file_types = { "markdown", "Avante" },
      --   },
      --   ft = { "markdown", "Avante" },
      -- },
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    },
  },
}
