{ pkgs, color, ... }: let
	script = pkgs.writeShellScriptBin "tmux_script" (builtins.readFile ./tmux/Script.sh);
in {
	programs.tmux = {
		enable = true;
		extraConfig = ''
			set -g @COLOR_BG #${color.bg}
			set -g @COLOR_DARKGRAY #${color.darkgray}
			set -g @COLOR_YELLOW #${color.yellow}
		'' + (builtins.readFile ./tmux/tmux.conf);
	};
	environment.systemPackages = [ script ];
}
