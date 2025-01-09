-- Load basic settings and configurations
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Load plugins and mappings
require("config.plugins")   -- Loads lua/core/plugins.lua
require("config.keymaps")  -- Loads lua/core/mappings.lua
