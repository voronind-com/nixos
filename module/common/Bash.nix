{ lib, config, ... }: let
	bash = import ./bash/Bash.nix { config = config; };
in {
	programs.bash.interactiveShellInit = bash.config;
	environment.shellAliases = lib.mkForce {};
	environment.variables = {
		BASH_PATH = ./bash;
		TERM      = "xterm-256color";
	};
}
