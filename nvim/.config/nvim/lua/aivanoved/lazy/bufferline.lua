function config()
    local bufferline = require('bufferline')
    bufferline.setup({
        options = {
            numbers = 'ordinal',
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                if context.buffer:current() then
                    return ''
                end

                local icon = level:match('error') and ' '
                    or level:match('warning') and ' '
                    or level:match('info') and '󰋽 '
                    or level:match('hint') and '󰌶 '
                    or ''

                return ' ' .. icon .. count
            end,
        },
        highlights = require('catppuccin.groups.integrations.bufferline').get(),
    })
    vim.keymap.set('n', '<leader>1', function()
        bufferline.go_to(1, true)
    end)
    vim.keymap.set('n', '<leader>2', function()
        bufferline.go_to(2, true)
    end)
    vim.keymap.set('n', '<leader>3', function()
        bufferline.go_to(3, true)
    end)
    vim.keymap.set('n', '<leader>4', function()
        bufferline.go_to(4, true)
    end)
    vim.keymap.set('n', '<leader>5', function()
        bufferline.go_to(5, true)
    end)
    vim.keymap.set('n', '<leader>6', function()
        bufferline.go_to(6, true)
    end)
    vim.keymap.set('n', '<leader>7', function()
        bufferline.go_to(7, true)
    end)
    vim.keymap.set('n', '<leader>8', function()
        bufferline.go_to(8, true)
    end)
    vim.keymap.set('n', '<leader>9', function()
        bufferline.go_to(9, true)
    end)
    vim.keymap.set('n', '<leader>0', function()
        bufferline.go_to(0, true)
    end)
    vim.keymap.set('n', '<leader>-', function()
        vim.cmd.BufferLineCylePrevious()
    end)
    vim.keymap.set('n', '<leader>+', function()
        vim.cmd.BufferLineCycleNext()
    end)
end

return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin' },
    config = config,
}
