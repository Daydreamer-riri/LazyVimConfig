-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

---  Delete a word backwords
keymap.set("n", "dw", 'vb"_d')

--- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set(
  "n",
  "<leader>xe",
  "<Cmd>Trouble diagnostics filter.severity=vim.diagnostic.severity.ERROR<CR>",
  { desc = "Diagnostic ERROR" }
)

keymap.set({ "n", "v" }, "gh", "^")
keymap.set({ "v", "n" }, "gl", "$")

if vim.g.vscode then
  keymap.set({ "n" }, "<leader>k", vim.lsp.buf.hover)
end

vim.keymap.del("n", "<leader>gl")
