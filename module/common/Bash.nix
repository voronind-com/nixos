{ lib, style, util, pkgs, ... } @args: let
	bash = import ./bash args;
in {
	# Add my bash configuration to all *interactive* shells.
	programs.bash.interactiveShellInit = bash.config;

	# Remove default aliases for `l`, `ll` etc as they break my function definitions.
	environment.shellAliases = lib.mkForce {};

	environment.variables = {
		# Specify terminal mode.
		TERM = "xterm-256color";
	};
}
