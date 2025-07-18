return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'j-hui/fidget.nvim',
  },
  init = function()
    require('config.codecompanion-fidget'):init()
  end,
  config = function()
    require('codecompanion').setup {
      -- vim.keymap.set({ 'n', 'v' }, '<leader>ta', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true, desc = 'CodeCompanion Action' }),
      vim.keymap.set({ 'n', 'v' }, '<leader>ta', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true, desc = 'CodeCompanion Chat' }),
      vim.keymap.set({ 'n', 'v' }, '<leader>aa', function()
        require('telescope').extensions.codecompanion.codecompanion(require('telescope.themes').get_dropdown {
          winblend = 0,
          previewer = false,
          borderchars = {
            prompt = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            results = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          },
        })
      end),
      vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true, desc = 'CodeCompanion add to chat' }),

      -- Expand 'cc' into 'CodeCompanion' in the command line
      vim.cmd [[cab cc CodeCompanion]],
    }
  end,
}
