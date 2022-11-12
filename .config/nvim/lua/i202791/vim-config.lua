local autocmd = vim.api.nvim_create_autocmd

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.syntax = "on"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.completeopt = {'menu', 'menuone', 'noselect' }

vim.g.mapleader = " "

autocmd({"BufRead", "BufNewFile"}, {
    pattern = {
        "*.c",
        "*.h"
    },
    command = "set filetype=c"
})

autocmd("FileType", {
    pattern = {
        "c"
    },
    command = "setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab cindent cc=80"
})

autocmd("FileType", {
    pattern = {
        "typescript",
        "svelte",
        "html",
        "scss"
    },
    command = "setlocal shiftwidth=2 tabstop=2"
})

autocmd("FileType", {
    pattern = {
        "svelte"
    },
    callback = function()
        vim.b.closer = true
        vim.b.closer_flags = '([{'
        vim.b.closer_no_semi = [[ s*\(function\|class\|if\|else\) ]]
        vim.b.closer_semi_ctx = [[ )\s*{$ ]]
    end
})

