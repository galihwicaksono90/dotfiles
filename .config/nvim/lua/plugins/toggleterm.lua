if true then
  return {}
end

return {
  'akinsho/toggleterm.nvim',
  event = 'BufEnter',
  version = '*',
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      hidden = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

    require('toggleterm').setup()
  end,
}
