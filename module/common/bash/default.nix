{ style, util, pkgs, ... } @args: let
	modules = pkgs.writeText "bashModules" (util.trimTabs (builtins.foldl' (acc: mod:
		acc + (import mod args).text
	) "" (util.ls ./module)));
in {
	inherit modules;

	config = util.trimTabs (''
		# If not running interactively, don't do anything.
		# [[ "$-" != *i* ]] && return

		'') + builtins.readFile modules + util.trimTabs (''

		# Find all functions.
		function find_function() {
			/usr/bin/env cat ${modules} | /usr/bin/env grep "^function.*()" | /usr/bin/env sed -e "s/^function //" -e "s/().*//"
		}

		# Export all functions.
		export -f $(find_function | tr '\n' ' ')
		export -f find_function

		# Autostart Sway.
		if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
			exec sway
		fi
	'');
}
