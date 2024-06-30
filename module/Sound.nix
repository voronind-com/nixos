{ lib, config, ... }: with lib; let
	cfg = config.module.desktop.sound;
in {
	options = {
		module.desktop.sound.enable = mkEnableOption "Sound.";
	};

	config = mkIf cfg.enable {
		sound.enable = true;
		hardware.pulseaudio.enable = false;
		security.rtkit.enable      = true;
		services.pipewire = {
			enable       = true;
			pulse.enable = true;
			alsa = {
				enable       = true;
				support32Bit = true;
			};
		};
	};
}
