{ pkgs, util, ... } @args: let
	ssh = import ./ssh args;
in {
	programs.ssh.extraConfig = ssh.config;

	# Add SSHFS to mount remote filesystems over SSH.
	environment.systemPackages = with pkgs; [ sshfs ];
}
