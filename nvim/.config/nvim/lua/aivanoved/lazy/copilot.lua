local function copilot_setup()
    local copilot = require('copilot')
    local panel = require('copilot.panel')

    copilot.setup({
        suggestion = { enabled = false, auto_trigger = true },
        panel = { enabled = true, auto_refresh = true },
    })

    -- Keymaps
    vim.keymap.set('n', '<leader>cgco', function()
        panel.open({})
    end, { desc = 'Open the github copilot panel' })

    vim.keymap.set('n', '<leader>cgct', function()
        panel.toggle()
    end, { desc = 'Toggle the github copilot panel' })
end

return {
    {
        'zbirenbaum/copilot.lua',
        config = copilot_setup,
    },
}
