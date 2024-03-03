{ pkgs, lib, ... }: let
	list = "~/.config/linux/Flatpak.txt";
in {
	# Enable Flatpaks.
	services.flatpak.enable = true;

	# Bootstrap apps on boot.
	systemd.services.flatpakinstall = {
		description = "Install Flatpak apps.";
		wantedBy    = [ "multi-user.target" ];
		wants       = [ "dotfiles.service" ];
		after       = [ "dotfiles.service" ];
		serviceConfig.Type = "oneshot";
		script = ''
			${lib.getExe pkgs.flatpak} remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
			[[ -f ${list} ]] && cat ${list} | cut -f2 | ${lib.getExe pkgs.parallel} -j1 -- ${lib.getExe pkgs.flatpak} install -y --system {}
		'';
	};
}
