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
          duration = { total = 150 },
        },
      },
      indent = {
        scope = {
          enabled = false,
        },
        chunk = {
          enabled = true,
          char = {
            corner_top = "╭",
            corner_bottom = "╰",
          },
          hl = "Purple",
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "gb", "<CMD>BufferLinePick<CR>", mode = { "n" }, desc = "BufferLine Pick" },
    },
    ---@module 'bufferline'
    ---@type fun(_, opts: bufferline.UserConfig): bufferline.UserConfig
    opts = function(_, opts)
      opts.options.show_buffer_close_icons = false
      opts.options.show_close_icon = false
      opts.options.indicator = { icon = "" }
      opts.options.separator_style = "slope"

      -- custom theme

      local config = vim.fn["gruvbox_material#get_configuration"]()
      local palette =
        vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
      local c = {
        inactive_bg = palette.bg3[1],
        inactive_fg = palette.fg0[1],
        active_bg = palette.grey2[1],
        active_fg = palette.bg0[1],
        bg = palette.bg_statusline1[1],
      }

      local light_palette = {
        blue = "#226b79",
        yellow = "#7a520a",
        red = "#af2528",
        green = "#64681a",
        aqua = "#477a5b",
        orange = "#b94c07",
        purple = "#924f79",
      }

      local dark_pattle = {
        yellow = palette.yellow[1],
        red = palette.red[1],
        blue = palette.blue[1],
      }

      opts.highlights = {
        fill = { bg = c.bg },
        background = { bg = c.inactive_bg, fg = c.inactive_fg },
        buffer_visible = { bg = c.inactive_bg },
        buffer_selected = { bg = c.active_bg, fg = c.active_fg },
        -- Duplicate
        duplicate_selected = { bg = c.active_bg, fg = palette.bg5[1] },
        duplicate_visible = { bg = c.inactive_bg },
        duplicate = { bg = c.inactive_bg },
        warning = { bg = c.inactive_bg, fg = c.inactive_fg },
        warning_visible = { bg = c.inactive_bg, fg = c.inactive_fg },
        warning_diagnostic = { bg = c.inactive_bg, fg = dark_pattle.yellow },
        warning_diagnostic_visible = { bg = c.inactive_bg, fg = dark_pattle.yellow },
        warning_selected = { bg = c.active_bg, fg = light_palette.yellow },
        warning_diagnostic_selected = { bg = c.active_bg, fg = light_palette.yellow },
        error = { bg = c.inactive_bg, fg = c.inactive_fg },
        error_visible = { bg = c.inactive_bg, fg = c.inactive_fg },
        error_diagnostic = { bg = c.inactive_bg, fg = dark_pattle.red },
        error_diagnostic_visible = { bg = c.inactive_bg, fg = dark_pattle.red },
        error_selected = { bg = c.active_bg, fg = light_palette.red },
        error_diagnostic_selected = { bg = c.active_bg, fg = light_palette.red },
        -- Infos
        info = { fg = c.inactive_fg, bg = c.inactive_bg },
        info_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
        info_selected = { fg = light_palette.blue, bg = c.active_bg },
        info_diagnostic = { fg = dark_pattle.blue, bg = c.inactive_bg },
        info_diagnostic_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
        info_diagnostic_selected = { fg = light_palette.blue, bg = c.active_bg },
        -- Modified
        modified = { bg = c.inactive_bg },
        modified_visible = { bg = c.inactive_bg },
        modified_selected = { bg = c.active_bg, fg = light_palette.green },
        -- Diagnostics
        diagnostic = { bg = c.inactive_bg },
        diagnostic_visible = { bg = c.inactive_bg },
        diagnostic_selected = { bg = c.active_bg },
        -- Hint
        hint = { fg = c.inactive_fg, bg = c.inactive_bg },
        hint_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
        hint_selected = { fg = light_palette.green, bg = c.active_bg },
        hint_diagnostic = { fg = c.inactive_fg, bg = c.inactive_bg },
        hint_diagnostic_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
        hint_diagnostic_selected = { fg = light_palette.green, bg = c.active_bg },
        -- Pick
        pick = { bg = c.inactive_bg },
        pick_visible = { bg = c.inactive_bg },
        pick_selected = { bg = c.active_bg, fg = light_palette.red },
        -- separators
        separator = { bg = c.inactive_bg, fg = c.bg },
        separator_visible = { bg = c.inactive_bg, fg = c.bg },
        separator_selected = { fg = c.bg, bg = c.active_bg },
        offset_separator = { fg = c.bg, bg = c.bg },
        -- tabs
        tab = { fg = c.inactive_fg, bg = c.inactive_bg },
        tab_selected = { fg = c.active_fg, bg = c.active_bg },
        tab_separator = { fg = c.bg, bg = c.inactive_bg },
        tab_separator_selected = { fg = c.bg, bg = c.active_bg },
      }

      local set_hl = require("snacks.util").set_hl

      set_hl({
        AzureSelected = { bg = c.active_bg, fg = light_palette.blue },
        BlueSelected = { bg = c.active_bg, fg = light_palette.blue },
        CyanSelected = { bg = c.active_bg, fg = light_palette.aqua },
        GreenSelected = { bg = c.active_bg, fg = light_palette.green },
        OrangeSelected = { bg = c.active_bg, fg = light_palette.orange },
        PurpleSelected = { bg = c.active_bg, fg = light_palette.purple },
        RedSelected = { bg = c.active_bg, fg = light_palette.red },
        YellowSelected = { bg = c.active_bg, fg = light_palette.yellow },
      }, {
        prefix = "BufferLineMiniIcons",
        default = true,
      })

      return opts
    end,
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
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "Copilot is not recommended as the default auto suggestion provider",
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
      trailing_stiffness = 0.3, -- 0.25     [0, 1]
      distance_stop_animating = 0.2, -- 0.1      > 0
      hide_target_hack = false, -- true     boolean
    },
  },
}
