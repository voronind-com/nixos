{ pkgs, ... }: {
	# GPG.
	services.udev.packages = [ pkgs.yubikey-personalization ];

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};

	# Extra packages.
	environment.systemPackages = with pkgs; [
		yubikey-manager  # Yubikey Manager.
		yubioath-desktop # OTP.
	];
}
