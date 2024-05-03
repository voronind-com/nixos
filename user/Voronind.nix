{ const, util, style, pkgs, lib, setting, key, secret, ... } @args: {
	imports = [
		(import ./common (args // {
			username = "voronind";
			homeDir  = "/home/voronind";
		}))
	];

	users.users.voronind = {
		createHome     = true;
		description    = "Dmitry Voronin";
		hashedPassword = secret.hashedPassword;
		isNormalUser   = true;
		uid            = 1000;
		extraGroups = [
			"input"
			"keyd"
			"libvirtd"
			"networkmanager"
			"video"
		];
	};
}
