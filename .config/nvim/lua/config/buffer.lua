local M = {}

--- Check if a buffer is valid
---@param bufnr integer? The buffer to check, default to current buffer
---@return boolean # Whether the buffer is valid or not
function M.is_valid(bufnr)
  if not bufnr then
    bufnr = 0
  end
  return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
end

--- Helper function to power a save confirmation prompt before `mini.bufremove`
---@param func fun(bufnr:integer,force:boolean?) The function to execute if confirmation is passed
---@param bufnr integer The buffer to close or the current buffer if not provided
---@param force? boolean Whether or not to foce close the buffers or confirm changes (default: false)
---@return boolean? # new value for whether to force save, `nil` to skip saving
local function mini_confirm(func, bufnr, force)
  if not force and vim.bo[bufnr].modified then
    local bufname = vim.fn.expand '%'
    local empty = bufname == ''
    if empty then
      bufname = 'Untitled'
    end
    local confirm = vim.fn.confirm(('Save changes to "%s"?'):format(bufname), '&Yes\n&No\n&Cancel', 1, 'Question')
    if confirm == 1 then
      if empty then
        return
      end
      vim.cmd.write()
    elseif confirm == 2 then
      force = true
    else
      return
    end
  end
  func(bufnr, force)
end

--- Close a given buffer
---@param bufnr? integer The buffer to close or the current buffer if not provided
---@param force? boolean Whether or not to foce close the buffers or confirm changes (default: false)
function M.close(bufnr, force)
  if not bufnr or bufnr == 0 then
    bufnr = vim.api.nvim_get_current_buf()
  end
  if
    M.is_valid(bufnr) --[[ and #vim.t.bufs > 1 ]]
  then
    mini_confirm(require('mini.bufremove').delete, bufnr, force)
  else
    local buftype = vim.bo[bufnr].buftype
    vim.cmd(('silent! %s %d'):format((force or buftype == 'terminal') and 'bdelete!' or 'confirm bdelete', bufnr))
  end
end

--- Close all buffers
---@param keep_current? boolean Whether or not to keep the current buffer (default: false)
---@param force? boolean Whether or not to foce close the buffers or confirm changes (default: false)
function M.close_all(keep_current, force)
  if keep_current == nil then
    keep_current = false
  end
  local current = vim.api.nvim_get_current_buf()
  -- Get all valid, listed buffers
  local bufs = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if M.is_valid(bufnr) and (not keep_current or bufnr ~= current) then
      table.insert(bufs, bufnr)
    end
  end
  for _, bufnr in ipairs(bufs) do
    M.close(bufnr, force)
  end
end

return M
