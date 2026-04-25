return {
  'catgoose/nvim-colorizer.lua',
  event = 'VeryLazy',
  opts = {
    lazy_load = true,
    -- other setup options
  },
  config = function()
    require('colorizer').setup {
      user_default_options = {
        names = false,
        mode = 'virtualtext', -- Set the display mode
        -- Virtualtext character to use
        virtualtext = '■',
        -- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
        virtualtext_inline = false,
      },
    }
  end,
}
