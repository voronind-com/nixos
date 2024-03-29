{ pkgs, lib, const, ... }: {
	imports = [
		./home/Voronind.nix
	];

	users.users.voronind = {
		createHome     = true;
		description    = "Dmitry Voronin";
		hashedPassword = const.hashedPassword;
		isNormalUser   = true;
		uid            = 1000;
		extraGroups = [
			"networkmanager"
			"video"
		];
	};
}
