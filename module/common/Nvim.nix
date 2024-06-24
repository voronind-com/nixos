{ inputs, pkgs, util, key, config, ... } @args: let
	nvim = import ./nvim args;
in {
	environment = {
		variables = {
			EDITOR   = "nvim";       # Use Nvim as a default editor.
			MANPAGER = "nvim +Man!"; # Use Nvim to read man pages.
		};
		systemPackages = with pkgs; [
			gcc # Required for Treesitter parsers.
		];
	};

	programs.neovim = {
		enable = true;
		configure.customRC = nvim.config;
	};
}
