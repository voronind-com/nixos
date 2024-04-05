{ style, ... }: let
	accent-b   = style.color.accent-b;
	accent-g   = style.color.accent-g;
	accent-r   = style.color.accent-r;
	negative-b = style.color.negative-b;
	negative-g = style.color.negative-g;
	negative-r = style.color.negative-r;
	neutral-b  = style.color.neutral-b;
	neutral-g  = style.color.neutral-g;
	neutral-r  = style.color.neutral-r;
	positive-b = style.color.positive-b;
	positive-g = style.color.positive-g;
	positive-r = style.color.positive-r;

	accent = style.color.accent;
	bg     = style.color.bg_dark;
	fg     = style.color.fg_light;

	fontNamePopup = style.font.serif.name;
	fontSizePopup = style.font.size.popup;
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
		export bg="${bg}"
		export fg="${fg}"
		export accent="${accent}"

		# Define font.
		export font_name_popup="${fontNamePopup}"
		export font_size_popup="${toString(fontSizePopup)}"

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
