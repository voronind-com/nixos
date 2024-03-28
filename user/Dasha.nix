{ pkgs, lib, ... }: {
	imports = [
		./home/Dasha.nix
	];
	users.users.dasha = {
		createHome     = true;
		description    = "Daria Dranchak";
		hashedPassword = "$y$j9T$WGMPv/bRhGBUidcZLZ7CE/$raZhwFFdI/XvegVZVHLILJLMiBkOxSErc6gao/Cxt33";
		isNormalUser   = true;
		uid            = 1001;
		extraGroups = [
			"networkmanager"
			"video"
		];
	};
}
