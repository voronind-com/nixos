{ pkgs, ... }: let
	script = pkgs.writeShellScriptBin "tmux_script" (builtins.readFile ./tmux/Script.sh);
in {
	programs.tmux = {
		enable = true;
		extraConfig = builtins.readFile ./tmux/tmux.conf;
	};
	environment.systemPackages = [ script ];
}
