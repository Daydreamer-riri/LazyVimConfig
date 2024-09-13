---@type LazySpec
return {
  "Daydreamer-riri/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
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
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "YaziFloat", { link = "NormalFloat", default = true })
    return vim.tbl_extend("force", opts, {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      open_multiple_tabs = true,

      -- enable these if you are using the latest version of yazi
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,
      highlight_hovered_buffers_in_same_directory = true,

      keymaps = {
        show_help = "<f1>",
      },
    })
  end,
}
