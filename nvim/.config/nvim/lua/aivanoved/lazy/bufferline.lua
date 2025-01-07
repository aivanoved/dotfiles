-- local bufferline = require('bufferline')

-- bufferline.setup({
--     options = {
--         numbers = 'ordinal',
--         diagnostics = 'nvim_lsp',
--         diagnostics_indicator = function(count, level, diagnostics_dict, context)
--             if context.buffer:current() then
--                 return ''
--             end

--             local icon = level:match('error') and ' '
--                 or level:match('warning') and ' '
--                 or level:match('info') and '󰋽 '
--                 or level:match('hint') and '󰌶 '
--                 or ''

--             return ' ' .. icon .. count
--         end,
--     },
-- })
