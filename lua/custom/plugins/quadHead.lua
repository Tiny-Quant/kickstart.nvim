---@type LazySpec
return {
  {
    'Tiny-Quant/quadHead',
    event = 'VeryLazy',
    config = function()
      require('quadHead').setup {
        backend = 'tmux',
        cells = {},
      }
    end,
  },
}
