return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  config = function()
    -- Parser names for install (tsx covers both TSX and JSX)
    local parsers = { 'lua', 'tsx', 'typescript', 'javascript' }
    -- FileType patterns: .tsx -> typescriptreact, .jsx -> javascriptreact in Neovim
    local filetypes = { 'lua', 'tsx', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }
    require('nvim-treesitter').install(parsers)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
