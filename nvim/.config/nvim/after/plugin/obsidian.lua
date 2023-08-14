local obsidian = require('obsidian')

obsidian.setup {
    dir = "~/obsidian/dev",
    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart({ "open", url }) -- Mac OS
        vim.fn.jobstart({ "xdg-open", url }) -- linux
    end,
}

