--plugins.lua

-- lua/config/plugins.lua

require("lazy").setup({

"nvim-lua/plenary.nvim",

  -- Telescope plugin
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.telescope") -- Loads lua/plugins/telescope.lua
    end,
  },

  -- Treesitter plugin
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- LSPConfig plugin
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lspconfig")
    end,
  },
  
  --CMP pluggin
  {
  "hrsh7th/nvim-cmp", -- Completion plugin
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",   -- Buffer completion source
    "hrsh7th/cmp-path",     -- Path completion source
    "saadparwaiz1/cmp_luasnip", -- LuaSnip completion source (optional)
    "L3MON4D3/LuaSnip" -- Snippets engine
  },
    config = function()
      require("cmp").setup({
        -- Add your custom cmp setup here
      })
    end,
  },

  -- Neoscroll plugin for smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins.neoScroll") -- Loads lua/plugins/neoscroll.lua
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

  -- nvim-tree plugin for file tree
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvim-tree") -- Load the configuration from plugins/nvim-tree.lua
    end,
  },


  -- lua rocks plugin for managing luarocks packages
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },


  -- git plugin for info about git
  {
      "lewis6991/gitsigns.nvim",
      event = { "BufReadPost", "BufNewFile" }, -- Lazy-load on file read
      config = function()
      require("gitsigns").setup()
      end,
  },


  -- Add base46 plugin
  {
    "NvChad/base46",  -- Base46 plugin for NvChad
    config = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },

  "nvzone/volt",
  "nvzone/menu",
  --{ "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },


  -- ui plugin
  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },




  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Can be "latte", "frappe", "macchiato", or "mocha"
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

})

