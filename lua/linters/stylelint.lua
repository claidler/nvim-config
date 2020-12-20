local stylelint = {
	sourceName = 'stylelint',
	debounce = 100,
	command = './node_modules/.bin/stylelint',
	args = {
		'--stdin-filename',
		'%filepath',
		'--formatter',
		'json',
	},
	parseJson = {
		errorsRoot = "[0].warnings",
		line = "line",
		column = "column",
		endLine = 'endLine',
		endColumn = 'endColumn',
		message = '${text}',
		security = 'severity',
	},
	securities = {
		[1] = 'error',
		[2] = 'warning'
	},
	rootPatterns = {
		'.git'
	},
}

return stylelint
