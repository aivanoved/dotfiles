vim.keymap.set("i", "<c-g>j", 'copilot#Accept("\\<CR>")', {
	expr = true,
	silent = true,

	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
