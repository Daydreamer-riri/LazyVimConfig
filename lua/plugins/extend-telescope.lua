vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
        keys = {},
        opts = {
          extensions = {
            live_grep_args = {
              mappings = {
                i = {
                  ["<C-k>"] = function(picker)
                    require("telescope-live-grep-args.actions").quote_prompt()(picker)
                  end,
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>/",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep with Args (root dir)",
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })
      local telescope = require("telescope")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        path_display = { "filename_first" },
      })
      opts.extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ["<C-k>"] = function(picker)
                require("telescope-live-grep-args.actions").quote_prompt()(picker)
              end,
            },
          },
        },
        package_info = {
          theme = "ivy",
        },
      }

      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("package_info")
    end,
  },
}
