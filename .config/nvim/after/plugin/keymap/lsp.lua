local Remap = require('i202791.keymap')
local nnoremap = Remap.nnoremap

nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
