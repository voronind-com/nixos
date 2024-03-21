{ lib, ... }: {
	programs.bash.interactiveShellInit = "source /etc/bash/Bashrc.sh";
	environment.etc.bash.source = ./bash;
	environment.shellAliases    = lib.mkForce {};
	environment.variables = {
		BASH_PATH = "/etc/bash";
		TERM      = "xterm-256color";
	};
}
