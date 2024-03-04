{ pkgs, lib, const, ... }: {
	imports = [
		./home/Voronind.nix
	];
	users.users.voronind = {
		hashedPassword = const.hashedPassword;
		uid            = 1000;
		createHome     = true;
		isNormalUser   = true;
		description    = "Dmitry Voronin";
		extraGroups    = [ "networkmanager" ];
		packages       = with pkgs; [ ];
	};
}
