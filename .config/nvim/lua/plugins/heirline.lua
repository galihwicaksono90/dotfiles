if true then
  return {}
end

local WorkDir = {
  provider = function()
    local icon = (vim.fn.haslocaldir(0) == 1 and 'l' or 'g') .. ' ' .. ' '
    local cwd = vim.fn.getcwd(0)
    cwd = vim.fn.fnamemodify(cwd, ':~')
    if not conditions.width_percent_below(#cwd, 0.25) then
      cwd = vim.fn.pathshorten(cwd)
    end
    local trail = cwd:sub(-1) == '/' and '' or '/'
    return icon .. cwd .. trail
  end,
  hl = { fg = 'blue', bold = true },
}

return {
  'rebelot/heirline.nvim',
  dependencies = { 'Zeioth/heirline-components.nvim' },
  config = function(_, opts)
    local heirline = require 'heirline'
    local heirline_components = require 'heirline-components.all'

    -- Setup
    heirline_components.init.subscribe_to_events()
    heirline.load_colors(heirline_components.hl.get_colors())
    heirline.setup(opts)

    vim.opt.showtabline = 2
    vim.cmd [[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]]
  end,
  opts = function()
    local lib = require 'heirline-components.all'
    return {
      opts = {
        disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
          local is_disabled = not require('heirline-components.buffer').is_valid(args.buf)
            or lib.condition.buffer_matches({
              buftype = { 'terminal', 'prompt', 'nofile', 'help', 'quickfix' },
              filetype = { 'NvimTree', 'neo%-tree', 'dashboard', 'Outline', 'aerial' },
            }, args.buf)
          return is_disabled
        end,
      },
      tabline = { -- UI upper bar
        lib.component.tabline_conditional_padding(),
        lib.component.tabline_buffers(),
        lib.component.fill { hl = { bg = 'tabline_bg' } },
        lib.component.tabline_tabpages(),
      },
      -- winbar = { -- UI breadcrumbs bar
      --   init = function(self)
      --     self.bufnr = vim.api.nvim_get_current_buf()
      --   end,
      --   fallthrough = false,
      --   -- Winbar for terminal, neotree, and aerial.
      --   {
      --     condition = function()
      --       return not lib.condition.is_active()
      --     end,
      --     {
      --       lib.component.neotree(),
      --       lib.component.compiler_play(),
      --       lib.component.fill(),
      --       lib.component.compiler_build_type(),
      --       lib.component.compiler_redo(),
      --       lib.component.aerial(),
      --     },
      --   },
      --   -- Regular winbar
      --   {
      --     lib.component.neotree(),
      --     lib.component.compiler_play(),
      --     lib.component.fill(),
      --     lib.component.breadcrumbs(),
      --     lib.component.fill(),
      --     lib.component.compiler_redo(),
      --     lib.component.aerial(),
      --   },
      -- },
      -- statuscolumn = { -- UI left column
      --   init = function(self)
      --     self.bufnr = vim.api.nvim_get_current_buf()
      --   end,
      --   lib.component.foldcolumn(),
      --   lib.component.numbercolumn(),
      --   lib.component.signcolumn(),
      -- } or nil,
      statusline = { -- UI statusbar
        hl = { fg = 'fg', bg = 'bg' },
        lib.component.mode(),
        lib.component.git_branch(),
        lib.component.file_info(),
        lib.component.git_diff(),
        lib.component.diagnostics(),
        lib.component.fill(),
        lib.component.cmd_info(),
        lib.component.fill(),
        lib.component.lsp(),
        lib.component.compiler_state(),
        lib.component.virtual_env(),
        lib.component.nav(),
        lib.component.mode { surround = { separator = 'right' } },
      },
    }
  end,
}
