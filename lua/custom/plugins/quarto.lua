return {
  {
    'quarto-dev/quarto-nvim',
    ft = { 'quarto', 'markdown' },

    dependencies = {
      'jmbuhr/otter.nvim',
      'jmbuhr/cmp-pandoc-references',
      'nvim-treesitter/nvim-treesitter',
    },

    opts = {
      lspFeatures = {
        enabled = true,
        languages = { 'r', 'python', 'yaml', 'latex' },
        chunks = 'all',
        diagnostics = { enabled = true },
        completion = { enabled = true },
      },
    },

    config = function(_, opts) require('quarto').setup(opts) end,
  },
}
