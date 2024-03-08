{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ sshfs ];
	programs.ssh.extraConfig = builtins.readFile ./ssh/config;
}
