return {
  'emmanueltouzery/decisive.nvim',
  config = function()
    require('decisive').setup {}
  end,
  lazy = true,
  ft = { 'csv' },
 keys = {
    { '<leader>vca', ":lua require('decisive').align_csv({})<cr>", { silent = true }, desc = 'Align CSV', mode = 'n' },
    { '<leader>vcA', ":lua require('decisive').align_csv_clear({})<cr>", { silent = true }, desc = 'Align CSV clear', mode = 'n' },
    { '[v', ":lua require('decisive').align_csv_prev_col()<cr>", { silent = true }, desc = 'Align CSV prev col', mode = 'n' },
    { ']v', ":lua require('decisive').align_csv_next_col()<cr>", { silent = true }, desc = 'Align CSV next col', mode = 'n' },
  },
}
