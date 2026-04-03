return {
  {
    'jbyuki/nabla.nvim',
    ft = { 'quarto', 'markdown' },
    keys = {
      {
        '<leader>m',
        function() require('nabla').popup() end,
        desc = '[M]ath popup',
      },
    },
  },
}
