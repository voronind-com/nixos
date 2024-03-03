{ pkgs, lib, specialArgs, ... }: {
	imports = [
		./home/Voronind.nix
	];
	users.users.voronind = {
		hashedPassword = specialArgs.const.hashedPassword;
		uid            = 1000;
		createHome     = true;
		isNormalUser   = true;
		description    = "Dmitry Voronin";
		extraGroups    = [ "networkmanager" ];
		packages       = with pkgs; [ ];
	};
}
