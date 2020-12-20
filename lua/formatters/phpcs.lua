local phpcs = {
	sourceName = 'phpcs',
	debounce = 100,
	command = '~/phpcs',
	rootPatterns = {"composer.json", "composer.lock", "vendor", ".git"},
	args = { "--standard=PSR2", "--report=emacs", "-s", "-" },
	offsetLine = 0,
	offsetColumn = 0,
	formatLines = 1,
	securities = {
		error = "error",
		warning = "warning"
	}
}

return phpcs;
