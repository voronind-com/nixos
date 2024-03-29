{ config, lib, ... }: {
	imports = [
		./Fprint.nix
	];

	# Foot font override.
	environment.variables.FOOT_CONFIG = lib.mkForce ./foot/Foot.ini;
}
