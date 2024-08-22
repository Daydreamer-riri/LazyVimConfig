return {
  {
    "neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      -- {
      --   "<leader>fP",
      --   function()
      --     require("telescope.builtin").find_files({
      --       cwd = require("lazy.core.config").options.root,
      --     })
      --   end,
      --   desc = "Find Plugin File",
      -- },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({
            additional_args = { "--hidden" },
          })
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";t",
        function()
          -- local builtin = require("telescope.builtin")
          -- builtin.help_tags()
          local builtin = require("telescope.builtin")
          local previewers = require("telescope.previewers")

          local delta = previewers.new_termopen_previewer({
            get_command = function(entry)
              -- note we can't use pipes
              -- this command is for git_commits and git_bcommits
              -- return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }

              -- this is for status
              -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
              -- just do an if and return a different command
              return {
                "git",
                "-c",
                "core.pager=delta",
                "-c",
                "delta.side-by-side=false",
                "-c",
                "delta.paging=never",
                "diff",
                entry.value,
              }
            end,
          })

          local _opts = {}
          _opts.previewer = delta
          builtin.git_status(_opts)
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      -- {
      --   ";;",
      --   function()
      --     local builtin = require("telescope.builtin")
      --     builtin.resume()
      --   end,
      --   desc = "Resume the previous telescope picker",
      -- },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      -- {
      --   ";s",
      --   function()
      --     local builtin = require("telescope.builtin")
      --     builtin.treesitter()
      --   end,
      --   desc = "Lists Function names, variables, from Treesitter",
      -- },
      {
        "sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = true,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          -- theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
  { "axelvc/template-string.nvim", config = true },
}
