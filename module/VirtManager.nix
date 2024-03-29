{ pkgs, ... }: {
	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable   = true;

	# HACK: Fixes bug: https://www.reddit.com/r/NixOS/comments/1afbjiu/i_get_a_nonetype_error_when_trying_to_launch_a_vm/
	environment.systemPackages = with pkgs; [
		# glib
		gnome3.adwaita-icon-theme # default gnome cursors,
	];
	###
}
