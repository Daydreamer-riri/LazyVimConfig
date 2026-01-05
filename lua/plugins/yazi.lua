return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fy",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>fY",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  --- @module 'yazi'
  ---@type fun(_: any, opts:YaziConfig):YaziConfig
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "YaziFloat", { link = "NormalFloat", default = true })
    opts.hooks = opts.hooks or {}
    local backdrop = Snacks.win.new({ width = 0.1, height = 0.1, show = false })
    opts.hooks.before_opening_window = function()
      backdrop:show()
    end
    opts.hooks.yazi_closed_successfully = function()
      backdrop:close()
    end
    return vim.tbl_deep_extend("force", opts, {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      open_multiple_tabs = true,

      highlight_hovered_buffers_in_same_directory = false,

      keymaps = {
        show_help = "<f1>",
        replace_in_directory = "<c-r>",
      },
      integrations = {
        grep_in_directory = "snacks.picker",
        grep_in_selected_files = "snacks.picker",
      },
    })
  end,
}
