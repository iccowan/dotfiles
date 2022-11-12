local Remap = require('i202791.keymap')
local nnoremap = Remap.nnoremap

nnoremap("<leader>tt", "<cmd>NvimTreeToggle<cr>")
nnoremap("<leader>tc", "<cmd>NvimTreeCollapse<cr>")
nnoremap("<leader>tf", "<cmd>NvimTreeFindFile<cr>")
