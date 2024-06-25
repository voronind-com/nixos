{ const
, util
, style
, pkgs
, lib
, config
, key
, secret
, ... } @args: with lib; let
	cfg = config.user.voronind;
in {
	options = {
		user.voronind.enable = mkEnableOption "voronind";
	};

	config = mkIf cfg.enable {
		user.common.users = [{ name = "voronind"; homeDir = "/home/voronind"; }];

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
	};
}
