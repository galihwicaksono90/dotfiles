-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('User', {
  callback = function()
    print 'leap enter'
    vim.cmd.hi('Cursor', 'blend=100')
    vim.opt.guicursor:append { 'a:Cursor/lCursor' }
  end,
  pattern = 'LeapEnter',
})

vim.api.nvim_create_autocmd('User', {
  callback = function()
    print 'leap leave'
    vim.cmd.hi('Cursor', 'blend=0')
    vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
  end,
  pattern = 'LeapLeave',
})
