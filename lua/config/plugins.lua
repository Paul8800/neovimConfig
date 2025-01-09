--plugins

require("lazy").setup({
  -- Telescope plugin
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
      require("plugins.telescope") -- Loads lua/plugins/telescope.lua
    end,
  },
})
