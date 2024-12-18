return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
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
      scroll = {
        animate = {
          duration = { step = 10, total = 140 },
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
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      vim.api.nvim_set_hl(0, "NoicePopup", { link = "PMenu" })
    end,
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
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.section_separators = { right = "", left = "" }
      opts.options.component_separators = { right = "", left = "" }
    end,
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
