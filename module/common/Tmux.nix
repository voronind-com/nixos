{ pkgs, style, key, util, ... } @args: let
	tmux   = import ./tmux/Init.nix args;
	script = pkgs.writeShellScriptBin "tmux_script" tmux.script;
in {
	programs.tmux = {
		enable = true;
		extraConfig = tmux.config;
	};
	environment.systemPackages = [ script ];
}
