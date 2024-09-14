return {
  {
    "akinsho/bufferline.nvim",
    keys = {},
    opts = {
      options = {
        -- mode = "tabs",
        -- separator_style = "slant",
        indicator = {
          icon = "▌", -- this should be omitted if indicator style is not 'icon'
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "folke/noice.nvim",
    enabled = true,
    commit = "d9328ef903168b6f52385a751eb384ae7e906c6f",
    opts = {
      lsp = {
        hover = {
          silent = true,
        },
      },
    },
  },
  {
    "DNLHC/glance.nvim",
    opts = function()
      vim.api.nvim_set_hl(0, "GlanceListNormal", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "GlancePreviewNormal", { link = "NormalFloat" })
    end,
    keys = {
      { "gpd", "<CMD>Glance definitions<CR>", mode = { "n" }, desc = "Glance definitions" },
      { "gpr", "<CMD>Glance references<CR>", mode = { "n" }, desc = "Glance references" },
      { "gpy", "<CMD>Glance type_definitions<CR>", mode = { "n" }, desc = "Glance type definitions" },
      { "gpi", "<CMD>Glance implementations<CR>", mode = { "n" }, desc = "Glance implementations" },
    },
  },
  {
    "dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
██╗  ██╗██╗     ██████╗ ██╗██████╗ ██╗
██║  ██║██║     ██╔══██╗██║██╔══██╗██║
███████║██║     ██████╔╝██║██████╔╝██║
██╔══██║██║     ██╔══██╗██║██╔══██╗██║
██║  ██║██║▄█╗  ██║  ██║██║██║  ██║██║
╚═╝  ╚═╝╚═╝╚═╝  ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      -- local colors = require("solarized-osaka.colors").setup()
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
    "f-person/git-blame.nvim",
    opts = function(_, opts)
      LazyVim.toggle.map("<leader>ug", {
        name = "Git Blame",
        get = function()
          return vim.g.gitblame_enabled
        end,
        set = function(state)
          vim.g.gitblame_enabled = state
        end,
      })
    end,
  },
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
      -- vim.api.nvim_set_hl(0, "MiniAnimateNormalFloat", { bg = nil })
      local animate = require("mini.animate")
      opts.close = { enable = false }
      opts.open = { enable = false }
      opts.scroll.timing = animate.gen_timing.linear({ duration = 80, unit = "total" })
      opts.cursor = { timing = animate.gen_timing.linear({ duration = 80, unit = "total" }) }
    end,
  },
}
