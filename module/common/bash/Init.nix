{ style, util, pkgs, ... } @args: let
	bashRc = pkgs.writeText "bashRc" (util.trimTabs (builtins.foldl' (acc: mod:
		acc + (import mod args).text
	) "" (util.ls ./module)));
in {
	config = util.trimTabs (''
		# If not running interactively, don't do anything.
		[[ "$-" != *i* ]] && return

		'') + builtins.readFile bashRc + util.trimTabs (''

		# Find all functions.
		function find_function() {
			/usr/bin/env cat ${bashRc} | /usr/bin/env grep "^function.*()" | /usr/bin/env sed -e "s/^function //" -e "s/().*//"
		}

		# Export all functions.
		export -f $(find_function | tr '\n' ' ')

		# Autostart Sway.
		if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
			exec sway
		fi
	'');
}
