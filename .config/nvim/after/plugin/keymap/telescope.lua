local Remap = require('i202791.keymap')
local nnoremap = Remap.nnoremap

nnoremap("<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers hidden=true<cr>")
