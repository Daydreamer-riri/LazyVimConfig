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
  { "folke/noice.nvim", enabled = true, commit = "d9328ef903168b6f52385a751eb384ae7e906c6f" },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "LazyFile",
    opts = function()
      return {
        chunk = {
          enable = true,
          -- duration = 5,
          delay = 0,
        },
        indent = {
          enable = true,
        },
      }
    end,
  },
  {
    "DNLHC/glance.nvim",
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
██╗  ██╗██╗   ██████╗ ██╗██████╗ ██╗
██║  ██║██║   ██╔══██╗██║██╔══██╗██║
███████║██║   ██████╔╝██║██████╔╝██║
██╔══██║██║   ██╔══██╗██║██╔══██╗██║
██║  ██║██║▄█╗██║  ██║██║██║  ██║██║
╚═╝  ╚═╝╚═╝╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝
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
  -- {
  --   "folke/edgy.nvim",
  --   opts = function(_, opts)
  --     local left = opts.left
  --     local right = opts.right
  --     opts.left = right
  --     opts.right = left
  --     opts.animate = {
  --       enabled = false,
  --     }
  --   end,
  -- },
}
