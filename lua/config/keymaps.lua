--keymaps

-- Set leader key
vim.g.mapleader = " "

-- Utility for keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


local builtin = require("telescope.builtin")

-- Telescope keybindings
vim.keymap.set("n", "<C-p>", function()
  builtin.git_files()
end, { noremap = true, silent = true })


-- Telescope keybindings
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts) -- Find files
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts) -- Live grep
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)   -- Open buffers
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts) -- Help tags

-- Ctrl-based shortcut for fuzzy finding
map("n", "<Leader>pf", ":Telescope find_files<CR>", opts) -- Fuzzy find with Ctrl+P

-- Map <Tab> to go to the next buffer
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })

-- Map <Shift-Tab> to go to the previous buffer
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

-- Map <leader-x> to clode buffer
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })
map("n", "<Leader>x", ":bd<CR>", opts) -- Help tags




-- Shortcut for filetree
map("n", "<C-n>", ": NvimTreeToggle<CR>", opts)

-- Oil keybind
map("n", "<Leader>o", ":Oil<CR>", opts)

