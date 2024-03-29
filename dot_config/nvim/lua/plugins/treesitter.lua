require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c" },
 
  auto_install = true,
	sync_install = true,
	highlight = {
		enable = true,
	},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
