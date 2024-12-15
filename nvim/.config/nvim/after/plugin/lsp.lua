local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set('n', '<leader>vws', function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set('n', '<leader>vd', function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set('n', '[d', function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set('n', ']d', function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set('n', '<leader>vca', function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set('n', '<leader>vrr', function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set('n', '<leader>vrn', function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set('i', '<C-h>', function()
        vim.lsp.buf.signature_help()
    end, opts)

    -- if client.server_capabilities.inlayHintProvider then
    --     vim.lsp.inlay_hint.enable(bufnr, true)
    -- end
end)

local servers = { 'lua_ls', 'rust_analyzer', 'pyright', 'clangd' }

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = servers,
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        rust_analyzer = lsp_zero.noop,
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

local server_setup = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    },
}

for _, lsp in ipairs(servers) do
    server_setup[lsp] = server_setup[lsp] or {}
    server_setup[lsp].capabilities = capabilities
end

for _, lsp in ipairs(servers) do
    if lsp ~= 'rust_analyzer' then
        lspconfig[lsp].setup(server_setup[lsp])
    end
end

-- local luasnip = require('luasnip')

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    -- snipet = {
    --     expand = function(args)
    --         luasnip.lsp_expand(args.body)
    --     end,
    -- },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        -- { name = 'luasnip', keyword_length = 2 },
        { name = "copilot" },
        { name = 'buffer',  keyword_length = 3 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<c-d>'] = cmp.mapping.scroll_docs(5),
        ['<c-f>'] = cmp.mapping.scroll_docs(-5),
        ['<c-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<c-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<c-y>'] = cmp.mapping.confirm({ select = true }),
        ['<c-space>'] = cmp.mapping.complete(),
    }),
    experimental = {
        ghost_text = true,
    },
})

lsp_zero.set_sign_icons({
    error = ' ',
    warning = ' ',
    info = '󰋽 ',
    hint = '󰌶 ',
})

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 1000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        -- ['eslint'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    },
})

vim.diagnostic.config({
    virtual_text = true,
})
