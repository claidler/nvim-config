-- local telescopeproject  = require('telescope').extensions.project
require('telescope').setup {
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_position = "bottom",
		prompt_prefix = "🔍",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_defaults = {
			-- TODO add builtin options.
		},
		file_sorter = require 'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
		shorten_path = true,
		winblend = 0,
		width = 0.75,
		preview_cutoff = 120,
		results_height = 1,
		results_width = 0.8,
		border = {},
		borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
		color_devicons = true,
		use_less = true,
		set_env = {['COLORTERM'] = 'truecolor'},

		-- default { }, currently unsupported for shells like cmd.exe / powershell.exe
		file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,

		-- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
		grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,

		-- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
		qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

		-- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
	}
}

local function find_git_root()
	return vim.call('system', 'git rev-parse --show-toplevel 2> /dev/null')
end

function Tel_find_files()
	vim.cmd('cd' .. ' ' .. '%:p:h')
	if 'fugitive#head()' ~= '' then
		vim.cmd('cd' .. ' ' .. find_git_root())
		vim.cmd('Telescope live_grep')
	else
		vim.cmd('Telescope live_grep')
	end
end

vim.api.nvim_set_keymap(
	'n',
	'<C-f>',
	':lua Tel_find_files()<CR>',
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	'n',
	'<C-b>',
	':Telescope buffers<CR>',
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	'n',
	'gr',
	':Telescope lsp_references<CR>',
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	'n',
	'ga',
	':Telescope lsp_code_actions<CR>',
	{noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
	'n',
	'<C-p>',
	":lua require'telescope'.extensions.project.project{}<CR>",
	{noremap = true, silent = true}
)
