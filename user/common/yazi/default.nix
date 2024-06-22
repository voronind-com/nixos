{ pkgs, setting, util, ... } @args: {
	init   = (import ./module/Init.nix args).file;
	keymap = (import ./module/Keymap.nix args).file;
	yazi   = (import ./module/Yazi.nix args).file;
}
