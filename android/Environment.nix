{ pkgs, ... }: {
	variables = {
		# Default text editor.
		EDITOR = "nvim";

		# App to use for man pages.
		MANPAGER = "nvim +Man!";

		# Allow unfree packages in shell.
		NIXPKGS_ALLOW_UNFREE = "1";

		# Current system architecture.
		NIX_CURRENT_SYSTEM = "${pkgs.stdenv.system}";

		# Terminal settings.
		TERM = "xterm-256color";
	};
}
