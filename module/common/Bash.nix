{ lib, style, ... }: let
	bash = import ./bash/Bash.nix { style = style; };
in {
	programs.bash.interactiveShellInit = bash.config;
	environment.shellAliases = lib.mkForce {};
	environment.variables = {
		BASH_PATH = ./bash;
		TERM      = "xterm-256color";
	};
}
