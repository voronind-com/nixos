{ config, pkgs, environment, ... }: {
	imports = [ ];

	# Use dedicated GPU by default.
	environment.variables = {
		DRI_PRIME = "1";
	};

	# Filesystems.
	fileSystems."/storage/hot" = {
		device  = "/dev/storage/hot";
		fsType  = "ext4";
		options = [ "nofail" ];
	};
}
