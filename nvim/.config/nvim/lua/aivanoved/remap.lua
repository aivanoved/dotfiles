vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "m", "d")
vim.keymap.set("x", "m", "d")

vim.keymap.set("n", "mm", "dd")
vim.keymap.set("n", "M", "D")



vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>bf", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>ve", function()
    vim.cmd.edit(os.getenv("HOME") .. "/.config/nvim/init.lua")
end)
vim.keymap.set("n", "<leader>vr", function()
    vim.cmd.source(os.getenv("HOME") .. "/.config/nvim/init.lua")
end)






vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true })
