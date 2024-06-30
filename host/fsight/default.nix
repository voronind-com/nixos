{ ... }: {
	imports = [
		./Grub.nix
		./Root.nix
	];

	home.nixos.enable = true;
	module.docker = {
		enable    = true;
		autostart = true;
		rootless  = false;
	};
}
