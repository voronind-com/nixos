{ pkgs, ... }: let
	tmux_script = pkgs.writeShellScriptBin "tmux_script" (builtins.readFile ./tmux/tmux_script.sh);
in {
	programs.tmux = {
		enable = true;
		extraConfig = builtins.readFile ./tmux/tmux.conf;
	};
	environment.systemPackages = [ tmux_script ];
}
