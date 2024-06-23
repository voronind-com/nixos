{ pkgs, setting, ... }: {
	variables = {
		EDITOR               = "nvim";
		MANPAGER             = "nvim +Man!";
		NIXPKGS_ALLOW_UNFREE = "1";
		NIX_CURRENT_SYSTEM   = "${pkgs.stdenv.system}";
		TERM                 = "xterm-256color";
		TERMINAL             = setting.terminal.bin;
	};
}
