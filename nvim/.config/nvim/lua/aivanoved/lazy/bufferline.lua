local function config()
    local bufferline = require('bufferline')
    local groups = require('bufferline.groups')
    local mocha = require('catppuccin.palettes').get_palette('mocha')

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
            groups = {
                options = {
                    toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
                },
                items = {
                    {
                        name = 'Source',
                        highlight = { sp = mocha.red },
                        priority = 1,
                        icon = ' ',
                        matcher = function(buf)
                            if buf.path == nil then
                                return false
                            end
                            local is_dev_file = false
                            -- python
                            is_dev_file = is_dev_file or buf.path:match('%.py')
                            -- lua
                            is_dev_file = is_dev_file or buf.path:match('%.lua')
                            -- typescript or javascript
                            is_dev_file = is_dev_file
                                or (buf.path:match('%.js') or buf.path:match('%.ts'))
                            return is_dev_file
                        end,
                    },
                    {
                        name = 'Tests',
                        highlight = { sp = mocha.blue },
                        priority = 2,
                        icon = ' ',
                        matcher = function(buf)
                            local is_test_file = buf.path ~= nil
                            is_test_file = is_test_file
                                and (buf.path:match('%_test') or buf.path:match('%_spec'))
                            return is_test_file
                        end,
                    },
                    {
                        name = 'Docs',
                        highlight = { sp = mocha.green },
                        auto_close = false,
                        matcher = function(buf)
                            local is_doc_file = buf.path ~= nil
                            is_doc_file = is_doc_file
                                and (buf.path:match('%.md') or buf.path:match('%.txt'))
                            return is_doc_file
                        end,
                        separator = {
                            style = require('bufferline.groups').separator.tab,
                        },
                    },
                    groups.builtin.ungrouped,
                },
            },
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
        vim.cmd.BufferLineCyclePrev()
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
