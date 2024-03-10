{ ... }: {
	environment.variables.NIXPKGS_ALLOW_UNFREE = "1";
	nixpkgs.config.allowUnfree       = true;
	nix.settings.auto-optimise-store = true;
	nix.extraOptions = ''
		experimental-features = nix-command flakes
		keep-derivations = true
		keep-outputs = true
		min-free = ${toString (50 * 1024 * 1024 * 1024)}
	'';

	# max-free = ${toString (10 * 1024 * 1024 * 1024)}
	# nix.gc = {
	# 	automatic  = true;
	# 	dates      = "weekly";
	# 	options    = "--delete-older-than 30d";
	# 	persistent = true;
	# };
}
