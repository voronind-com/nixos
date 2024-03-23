{ lib, ... }: {
	programs.bash.interactiveShellInit = "source $BASH_PATH/Bashrc.sh";
	environment.shellAliases = lib.mkForce {};
	environment.variables = {
		BASH_PATH = ./bash;
		TERM      = "xterm-256color";
	};
}
