{ pkgs, ... }: {
	hardware.opentabletdriver.enable = true;
	environment.systemPackages = with pkgs; [
		krita
	];
}
