return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>')
      vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>')
    end,
  },
}
