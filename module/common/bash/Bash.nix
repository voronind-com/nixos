{ config, ... }: let
	negative-r = config.lib.stylix.colors.base08-rgb-r;
	negative-g = config.lib.stylix.colors.base08-rgb-g;
	negative-b = config.lib.stylix.colors.base08-rgb-b;
	neutral-r = config.lib.stylix.colors.base0C-rgb-r;
	neutral-g = config.lib.stylix.colors.base0C-rgb-g;
	neutral-b = config.lib.stylix.colors.base0C-rgb-b;
	positive-r = config.lib.stylix.colors.base0B-rgb-r;
	positive-g = config.lib.stylix.colors.base0B-rgb-g;
	positive-b = config.lib.stylix.colors.base0B-rgb-b;
	accent-r = config.lib.stylix.colors.base0A-rgb-r;
	accent-g = config.lib.stylix.colors.base0A-rgb-g;
	accent-b = config.lib.stylix.colors.base0A-rgb-b;
in {
	config = ''
		# If not running interactively, don't do anything.
		[[ "$-" != *i* ]] && return

		# Src system bashrc.
		[[ -f /etc/bashrc ]] && source /etc/bashrc

		# Define colors.
		export negative_rgb="${negative-r};${negative-g};${negative-b}"
		export neutral_rgb="${neutral-r};${neutral-g};${neutral-b}"
		export positive_rgb="${positive-r};${positive-g};${positive-b}"
		export accent_rgb="${accent-r};${accent-g};${accent-b}"

		# Src custom modules.
		for module in $BASH_PATH/module/*.sh; do
			source "$module"
		done

		# Alias to reload.
		function bashrc() {
			source $BASH_PATH/Bashrc.sh
		}

		# Export all functions.
		export -f $(find_function | tr '\n' ' ')

		# Autostart Sway.
		if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
			exec sway
		fi
	'';
}
