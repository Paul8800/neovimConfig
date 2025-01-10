local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- Add languages as needed
  highlight = {
    enable = true, -- Enable syntax highlighting
  },
  indent = {
    enable = true, -- Enable indentation based on syntax
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
