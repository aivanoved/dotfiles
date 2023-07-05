vim.g.bookmark_no_default_key_mappings = 1

local function bookmark_map_keys()
    vim.keymap.set('n', '<leader>m<space>', '<Plug>BookmarkToggle')
    vim.keymap.set('n', '<leader>mi', '<Plug>BookmarkAnnotate')
    vim.keymap.set('n', '<leader>ma', '<Plug>BookmarkShowAll')
    vim.keymap.set('n', '<leader>mj', '<Plug>BookmarkNext')
    vim.keymap.set('n', '<leader>mk', '<Plug>BookmarkPrev')
    vim.keymap.set('n', '<leader>mc', '<Plug>BookmarkClear')
    vim.keymap.set('n', '<leader>mx', '<Plug>BookmarkClearAll')
    vim.keymap.set('n', '<leader>mkk', '<Plug>BookmarkMoveUp')
    vim.keymap.set('n', '<leader>mjj', '<Plug>BookmarkMoveDown')
    vim.keymap.set('n', '<leader>mg', '<Plug>BookmarkMoveToLine')
end

local function bookmark_unmap_keys()
    vim.keymap.del('n', 'm<space>')
    vim.keymap.del('n', 'mi')
    vim.keymap.del('n', 'ma')
    vim.keymap.del('n', 'mj')
    vim.keymap.del('n', 'mk')
    vim.keymap.del('n', 'mc')
    vim.keymap.del('n', 'mx')
    vim.keymap.del('n', 'mkk')
    vim.keymap.del('n', 'mjj')
    vim.keymap.del('n', 'mg')
end

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = "*", callback = bookmark_map_keys })
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = "NERD_tree_*", callback = bookmark_unmap_keys })
