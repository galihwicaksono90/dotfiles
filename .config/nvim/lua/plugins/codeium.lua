if true then
  return {}
end

return {
  'Exafunction/codeium.vim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  event = 'VeryLazy',
  config = function()
    vim.keymap.set('i', '<C-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true })
    vim.keymap.set('i', '<C-;>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true })
    vim.keymap.set('i', '<C-,>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true })
    vim.keymap.set('i', '<C-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true })
    vim.keymap.set('n', '<Leader>t;', function()
      if vim.g.codeium_enabled == true then
        vim.cmd 'CodeiumDisable'
      else
        vim.cmd 'CodeiumEnable'
      end
    end, { noremap = true, desc = 'Toggle Codeium active' })
  end,
}
