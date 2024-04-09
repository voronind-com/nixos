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
		# yubioath-desktop # OTP.
	];

	# Store GPG data on tmpfs.
	environment.variables = {
		# GNUPGHOME = "$(mktemp -d -t gnupg-$(date +%Y-%m-%d)-XXXXXXXXXX)";
	};
}
