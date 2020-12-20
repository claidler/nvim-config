local eslint = {
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
}

return eslint
