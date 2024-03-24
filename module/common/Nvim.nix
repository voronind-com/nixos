{ inputs, pkgs, ... }: let
	nvimCfg = import ./nvim/Init.nix { inputs = inputs; };
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
			customRC = nvimCfg.customRc;
		};
	};
}
