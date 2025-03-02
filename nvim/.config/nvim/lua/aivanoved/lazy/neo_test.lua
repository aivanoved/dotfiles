local function config()
    local neotest = require('neotest')

    neotest.setup({
        adapters = {
            require('neotest-python'),
            require('neotest-rust')({
                args = { '--no-capture', '--no-tests=pass' },
            }),
        },
    })

    local function set_keymap(mode, key, cmd)
        vim.keymap.set(mode, '<leader>t' .. key, cmd, { noremap = true, silent = true })
    end

    set_keymap('n', 'n', function()
        neotest.run.run()
    end)
    set_keymap('n', 'f', function()
        neotest.run.run(vim.fn.expand('%'))
    end)

    set_keymap('n', 't', function()
        neotest.summary.toggle()
    end)
    set_keymap('n', 'to', function()
        neotest.output.open({
            auto_close = true,
            enter = true,
            last_run = true,
            quiet = true,
        })
    end)
    set_keymap('n', ']n', function()
        neotest.jump.next({ status = 'failed' })
    end)
    set_keymap('n', '[n', function()
        neotest.jump.prev({ status = 'failed' })
    end)
end

return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',

        -- adapters
        'nvim-neotest/neotest-python',
        'rouge8/neotest-rust',

        -- runners
        'rouge8/neotest-rust',
    },
    config = config,
}
