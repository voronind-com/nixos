{ ... }: {
	environment.variables.NIXPKGS_ALLOW_UNFREE = "1";
	nixpkgs.config.allowUnfree       = true;
	nix.settings.auto-optimise-store = true;
	nix.extraOptions = ''
		experimental-features = nix-command flakes
		keep-derivations = true
		keep-outputs = true
		min-free = ${toString (50 * 1024 * 1024 * 1024)}
		extra-substituters = ssh-ng://home
		extra-trusted-substituters = ssh-ng://home
		extra-trusted-public-keys = home:i9dE2VZI40/LCM/mmUGs8kwal1bQo3xbSjrzxhInmOw=
	'';
	# max-free = ${toString (10 * 1024 * 1024 * 1024)}
	# nix.gc = {
	# 	automatic  = true;
	# 	dates      = "weekly";
	# 	options    = "--delete-older-than 30d";
	# 	persistent = true;
	# };
}
