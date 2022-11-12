local configs = require('nvim-treesitter.configs')

configs.setup {
    ensure_installed = {
        "lua",
        "java",
        "typescript",
        "html",
        "scss",
        "svelte",
        "json",
        "yaml"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true,
        disable = { "" }
    }
}
