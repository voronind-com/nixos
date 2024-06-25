# I want to pull all the Apk files in their current state
# so that I always have an access to clients that match
# my service versions.
{ pkgs, lib, config, ... } @args: with lib; let
	cfg = config.module.common.apks;
	package = (pkgs.callPackage ./apks args);
in {
	options = {
		module.common.apks = {
			enable = mkEnableOption "Android Apps Apk" // { default = true; };
		};
	};

	config = mkIf cfg.enable {
		environment.etc.apks.source = package;
	};
}
