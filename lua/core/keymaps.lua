-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- Exit insert mode quickly
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Buffer navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })

-- Clear search highlights
keymap.set("n", "nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Delete single character without copying
keymap.set("n", "x", '"_x', { desc = "Delete character without copying" })

-- Increment/decrement numbers under cursor
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number under cursor" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number under cursor" })

-- Window splits
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make all splits equal size" })
keymap.set("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close current split window" })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
