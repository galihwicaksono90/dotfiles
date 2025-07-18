-- return {
--   'rebelot/kanagawa.nvim',
--   config = function()
--     require('kanagawa').setup {
--       compile = false, -- enable compiling the colorscheme
--       undercurl = true, -- enable undercurls
--       commentStyle = { italic = true },
--       functionStyle = {},
--       keywordStyle = { italic = true },
--       statementStyle = { bold = true },
--       typeStyle = {},
--       transparent = true, -- do not set background color
--       dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--       terminalColors = true, -- define vim.g.terminal_color_{0,17}
--       colors = { -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = 'none' } } },
--       },
--       overrides = function(colors) -- add/modify highlights
--         -- local theme = colors.theme
--         return {
--           TelescopePromptTitle = { fg = colors.palette.fujiWhite, bg = colors.palette.dragonBlue },
--           TelescopePreviewTitle = { fg = colors.palette.fujiWhite, bg = colors.palette.oniViolet },
--           TelescopeResultsTitle = { fg = colors.palette.fujiWhite, bg = colors.palette.autumnGreen },
--
--           -- TelescopeTitle = { fg = theme.ui.special, bold = true },
--           -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
--           -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
--           -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
--           -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
--           -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
--           -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
--         }
--       end,
--     }
--   end,
-- }
-- return {
--   'eddyekofo94/gruvbox-flat.nvim',
--   priority = 1000,
--   enabled = true,
--   init = function()
--     vim.g.gruvbox_flat_style = 'dark'
--     vim.g.gruvbox_transparent = true
--     vim.g.gruvbox_hide_inactive_statusline = true
--   end,
-- }

return {
  'sainnhe/gruvbox-material',
  init = function()
    vim.g.gruvbox_material_transparent_background = 0
    vim.g.gruvbox_material_enable_italic = 1
    -- vim.g.gruvbox_material_dim_inactive_windows = 1
  end,
  -- config = function()
  --   vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#ffffff', bg = '#00bab1', bold = true })
  -- end,
}

-- return { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
