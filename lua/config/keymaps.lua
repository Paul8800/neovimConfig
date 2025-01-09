--keymaps

-- Set leader key
vim.g.mapleader = " "

-- Utility for keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope keybindings
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts) -- Find files
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts) -- Live grep
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)   -- Open buffers
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts) -- Help tags

-- Ctrl-based shortcut for fuzzy finding
map("n", "<C-p>", ":Telescope find_files<CR>", opts) -- Fuzzy find with Ctrl+P

-- Oil keybind
map("n", "<Leader>o", ":Oil<CR>", opts) -- Help tags

