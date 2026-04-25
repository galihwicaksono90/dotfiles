return {
  'shortcuts/no-neck-pain.nvim',
  config = function()
    require('no-neck-pain').setup {
      width = 240,
      buffers = {
        right = {
          enabled = false
        },
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,
          -- set to `nil` to default
          -- to current working directory
          location = '~/Documents/notes/',
        },
        bo = {
          filetype = 'md',
        },
      },
      vim.keymap.set('n', '<leader>nn', '<Cmd>NoNeckPain<CR>', { desc = 'Toggle no neck pain' }),
      vim.keymap.set('n', '<leader>nl', '<Cmd>NoNeckPainWidthUp<CR>', { desc = 'No neck pain width up' }),
      vim.keymap.set('n', '<leader>nh', '<Cmd>NoNeckPainWidthDown<CR>', { desc = 'No neck pain width down' }),
      vim.keymap.set('n', '<leader>nL', '<Cmd>NoNeckPainToggleRightSide<CR>', { desc = 'No neck pain toggle right side' }),
      vim.keymap.set('n', '<leader>nH', '<Cmd>NoNeckPainToggleLeftSide<CR>', { desc = 'No neck pain toggle left side' }),
    }
  end,
}
