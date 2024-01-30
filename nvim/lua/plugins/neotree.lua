vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "󰌵", texthl = "DiagnosticSignHint"})

require('neo-tree').setup({
--  log_level = 'trace',
--  log_to_file = true,
  buffers = { follow_current_file = { enabled = true, } },
})
