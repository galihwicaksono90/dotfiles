if true then
  return {}
end

return {
  -- dir = '~/Documents/plugins/codestats.nvim/',
  'galihwicaksono90/codestats.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'rcarriga/nvim-notify',
      opts = {

        background_colour = '#000000',
      },
    },
  },
  event = { 'TextChanged', 'InsertEnter' },
  cmd = { 'CodeStatsXpSend', 'CodeStatsProfileUpdate', 'CodeStatsToggle', 'CodeStatsPrintStatus' },
  config = function()
    require('codestats').setup {
      username = '', -- needed to fetch profile data
      base_url = '', -- codestats.net base url
      api_key = '',
      send_on_exit = true, -- send xp on nvim exit
      send_on_timer = true, -- send xp on timer
      timer_interval = 60000, -- timer interval in milliseconds (minimum 1000ms to prevent DDoSing codestat.net servers)
      curl_timeout = 5, -- curl request timeout in seconds
      active = true,
    }
  end,
  init = function()
    vim.keymap.set('n', '<leader>tc', '<cmd>CodeStatsToggle<CR>')
    vim.keymap.set('n', '<leader>tC', '<cmd>CodeStatsPrintStatus<CR>')
  end,
}
