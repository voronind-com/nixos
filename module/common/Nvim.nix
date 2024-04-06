{ inputs, pkgs, util, key, setting, ... } @args: let
	nvim = import ./nvim/Init.nix args;
in {
	environment = {
		variables = {
			EDITOR   = "nvim";
			MANPAGER = "nvim +Man!";
		};
		systemPackages = with pkgs; [
			gcc
		];
	};
	programs.neovim = {
		enable   = true;
		viAlias  = true;
		vimAlias = true;
		configure = {
			customRC = nvim.config;
		};
	};
}
