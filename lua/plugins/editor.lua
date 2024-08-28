local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
  local mode = vim.fn.mode(true)
  -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
  local is_visual = mode == "v" or mode == "V" or mode == "\22"
  local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
  local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
  return require("dial.map")[func](group)
end

return {
  {
    "neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
  { "axelvc/template-string.nvim", config = true },
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<leader>i",
        function()
          return M.dial(true)
        end,
        expr = true,
        desc = "Increment",
        mode = { "n", "v" },
      },
      {
        "<leader>I",
        function()
          return M.dial(false)
        end,
        expr = true,
        desc = "Decrement",
        mode = { "n", "v" },
      },
    },
  },
  {
    "mini.pairs",
    -- enabled = false,
    opts = function(_, opts)
      opts.mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
        ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },

        [">"] = { action = "open", pair = "><", neigh_pattern = "[^\\]." },
        ["<"] = { action = "close", pair = "><", neigh_pattern = "[^\\]." },
      }
      return opts
    end,
  },
  { "dmmulroy/ts-error-translator.nvim" },
  {
    "dmmulroy/tsc.nvim",
    opts = {
      use_trouble_qflist = true,
      use_diagnostics = true,
    },
  },
}
