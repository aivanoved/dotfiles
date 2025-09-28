local typedef = require('aivanoved.typedef')

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

    local set_maps = typedef.SetKeyMaps:new()

    set_maps:append({
        mode = 'n',
        lhs = '<leader>h' .. 'a',
        rhs = function()
            harpoon:list():add()
        end,
        opts = { desc = 'Harpoon add' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>h' .. 'd',
        rhs = function()
            harpoon:list():remove()
        end,
        opts = { desc = 'Harpoon remove' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>h' .. 'e',
        rhs = function()
            toggle_telescope(harpoon:list())
        end,
        opts = { desc = 'Harpoon toggle' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>h' .. 'j',
        rhs = function()
            harpoon:list():next()
        end,
        opts = { desc = 'Harpoon next' },
    })
    set_maps:append({
        mode = 'n',
        lhs = '<leader>h' .. 'k',
        rhs = function()
            harpoon:list():prev()
        end,
        opts = { desc = 'Harpoon previous' },
    })
    for i = 1, 9 do
        set_maps:append({
            mode = 'n',
            lhs = '<leader>h' .. tostring(i),
            rhs = function()
                harpoon:list():select(i)
            end,
            opts = { desc = 'Harpoon select ' .. tostring(i) },
        })
    end

    set_maps:set_keymaps()

    harpoon:extend({
        UI_CREATE = function(cx)
            local set_ui_maps = typedef.SetKeyMaps.new()

            set_ui_maps:append({
                mode = 'n',
                lhs = '<C-v>',
                rhs = function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end,
                opts = { buffer = cx.bufnr, desc = 'Harpoon vsplit item' },
            })

            set_ui_maps:append({
                mode = 'n',
                lhs = '<C-x>',
                rhs = function()
                    harpoon.ui:select_menu_item({ split = true })
                end,
                opts = { buffer = cx.bufnr, desc = 'Harpoon split item' },
            })

            set_ui_maps:append({
                mode = 'n',
                lhs = '<C-t>',
                rhs = function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end,
                opts = { buffer = cx.bufnr, desc = 'Harpoon tab edit' },
            })

            set_ui_maps:set_keymaps()
        end,
    })
end

return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = config,
}
