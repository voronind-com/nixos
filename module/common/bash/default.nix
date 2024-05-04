{ style, util, pkgs, ... } @args: let
	modules     = util.catText (util.ls ./module) args;
	modulesFile = pkgs.writeText "bashModules" modules;
in {
	inherit modules;

	config = modules + util.trimTabs (''
		# Find all functions.
		function find_function() {
			/usr/bin/env cat ${modulesFile} | /usr/bin/env grep "^function.*()" | /usr/bin/env sed -e "s/^function //" -e "s/().*//"
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
