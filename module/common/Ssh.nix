{ pkgs, util, ... } @args: let
	ssh = import ./ssh args;
in {
	environment.systemPackages = with pkgs; [ sshfs ];
	programs.ssh.extraConfig   = ssh.config;
}
