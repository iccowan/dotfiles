vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'

    use {
        'rrethy/vim-hexokinase',
        { run = 'make hexokinase' }
    }

    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'airblade/vim-gitgutter'

    use 'rstacruz/vim-closer'

    use {
        'nvim-treesitter/nvim-treesitter', 
        { run = ':TSUpdate' }
    }

    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-jdtls'

    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'rafamadriz/friendly-snippets'
end)
