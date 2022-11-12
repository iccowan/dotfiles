local lspconfig = require('lspconfig')
local root_pattern = require('lspconfig/util').root_pattern

lspconfig.tsserver.setup{}
lspconfig.eslint.setup{}
lspconfig.angularls.setup{}
lspconfig.svelte.setup{}
lspconfig.cssls.setup{}
lspconfig.tailwindcss.setup{}
lspconfig.html.setup{}
lspconfig.phpactor.setup{}
lspconfig.clangd.setup{}
