-- plugins/quarto.lua
return {
  {
    'quarto-dev/quarto-nvim',
    ft = { 'quarto', 'markdown' },

    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },

    opts = {
      lspFeatures = {
        enabled = true,
        languages = { 'r', 'python', 'bash', 'lua' },
        chunks = 'all',
        diagnostics = {
          enabled = true,
        },
        completion = {
          enabled = true,
        },
      },
    },
  },
}
