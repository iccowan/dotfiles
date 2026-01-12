return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<leader>ff', ':Telescope find_files hidden=true<CR>' },
    { '<leader>fg', ':Telescope live_grep hidden=true<CR>' },
    { '<leader>fb', ':Telescope buffers hidden=true<CR>' },
  }
}
