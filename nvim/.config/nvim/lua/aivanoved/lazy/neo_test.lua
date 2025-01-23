local function config()
    require('neotest').setup({
        adapters = {
            require('neotest-rust')({
                args = { '--no-capture', '--no-tests=pass' },
            }),
        },
    })

    local function set_keymap(mode, key, cmd)
        vim.api.nvim_set_keymap(
            mode,
            '<leader>t' .. key,
            cmd,
            { noremap = true, silent = true }
        )
    end

    set_keymap('n', 'n', ':lua require("neotest").run.run()<cr>')
    set_keymap('n', 'f', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>')

    set_keymap('n', 't', ':lua require("neotest").summary.toggle()<cr>')
    set_keymap('n', 's', ':lua require("neotest").output.open()<cr>')
    set_keymap('n', ']n', ':lua require("neotest").jump.next({ status = "failed" })<cr>')
    set_keymap('n', '[n', ':lua require("neotest").jump.prev({ status = "failed" })<cr>')
end

return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',

        -- runners
        'rouge8/neotest-rust',
    },
    config = config,
}
