return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
     ______ _      _ _        _____           _      
     | ___ (_)    (_| )      /  __ \         | |     
     | |_/ /_ _ __ _|/ ___   | /  \/ ___   __| | ___ 
     |    /| | '__| | / __|  | |    / _ \ / _` |/ _ \
     | |\ \| | |  | | \__ \  | \__/\ (_) | (_| |  __/
     \_| \_|_|_|  |_| |___/   \____/\___/ \__,_|\___|
]],
          -- stylua: ignore
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            cmd = "",
            height = 5,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {},
    opts = {
      options = {
        indicator = {
          icon = "▌",
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "folke/noice.nvim",
    lazy = false,
    opts = {
      lsp = {
        hover = {
          silent = true,
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "DNLHC/glance.nvim",
    opts = function() end,
    keys = {
      { "gpd", "<CMD>Glance definitions<CR>", mode = { "n" }, desc = "Glance definitions" },
      { "gpr", "<CMD>Glance references<CR>", mode = { "n" }, desc = "Glance references" },
      { "gpy", "<CMD>Glance type_definitions<CR>", mode = { "n" }, desc = "Glance type definitions" },
      { "gpi", "<CMD>Glance implementations<CR>", mode = { "n" }, desc = "Glance implementations" },
    },
  },
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  -- {
  --   "f-person/git-blame.nvim",
  --   opts = function(_, opts)
  --     LazyVim.toggle.map("<leader>ug", {
  --       name = "Git Blame",
  --       get = function()
  --         return vim.g.gitblame_enabled
  --       end,
  --       set = function(state)
  --         vim.g.gitblame_enabled = state
  --       end,
  --     })
  --     vim.g.gitblame_enabled = false
  --   end,
  -- },
  {
    "petertriho/nvim-scrollbar",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.section_separators = { right = "", left = "" }
      opts.options.component_separators = { right = "", left = "" }
    end,
  },
  {
    "echasnovski/mini.animate",
    enabled = vim.g.neovide ~= true,
    opts = function(_, opts)
      local animate = require("mini.animate")
      opts.close = { enable = false }
      opts.open = { enable = false }
      opts.scroll.timing = animate.gen_timing.linear({ duration = 80, unit = "total" })
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 200,
      },
      plugins = {
        twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- commit = "e7a4442e055ec953311e77791546238d1eaae507",
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = "#d4be98",
      legacy_computing_symbols_support = true,
      -- stiffness = 0.8, -- 0.6      [0, 1]
      trailing_stiffness = 0.4, -- 0.25     [0, 1]
      distance_stop_animating = 0.5, -- 0.1      > 0
      hide_target_hack = false, -- true     boolean
    },
  },
}
