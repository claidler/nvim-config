local eslint = require('linters.eslint')
local stylelint = require('linters.stylelint')
local luafmt = require('formatters.luafmt')
local prettier = require('formatters.prettier')
local phpcs = require('formatters.phpcs')
local lsp_status = require('lsp-status')
local completion = require('completion')
local capabilities = lsp_status.capabilities
-- this is required for css lsp completion support (not sure why)
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_status.register_progress()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

lsp_status.config({
	indicator_errors = 'E',
	indicator_warnings = 'W',
	indicator_info = 'i',
	indicator_hint = '?',
	indicator_ok = 'Ok',
})

local function on_attach(client)
	lsp_status.on_attach(client)
	completion.on_attach(client)
  vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
  vim.api.nvim_command('autocmd CursorHoldI <buffer> lua vim.lsp.buf.signature_help()')
end

require('lspconfig')

require 'lspconfig'.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require 'lspconfig'.bashls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require 'lspconfig'.vimls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require 'lspconfig'.dockerls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require 'lspconfig'.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require 'lspconfig'.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require 'lspconfig'.jsonls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
require 'lspconfig'.intelephense.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/".."Linux".."/lua-language-server"
require 'lspconfig'.sumneko_lua.setup {

	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
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
	'gi',
	':lua vim.lsp.buf.hover()<CR>',
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	'n',
	'gf',
	':lua vim.lsp.buf.formatting()<CR>',
	{noremap = true, silent = true}
)
