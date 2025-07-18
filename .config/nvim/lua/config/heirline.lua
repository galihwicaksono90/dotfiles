local M = {}

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table # The merged table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend('force', default, opts) or opts
end

--- Convert key/value table of options to an array of providers for the component builder
---@param opts table the table of options for the components
---@param providers string[] an ordered list like array of providers that are configured in the options table
---@param setup? function a function that takes provider options table, provider name, provider index and returns the setup provider table, optional, default is `M.build_provider`
---@return table # the fully setup options table with the appropriately ordered providers
function M.setup_providers(opts, providers, setup)
  setup = setup or M.build_provider
  for i, provider in ipairs(providers) do
    opts[i] = setup(opts[provider], provider, i)
  end
  return opts
end

function M.mode()
  return {
    mode_text = false,
    paste = false,
    spell = false,
    surround = { separator = 'left', color = 'red', update = { 'ModeChanged', pattern = '*:*' } },
    -- hl = hl.get_attributes 'mode',
    update = {
      'ModeChanged',
      pattern = '*:*',
      callback = function()
        vim.schedule(vim.cmd.redrawstatus)
      end,
    },
  }
end

return M
