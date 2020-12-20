local eslint = require('linters.eslint')
local luafmt = require('formatters.luafmt')
local prettier = require('formatters.prettier')
local phpcs = require('formatters.phpcs')
require('lspconfig')
local lsp_status = require('lsp-status')
lsp_status.register_progress()
local function on_attach(client)
	lsp_status.on_attach(client)
end

require 'lspconfig'.tsserver.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities,
}
require 'lspconfig'.bashls.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require 'lspconfig'.vimls.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require 'lspconfig'.dockerls.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require 'lspconfig'.cssls.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require 'lspconfig'.html.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require 'lspconfig'.jsonls.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require 'lspconfig'.intelephense.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require 'lspconfig'.sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities,
	cmd = {"luals"},
	settings = {
		Lua = {
			diagnostics = {enable = true, globals = {'vim'}},
			workspace = {
				library = {
					['$VIMRUNTIME/lua'] = true,
				}
			}
		}
	}
}
require 'lspconfig'.diagnosticls.setup {
	on_attach = on_attach,
	capabilities = lsp_status.capabilities,
	filetypes = {
		'javascript',
		'javascript.jsx',
		'typescript',
		'typescript.tsx',
		'css',
		'scss',
		'less',
		'lua',
		'php',
	},
	init_options = {
		linters = {eslint = eslint, stylelint = stylelint},
		formatters = {
			prettier = prettier,
			phpcs = phpcs,
			luafmt = luafmt,
		},
		filetypes = {
			javascript = 'eslint',
			javascriptreact = 'eslint',
			typescript = 'eslint',
			["typescript.tsx"] = 'eslint',
			css = 'stylelint',
			scss = 'stylelint',
			less = 'stylelint',
		},
		formatFiletypes = {
			javascript = 'prettier',
			javascriptreact = 'prettier',
			typescript = 'prettier',
			["typescript.tsx"] = 'prettier',
			css = 'prettier',
			scss = 'prettier',
			less = 'prettier',
			lua = 'luafmt',
			php = 'php',
		},
	}
}

vim.api.nvim_set_keymap(
	'n',
	'gh',
	':lua vim.lsp.buf.hover()<CR>',
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	'n',
	'gk',
	':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	'n',
	'gf',
	':lua vim.lsp.buf.formatting()<CR>',
	{noremap = true, silent = true}
)

