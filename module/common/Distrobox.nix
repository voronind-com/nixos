{ pkgs, lib, config, ... }: with lib; let
	cfg = config.module.common.distrobox;
in {
	options = {
		module.common.distrobox = {
			enable = mkEnableOption "Distrobox." // { default = true; };
		};
	};

	config = mkIf cfg.enable {
		# Distrobox works best with Podman, so enable it here.
		module.podman.enable = true;

		environment.systemPackages = with pkgs; [ distrobox ];
	};
}
