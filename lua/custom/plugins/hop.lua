---@module 'lazy'
---@type LazySpec
return {
  {
    'smoka7/hop.nvim',
    version = '*',

    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },

    config = function(_, opts)
      local hop = require 'hop'
      local hint = require('hop.hint').HintDirection

      hop.setup(opts)

      local map = vim.keymap.set

      -- forward word
      map(
        'n',
        '<leader><leader>w',
        function()
          hop.hint_words {
            direction = hint.AFTER_CURSOR,
          }
        end,
        { desc = 'Hop forward word' }
      )

      -- backward word
      map(
        'n',
        '<leader><leader>b',
        function()
          hop.hint_words {
            direction = hint.BEFORE_CURSOR,
          }
        end,
        { desc = 'Hop backward word' }
      )

      -- forward char
      map(
        'n',
        '<leader><leader>f',
        function()
          hop.hint_char1 {
            direction = hint.AFTER_CURSOR,
            current_line_only = true,
          }
        end
      )

      -- backward char
      map(
        'n',
        '<leader><leader>F',
        function()
          hop.hint_char1 {
            direction = hint.BEFORE_CURSOR,
            current_line_only = true,
          }
        end
      )

      -- t
      map(
        'n',
        '<leader><leader>t',
        function()
          hop.hint_char1 {
            direction = hint.AFTER_CURSOR,
            current_line_only = true,
            hint_offset = -1,
          }
        end
      )

      -- T
      map(
        'n',
        '<leader><leader>T',
        function()
          hop.hint_char1 {
            direction = hint.BEFORE_CURSOR,
            current_line_only = true,
            hint_offset = 1,
          }
        end
      )

      -- lines
      map('n', '<leader><leader>l', function()
        hop.hint_lines {
          direction = hint.BEFORE_CURSOR,
        }
      end)

      -- 2-char search
      map('n', '<leader><leader>s', function()
        hop.hint_char2 {
          direction = hint.BEFORE_CURSOR,
        }
      end)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
