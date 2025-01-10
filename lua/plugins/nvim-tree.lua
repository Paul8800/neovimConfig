-- plugins/nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    side = "left",
    -- If you're using a transparent terminal, you can set a transparent background
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        width = 30,
        height = 30,
        row = 2,
        col = 2,
        style = "minimal",  -- This keeps the background transparent for the floating window
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
