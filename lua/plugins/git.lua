return {
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    version = "*",
    opts = {
      default_mappings = {
        ours = "<leader>ho",
        theirs = "<leader>ht",
        none = "<leader>h0",
        both = "<leader>hb",
        next = "]x",
        prev = "[x",
      },
      highlights = {
        incoming = "DiffAdd",
        current = "DiffChange",
        ancestor = "DiffDelete",
      },
    },
    keys = {
      {
        "<leader>gx",
        "<cmd>GitConflictListQf<cr>",
        desc = "List Conflicts",
      },
      {
        "<leader>gr",
        "<cmd>GitConflictRefresh<cr>",
        desc = "Refresh Conflicts",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          -- disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = true, -- See |diffview-config-view.x.winbar_info|
        },
      },
      default_args = {
        DiffviewOpen = { "--imply-local" },
      },
    },
    keys = {
      {
        "<leader>gv",
        "<cmd>DiffviewOpen<cr>",
        desc = "open diffview",
      },
      {
        "<leader>hh",
        function()
          local file_path = vim.fn.expand("%")
          vim.cmd("DiffviewFileHistory " .. file_path)
        end,
        desc = "open current file history",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
    keys = {
      {
        "<leader>h",
        "",
        desc = "+git hunk",
        mode = { "n", "v" },
      },
      {
        "<leader>hb",
        "<cmd>Gitsigns blame_line<cr>",
        desc = "Blame Line",
      },
      {
        "<leader>hs",
        "<cmd>Gitsigns stage_hunk<cr>",
        desc = "Stage Hunk",
      },
      {
        "<leader>hS",
        "<cmd>Gitsigns stage_buffer<cr>",
        desc = "Stage Buffer",
      },
      {
        "<leader>hr",
        "<cmd>Gitsigns reset_hunk<cr>",
        desc = "Reset Hunk",
      },
      {
        "<leader>hR",
        "<cmd>Gitsigns reset_buffer<cr>",
        desc = "Reset Buffer",
      },
      {
        "<leader>hu",
        "<cmd>Gitsigns undo_stage_hunk<cr>",
        desc = "Undo Stage Hunk",
      },
      {
        "<leader>hp",
        "<cmd>Gitsigns preview_hunk_inline<cr>",
        desc = "Preview Hunk Inline",
      },
      {
        "<leader>hd",
        function()
          require("gitsigns").diffthis()
        end,
        desc = "Diff this",
      },
      {
        "<leader>hD",
        function()
          require("gitsigns").diffthis("~")
        end,
        desc = "Diff this ~",
      },
    },
  },
  {
    "stevenxxiu/neogit",
    dependencies = {
      {
        "m00qek/baleia.nvim",
        config = function()
          vim.g.baleia = require("baleia").setup({})
        end,
      },
    },
    opts = {
      log_pager = { "delta", "--width", "117" },
      disable_context_highlighting = true,
    },
    keys = {
      {
        "<leader>gn",
        function()
          require("neogit").open()
        end,
        desc = "Open Neogit",
      },
      {
        "<leader>gc",
        function()
          require("neogit").open({ "commit" })
        end,
        desc = "Open Neogit Commit",
      },
    },
  },
}
