vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

-- Go to definition TEMP FIX
local lsp_util = vim.lsp.util
if not lsp_util.show_document then
  -- Fallback for older Neovim
  lsp_util.show_document = lsp_util.jump_to_location
end

local old_make_position_params = vim.lsp.util.make_position_params
vim.lsp.util.make_position_params = function(win, encoding)
  return old_make_position_params(win, encoding or 'utf-8')
end

-- Silence the specific position encoding message
local notify_original = vim.notify
vim.notify = function(msg, ...)
  if
    msg
    and (
      msg:match 'position_encoding param is required'
      or msg:match 'Defaulting to position encoding of the first client'
      or msg:match 'multiple different client offset_encodings'
    )
  then
    return
  end
  return notify_original(msg, ...)
end

require 'options'

require 'keymaps'

require 'lazy-bootstrap'

require 'lazy-plugins'
