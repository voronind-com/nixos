{ inputs, ... }: let
	nvimCfg = import ./nvim/Init.nix { inputs = inputs; };
in {
	environment = {
		variables = {
			EDITOR   = "nvim";
			MANPAGER = "nvim +Man!";
		};
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
