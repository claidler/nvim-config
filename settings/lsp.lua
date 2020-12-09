local lsp = require ('lspconfig')
local lsp_status = require ('lsp-status')
lsp_status.register_progress()
local function on_attach(client)
    print('Attached to ' .. client.name)
    lsp_status.on_attach(client)
    vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
end

require'lspconfig'.tsserver.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.bashls.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.vimls.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.dockerls.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.cssls.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.html.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.jsonls.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.intelephense.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities
}
require'lspconfig'.sumneko_lua.setup{
	on_attach = on_attach,
	capabilities = lsp_status.capabilities,
	cmd = { "luals" }
}
require'lspconfig'.diagnosticls.setup{
		on_attach = on_attach,
		capabilities = lsp_status.capabilities,
		filetypes = {
        'javascript',
        'javascript.jsx',
        'typescript',
        'typescript.tsx',
    },
    init_options = {
        filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
						typescript = 'eslint',
						["typescript.tsx"] = 'eslint'
        },
        formatFiletypes = {
            javascript = 'prettier',
            javascriptreact = 'prettier',
						typescript = 'prettier',
						["typescript.tsx"] = 'prettier'
        },
        linters = {
            eslint = {
							sourceName = 'eslint',
							debounce = 100,
							command = './node_modules/.bin/eslint',
							args = {
								'--stdin',
								'--stdin-filename',
								'%filepath',
								'--format',
								'json',
							},
							parseJson = {
								errorsRoot = "[0].messages",
								line = "line",
								column = "column",
								endLine = 'endLine',
								endColumn = 'endColumn',
								message = '${message} [${ruleId}]',
								security = 'severity',
							},
							securities = {
								[1] = 'error',
								[2] = 'warning'
							},
							rootPatterns = {
										'.eslintrc.js',
										'.eslintrc.cjs',
										'.eslintrc.yaml',
										'.eslintrc.yml',
										'.eslintrc.json',
										'.eslintrc',
										'package.json',
										'.git'
								},
						},
						phpcs = {
							sourceName = 'phpcs',
							debounce = 100,
							command = '~/phpcs',
							rootPatterns = {"composer.json", "composer.lock", "vendor", ".git"},
							args = { "--standard=PSR2", "--report=emacs", "-s", "-" },
							offsetLine = 0,
							offsetColumn = 0,
							sourceName = "phpcs",
							formatLines = 1,
							securities = {
								error = "error",
								warning = "warning"
							}
							
						}
        },
				formatters = {
					prettier = {
						command = 'prettier',
						args = { '--stdin', '--stdin-filepath', '%filepath' },
						rootPatterns = {
							'.prettierrc',
							'.prettierrc.json',
							'.prettierrc.toml',
							'.prettierrc.json',
							'.prettierrc.yml',
							'.prettierrc.yaml',
							'.prettierrc.json5',
							'.prettierrc.js',
							'.prettierrc.cjs',
							'prettier.config.js',
							'prettier.config.cjs',
						}
					}
				}
    }
} 

vim.api.nvim_set_keymap('n', 'gd', ':Definitions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':References<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gh', ':<cmd> vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ga', ':CodeActions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gf', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

