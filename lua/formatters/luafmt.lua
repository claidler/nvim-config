local luafmt = {
	command = 'luafmt',
	args = { "--indent-count", 2, "--stdin"},
	stdin = true
}

return luafmt;
