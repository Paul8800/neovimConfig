--plugins.lua

-- lua/core/plugins.lua

require("lazy").setup({
  -- Telescope plugin
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.telescope") -- Loads lua/plugins/telescope.lua
    end,
  },

  -- NvChad plugin (specific version and branch)
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins", -- Import plugins from NvChad
    config = function()
      require("plugins.nvchad") -- Load custom NvChad configuration
    end,
  },

  -- Neoscroll plugin for smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins.neoscroll") -- Loads lua/plugins/neoscroll.lua
    end,
    event = "BufWinEnter", -- Ensure it loads when a buffer is opened
  },

  -- Oil plugin for file management
  {
    "stevearc/oil.nvim",
    config = function()
      require("plugins.oil") -- Loads lua/plugins/oil.lua
    end,
    lazy = false, -- Disable lazy loading to ensure the plugin loads on startup
  },

})

