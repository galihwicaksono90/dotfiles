return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    global_settings = {
      save_on_toggle = true,
      excluded_filetypes = { 'harpoon' },
    },
  },
  config = function()
    -- local term_string = vim.fn.exists '$TMUX' == 1 and 'tmux' or 'term'

    -- vim.keymap.set('n', '<leader>mx', function()
    --   require('harpoon.ui').toggle_quick_menu()
    -- end, { desc = 'Quick menu' })

    vim.keymap.set('n', '<leader>mm', function()
      require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
    end, { desc = 'Harpoon list' })
    vim.keymap.set('n', '<leader>ma', function()
      require('harpoon'):list():add()
    end, { desc = 'Harpoon add file' })
    vim.keymap.set('n', '<leader>ml', '<Cmd>Telescope harpoon marks<CR>', { desc = 'Show marks in Telescope' })
    -- vim.keymap.set('n', '<leader>mt', function()
    --   vim.ui.input({ prompt = term_string .. ' window number: ' }, function(input)
    --     local num = tonumber(input)
    --     if num then
    --       require('harpoon').term.gotoTerminal(num)
    --     end
    --   end)
    -- end, { desc = 'Go to' .. term_string .. ' window' })
    vim.keymap.set('n', '<C-p>', function()
      require('harpoon'):list():prev()
    end, { desc = 'Goto previous mark' })
    vim.keymap.set('n', '<C-n>', function()
      require('harpoon'):list():next()
    end, { desc = 'Goto next mark' })
  end,
}
