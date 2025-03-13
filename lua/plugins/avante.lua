local isWSL = vim.fn.has("wsl") == 1
local avante_build_cmd = isWSL and "make"
  or "powershell -nologo -noprofile -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"

-- prefil edit window with common scenarios to avoid repeating query and submit immediately
local prefill_edit_window = function(request)
  require("avante.api").edit()
  local code_bufnr = vim.api.nvim_get_current_buf()
  local code_winid = vim.api.nvim_get_current_win()
  if code_bufnr == nil or code_winid == nil then
    return
  end
  vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
  -- Optionally set the cursor position to the end of the input
  vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
  -- Simulate Ctrl+S keypress to submit
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, true, true), "v", true)
end

-- NOTE: most templates are inspired from ChatGPT.nvim -> chatgpt-actions.json
local avante_grammar_correction = "Correct the text to standard English, but keep any code blocks inside intact."
local avante_keywords = "Extract the main keywords from the following text"
local avante_code_readability_analysis = [[
  You must identify any readability issues in the code snippet.
  Some readability issues to consider:
  - Unclear naming
  - Unclear purpose
  - Redundant or obvious comments
  - Lack of comments
  - Long or complex one liners
  - Too much nesting
  - Long variable names
  - Inconsistent naming and code style.
  - Code repetition
  You may identify additional problems. The user submits a small section of code from a larger file.
  Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
  If there's no issues with code respond with only: <OK>
]]
local avante_optimize_code = "Optimize the following code"
local avante_summarize = "Summarize the following text"
local avante_translate = "Translate this into Chinese, but keep any code blocks inside intact"
local avante_explain_code = "Explain the following code"
local avante_complete_code = "Complete the following codes written in " .. vim.bo.filetype
local avante_add_docstring = "Add docstring to the following codes"
local avante_fix_bugs = "Fix the bugs inside the following codes if any"
local avante_add_tests = "Implement tests for the following code"

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  }, -- for providers='copilot'
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    -- enabled = false,
    lazy = true,
    -- version = true,
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      copilot = {
        model = "claude-3.7-sonnet",
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = true,
      },
      mappings = {
        suggestion = {
          -- accept = "<C-l>",
        },
      },
      file_selector = {
        provider = "snacks",
        provider_opts = {},
      },
    },
    build = avante_build_cmd,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      "echasnovski/mini.icons",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>ax",
        function()
          require("avante.api").ask({ question = avante_explain_code })
        end,
        desc = "Explain Code(ask)",
        mode = { "n", "v" },
      },
      {
        "<leader>ab",
        function()
          require("avante.api").ask({ question = avante_fix_bugs })
        end,
        desc = "Fix Bugs(ask)",
        mode = { "n", "v" },
      },
      {
        "<leader>au",
        function()
          require("avante.api").ask({ question = avante_add_tests })
        end,
        desc = "Add Tests(ask)",
        mode = { "n", "v" },
      },
      {
        "<leader>al",
        function()
          require("avante.api").ask({ question = avante_code_readability_analysis })
        end,
        desc = "Code Readability Analysis(ask)",
        mode = { "n", "v" },
      },
      {
        "<leader>ao",
        function()
          require("avante.api").ask({ question = avante_optimize_code })
        end,
        desc = "Optimize Code(ask)",
        mode = { "n", "v" },
      },
      {
        "<leader>ag",
        function()
          require("avante.api").ask({ question = avante_grammar_correction })
        end,
        desc = "Grammar Correction(ask)",
        mode = { "n", "v" },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "Saghen/blink.compat" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        compat = {
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
      },
    },
  },
}
