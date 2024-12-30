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
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })
      local origin_make_entry = require("telescope.make_entry")
      local custom_make_entry = require("custom.telescope.make_entry")
      for key, value in pairs(custom_make_entry) do
        origin_make_entry[key] = value
      end

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        path_display = { "filename_first", "truncate" },
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

      return opts
    end,
  },
}
