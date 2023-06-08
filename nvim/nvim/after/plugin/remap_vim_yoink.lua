vim.keymap.set('n', '<c-n>', '<plug>YoinkPostPasteSwapBack', { remap = false })
vim.keymap.set('n', '<c-p>', '<plug>YoinkPostPasteSwapForward', { remap = false })

vim.keymap.set('n', 'p', '<plug>YoinkPaste_p', { remap = false })
vim.keymap.set('n', 'P', '<plug>YoinkPaste_P', { remap = false })

-- Also replace the default gp with yoink paste so we can toggle paste in this case too
vim.keymap.set('n', 'gp', '<plug>YoinkPaste_gp', { remap = false })
vim.keymap.set('n', 'gP', '<plug>YoinkPaste_gP', { remap = false })
