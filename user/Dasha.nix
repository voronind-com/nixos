{ pkgs, lib, ... }: {
	users.users.dasha = {
		hashedPassword = "$y$j9T$WGMPv/bRhGBUidcZLZ7CE/$raZhwFFdI/XvegVZVHLILJLMiBkOxSErc6gao/Cxt33"; # Use `mkpasswd`.
		uid            = 1001;
		createHome     = true;
		isNormalUser   = true;
		description    = "Daria Dranchak";
		extraGroups    = [ "networkmanager" ];
		packages       = with pkgs; [ ];
	};
}
