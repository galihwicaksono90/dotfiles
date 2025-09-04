return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        keymap = {
          accept = '<C-g>',
        },
      },
    }
  end,
  keys = {
    { '<leader>tt', '<cmd>Copilot toggle<cr>' },
    { '<leader>tp', '<cmd>Copilot panel<cr>' },
  },
}
