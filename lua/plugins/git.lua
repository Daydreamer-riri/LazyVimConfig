return {
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    version = "*",
    opts = {
      default_mappings = {
        ours = "<leader>gho",
        theirs = "<leader>ght",
        none = "<leader>gh0",
        both = "<leader>ghb",
        next = "]x",
        prev = "[x",
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
}
