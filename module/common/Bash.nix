{ environment, lib, ... }: {
	environment.etc.bash.source        = ./bash;
	environment.shellAliases           = lib.mkForce {};
	environment.variables.BASH_PATH    = "/etc/bash";
	programs.bash.interactiveShellInit = "source /etc/bash/Bashrc.sh";
}
