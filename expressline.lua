local lsp_statusline = require('el.plugins.lsp_status')
local bui        = require('el.builtin')
local ext        = require('el.extensions')
local sec        = require('el.sections')
local sub        = require('el.subscribe')
local col        = sec.collapse_builtin
local _space     = ' '
local _separator = ' | '
local _mode      = ext.mode
local _gitbranch = sub.buf_autocmd(
  "el_git_branch",
  "BufEnter",
  function(window, buffer)
    local branch = ext.git_branch(window, buffer)
    if branch then
      return ' ' .. ext.git_icon() .. ' ' .. branch
    end
  end
)
local _gitchanges = sub.buf_autocmd(
  "el_git_changes",
  "BufWritePost",
  function(window, buffer)
    return ext.git_changes(window, buffer)
  end
)
local _lsp 			 = lsp_statusline.segment
local _icon      = ext.file_icon
local _file      = sec.maximum_width(bui.responsive_file(140, 90), 0.30)
local _bufloc    = col{ _separator, bui.percentage_through_window}
local _split     = sec.split
local statusline = function()
  return {
    _space,
    _mode,
		_space,
    _icon,
    _space,
    _file,
    _space,
		_split,
		_lsp,
		_space,
		_gitchanges,
		_gitbranch,
		_space,
    _bufloc,
    _space,
  }
end

require('el').setup({ generator = statusline })
