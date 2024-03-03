{ ... }: {
	packages.direnv = {
		enable = true;
		silent = true;
		direnvrcExtra = ''
			export NIX_SHELL="direnv"
		'';
	};
}
