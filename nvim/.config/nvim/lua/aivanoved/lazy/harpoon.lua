local function config()
    local harpoon = require('harpoon')
    harpoon.setup({})

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local finders = require('telescope.finders')
    local pickers = require('telescope.pickers')

    local function toggle_telescope(harpoon_files)
        local function finder()
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end
            file_paths = finders.new_table({ results = file_paths })
            return file_paths
        end

        pickers
            .new({}, {
                prompt_title = 'Harpoon',
                finder = finder(),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, map)
                    map('i', '<C-d>', function()
                        local state = require('telescope.actions.state')
                        local selected_entry = state.get_selected_entry()
                        local current_picker = state.get_current_picker(prompt_bufnr)

                        table.remove(harpoon_files.items, selected_entry.index)
                        current_picker:refresh(finder())
                    end)
                    return true
                end,
            })
            :find()
    end

    local function set_keymap(key, cmd)
        vim.keymap.set('n', '<leader>h' .. key, cmd)
    end

    set_keymap('a', function()
        harpoon:list():add()
    end)
    set_keymap('d', function()
        harpoon:list():remove()
    end)
    set_keymap('e', function()
        toggle_telescope(harpoon:list())
    end)
    set_keymap('j', function()
        harpoon:list():next()
    end)
    set_keymap('k', function()
        harpoon:list():prev()
    end)
    for i = 1, 9 do
        set_keymap(tostring(i), function()
            harpoon:list():select(i)
        end)
    end

    harpoon:extend({
        UI_CREATE = function(cx)
            vim.keymap.set('n', '<C-v>', function()
                harpoon.ui:select_menu_item({ vsplit = true })
            end, { buffer = cx.bufnr })

            vim.keymap.set('n', '<C-x>', function()
                harpoon.ui:select_menu_item({ split = true })
            end, { buffer = cx.bufnr })

            vim.keymap.set('n', '<C-t>', function()
                harpoon.ui:select_menu_item({ tabedit = true })
            end, { buffer = cx.bufnr })
        end,
    })
end

return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/plenary.nvim' } },
    config = config,
}
