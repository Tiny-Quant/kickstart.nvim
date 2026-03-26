return {
  {
    'benlubas/molten-nvim',
    version = '^1',
    build = ':UpdateRemotePlugins',

    init = function()
      vim.g.molten_auto_open_output = false
      vim.g.molten_image_provider = 'none'
      vim.g.molten_output_win_max_height = 20
    end,

    config = function()
      local map = vim.keymap.set

      -- init kernel
      map('n', '<leader>mi', ':MoltenInit<CR>')

      -- run cell / chunk
      -- map('n', '<leader><C-CR>', ':MoltenEvaluateOperator<CR>')
      map('n', '<leader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })

      -- run visual
      map('v', '<leader>ss', ':MoltenEvaluateVisual<CR>')

      -- run line
      map('n', '<leader>sl', ':MoltenEvaluateLine<CR>')

      -- run file
      map('n', '<leader><C-S-CR>', ':MoltenEvaluateBuffer<CR>')
    end,
  },
}
