-- lua/plugins/neoscroll.lua

require("neoscroll").setup({
  -- Key mappings for smooth scrolling
  mappings = {
    '<C-u>', '<C-d>', '<C-b>', '<C-f>',
    '<C-y>', '<C-e>', 'zt', 'zz', 'zb'
  },
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- Cursor keeps scrolling even if the window cannot
})
