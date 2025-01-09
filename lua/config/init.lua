-- Load basic settings and configurations
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Load plugins and mappings
require("config.plugins")   -- Loads lua/core/plugins.lua
require("config.keymaps")  -- Loads lua/core/mappings.lua

-- Load theme
pcall(function()
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")
end)

require "options"
require "nvchad.autocmds"

-- Line number configuration
vim.opt.number = true         -- Enable absolute line numbers for the current line
vim.opt.relativenumber = true -- Enable relative line numbers for all other lines
vim.cmd [[
  highlight CursorLineNr guifg=#FFD700 guibg=#2E3440
]]
vim.wo.cursorline = true

vim.cmd [[
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
]]


-- Set working directory
vim.cmd([[cd ~/NeoVimProjects/]])
vim.cmd([[set scrolloff=10]])
