return {
  "harrisoncramer/gitlab.nvim",
  branch = "390-plugin-fails-to-build",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    -- "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    -- "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
  },
  enabled = true,
  event = "VeryLazy",
  build = function()
    require("gitlab.server").build(true)
  end, -- Builds the Go binary
  opts = {
    keymaps = {
      global = {
        add_assignee = "<leader>glaa",
        delete_assignee = "<leader>glad",
        add_label = "<leader>glla",
        delete_label = "<leader>glld",
        add_reviewer = "<leader>glra",
        delete_reviewer = "<leader>glrd",
        approve = "<leader>glA", -- Approve MR
        revoke = "<leader>glR", -- Revoke MR approval
        merge = "<leader>glM", -- Merge the feature branch to the target branch and close MR
        create_mr = "<leader>glC", -- Create a new MR for currently checked-out feature branch
        choose_merge_request = "<leader>glc", -- Chose MR for review (if necessary check out the feature branch)
        start_review = "<leader>glS", -- Start review for the currently checked-out branch
        summary = "<leader>gls", -- Show the editable summary of the MR
        copy_mr_url = "<leader>glu", -- Copy the URL of the MR to the system clipboard
        open_in_browser = "<leader>glo", -- Openthe URL of the MR in the default Internet browser
        create_note = "<leader>gln", -- Create a note (comment not linked to a specific line)
        pipeline = "<leader>glp", -- Show the pipeline status
        toggle_discussions = "<leader>gld", -- Toggle the discussions window
        toggle_draft_mode = "<leader>glD", -- Toggle between draft mode (comments posted as drafts) and live mode (comments are posted immediately)
        publish_all_drafts = "<leader>glP", -- Publish all draft comments/notes
      },
      popup = {
        discard_changes = "q",
      },
    },
    discussion_tree = {
      -- position = "botttom",
      auto_open = false,
    },
  },
}
