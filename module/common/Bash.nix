{ lib, style, util, pkgs, ... } @args: let
	bash = import ./bash args;
in {
	programs.bash.interactiveShellInit = bash.config;
	environment.shellAliases = lib.mkForce {};
	environment.variables = {
		TERM = "xterm-256color";
	};
}
