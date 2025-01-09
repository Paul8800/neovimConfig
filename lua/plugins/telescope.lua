-- plugins/telescope.lua

local telescope = require("telescope")
telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    path_display = { "truncate" },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true, -- Include hidden files
    },
  },
  extensions = {
    -- Extensions can be configured here
  },
})

-- Load extensions if any
-- telescope.load_extension("fzf") -- Example extension

