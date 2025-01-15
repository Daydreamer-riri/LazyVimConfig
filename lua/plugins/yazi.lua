local backdrop = nil

return {
  "Daydreamer-riri/yazi.nvim", -- support nushell on windows
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
    return vim.tbl_deep_extend("force", opts, {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      open_multiple_tabs = true,

      -- enable these if you are using the latest version of yazi
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,
      highlight_hovered_buffers_in_same_directory = false,

      keymaps = {
        show_help = "<f1>",
        replace_in_directory = "<c-r>",
      },
      integrations = {
        grep_in_directory = function(dir)
          Snacks.picker.grep({
            dirs = { dir },
            on_show = function()
              vim.api.nvim_feedkeys("i", "n", false)
            end,
          })
        end,
      },
      hooks = {
        yazi_opened = function()
          backdrop = Snacks.win({
            style = "float",
            focusable = false,
            height = 0.1,
            width = 0.1,
          })
        end,
        yazi_closed_successfully = function()
          if backdrop then
            backdrop:close()
          end
          backdrop = nil
        end,
      },
    })
  end,
}
