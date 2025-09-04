return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    --
    --
    local actions = require 'telescope.actions'
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = {
        borderchars = {
          prompt = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          results = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        },
        -- borderchars = {
        --   prompt = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        --   results = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        --   preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        -- },
        path_display = { 'truncate' },
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = { prompt_position = 'top', preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          n = { q = actions.close },
          i = {
            ['<c-enter>'] = 'to_fuzzy_refine',
            ['<C-J>'] = actions.cycle_history_next,
            ['<C-K>'] = actions.cycle_history_prev,
            ['<C-N>'] = actions.move_selection_next,
            ['<C-P>'] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {
            winblend = 0,
            previewer = false,
            borderchars = {
              prompt = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
              results = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
              preview = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            },
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'All Files' })
    vim.keymap.set('n', '<leader>fF', function()
      require('telescope.builtin').find_files { hidden = true, no_ignore = true }
    end, { desc = 'All Hidden Files' })
    vim.keymap.set('n', '<leader>fb', builtin.builtin, { desc = 'Select Telescope' })
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'by Grep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<leader>f.', builtin.resume, { desc = 'Resume' })
    vim.keymap.set('n', '<leader>fr', function()
      require('telescope.builtin').lsp_references { fname_width = 100 }
    end, { desc = 'References' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', function()
      builtin.buffers { sorting_mru = true }
    end, { desc = 'Find existing buffers' })

    vim.keymap.set('n', '<leader>f/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
        winblend = 0,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>fw', function()
      builtin.live_grep {
        prompt_title = 'Live Grep',
      }
    end, { desc = 'Find word in Files' })

    vim.keymap.set('n', '<leader>fW', function()
      builtin.live_grep {
        prompt_title = 'Live Grep in All Files',
        additional_args = function()
          return { '--hidden', '--no-ignore' }
        end,
      }
    end, { desc = 'Find Word in All Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Neovim files' })
  end,
}
