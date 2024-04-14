{ pkgs, lib, secret, ... }: {
	imports = [
		./home/Voronind.nix
	];

	users.users.voronind = {
		createHome     = true;
		description    = "Dmitry Voronin";
		hashedPassword = secret.hashedPassword;
		isNormalUser   = true;
		uid            = 1000;
		extraGroups = [
			"networkmanager"
			"video"
		];
	};
}
