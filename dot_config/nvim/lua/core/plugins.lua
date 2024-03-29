-- vsenv = require('core.vsenv')
-- vsenv.setVS22Env()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Example using a list of specs with the default options
vim.g.mapleader = " "
-- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  -- common dependencies
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lua/plenary.nvim' },

  -- colorschemes 
  -- { 'rebelot/kanagawa.nvim' },
  -- { 'joshdick/onedark.vim' },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },


  -- general plugins

  -- LSP config
	{ 'neovim/nvim-lspconfig' },
  -- Treesitter
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	{ -- Neo Tree
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			-- "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},
  { -- oil
    'stevearc/oil.nvim', --[[ opts = {}, dependencies = { "nvim-tree/nvim-web-devicons" }, ]]
  },

  -- cmp
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'petertriho/cmp-git', --[[ dependencies = { 'pnvim-lua/plenary.nvim' } ]] },
	{ 'hrsh7th/cmp-cmdline' },

  -- snippet engine
  { 'dcampos/nvim-snippy' },
  { 'dcampos/cmp-snippy' },

  { 'nvim-lualine/lualine.nvim' },
  {
    'folke/trouble.nvim',
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- opts = { },
  },
  { -- Telescope
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    -- dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { -- navic
    'SmiteshP/nvim-navic',
    -- dependencies = { 'neovim/nvim-lspconfig' },
  },
})
