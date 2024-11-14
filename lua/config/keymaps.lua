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
keymap.set("n", "<C-a>", "<Cmd>lua MiniAnimate.execute_after('scroll', 'normal! gg<S-v>G')<CR>")

-- New tab
-- keymap.set("n", "te", ":tabedit", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

--- Split window
-- keymap.set("n", "ss", ":split<Return>", opts)
-- keymap.set("n", "sv", ":vsplit<Return>", opts)

-- - Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sk", "<C-w>k")

keymap.set({ "n", "v" }, "gh", "^")
keymap.set({ "v", "n" }, "gl", "$")

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-Left>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-Down>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-Up>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-Right>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
-- vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
-- vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
-- vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
-- vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- vim.keymap.set("n", "<leader>ut", function()
--   local value = vim.g.everforest_transparent_background
--   if value == 1 then
--     vim.g.everforest_transparent_background = 0
--     vim.list_extend
--   else
--     vim.g.everforest_transparent_background = 1
--   end
-- end, { noremap = true, desc = "Toggle Transparent" })

vim.keymap.del("n", "<leader>gl")
