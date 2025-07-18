return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { 'nvim-telescope/telescope-ui-select.nvim' } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    require('oil').setup {
      vim.keymap.set('n', '<leader>e', '<Cmd>Oil<CR>', { desc = 'Oil Nvim' }),
      keymaps = {
        ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-r>'] = 'actions.refresh',
        ['<C-h>'] = false,
        ['<C-l>'] = false,
      },
      columns = {
        'icon',
        "size",
        "mtime",
      },
    }
  end,
}
