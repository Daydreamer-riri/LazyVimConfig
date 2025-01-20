return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        completion = {
          menu = { border = "rounded" },
          documentation = { window = { border = "rounded" } },
        },
        signature = { window = { border = "rounded" } },
      })

      return opts
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options.separator_style = { "", "" }
      opts.options.tab_size = 20

      local get_hl = require("custom.hl-bufferline").hl

      opts.highlights = vim.tbl_deep_extend(
        "force",
        require("rose-pine.plugins.bufferline"),
        get_hl({
          c = {
            active_bg = "#3a3554",
          },
        })
      )

      return opts
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true

      return opts
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = function(_, opts)
      opts.cursor_color = "#8d87a3"
      opts.legacy_computing_symbols_support = true

      return opts
    end,
  },
}
