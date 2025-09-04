return {
  'tpope/vim-dadbod',
  cmd = { 'DB', 'DBUI', 'DBUIToggle', 'DBUIFindBuffer', 'DBUIAddConnection' },
  dependencies = {
    {
      'kristijanhusak/vim-dadbod-ui',
      lazy = true,
      cmd = { 'DBUI', 'DBUIToggle', 'DBUIFindBuffer', 'DBUIAddConnection' },
      init = function()
        vim.keymap.set('n', '<leader>td', '<cmd>DBUIToggle<CR>')
      end,
    },
    {
      'kristijanhusak/vim-dadbod-completion',
      lazy = true,
    },
  },
  -- config = function()
  --   require('config.dadbod').setup()
  -- end,
}
