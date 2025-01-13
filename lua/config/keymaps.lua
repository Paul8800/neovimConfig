--keymaps

-- Set leader key
vim.g.mapleader = " "

-- Utility for keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


local telescope = require('telescope')
local builtin = require("telescope.builtin")

-- Telescope keybindings
vim.keymap.set("n", "<C-p>", function()
  builtin.git_files()
end, { noremap = true, silent = true })

-- Ctrl-based shortcut for fuzzy finding
vim.keymap.set("n", "<Leader>pf", function()
    builtin.find_files({ cwd = "~/NeoVimProjects" })
end, opts)
-- Ctrl-based shortcut for fuzzy finding
--map("n", "<Leader>pf", ":Telescope find_files<CR>", opts) -- Fuzzy find with Ctrl+P

-- Telescope keybindings
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts) -- Find files
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts) -- Live grep
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)   -- Open buffers
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts) -- Help tags




-- Map <Tab> to go to the next buffer
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })

-- Map <Shift-Tab> to go to the previous buffer
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

-- Map <leader-x> to clode buffer
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })
map("n", "<Leader>x", ":bd<CR>", opts) -- Help tags

vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })


-- Shortcut for filetree
map("n", "<C-n>", ": NvimTreeToggle<CR>", opts)

-- Oil keybind
map("n", "<Leader>o", ":Oil<CR>", opts)


-- Run codeRunner bash file
vim.keymap.set("n", "<F5>", function()
    -- Save all buffers
    vim.api.nvim_command(":wa")

    -- Get the current file path and directory
    local file_path = vim.fn.expand("%:p") -- Full path of the current file
    local file_dir = vim.fn.expand("%:p:h") -- Directory of the current file

    -- Command to execute the batch file in an external terminal
    local cmd = string.format("gnome-terminal -- bash -c 'bash RC.sh \"%s\"; exec bash'", file_path)

    -- Execute the command
    os.execute(cmd)    
end, opts)
