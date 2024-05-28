{ pkgs, key, ... }: {
	environment.systemPackages = with pkgs; [ keyd ];

	services.keyd = {
		enable = true;
		keyboards.default = {
			ids = [ "*" ];
			settings = {
				main = {
					backspace    = "delete";                                   # Delete key on backspace.
					capslock     = "overload(control, esc)";                   # Ctrl/esc combo.
					compose      = "layer(layer_macro)";                       # Input macros.
					esc          = "${key.sysctrl}";                           # System controls.
					leftcontrol  = "overload(layer_alternative, leftcontrol)"; # Alternative layer for home, end etc.
					rightcontrol = "layer(layer_control)";                     # Media and other controls.
					rightshift   = "backspace";                                # Backspace.
				};

				# Alternative navigation.
				layer_alternative = {
					w = "pageup";
					a = "home";
					s = "pagedown";
					d = "end";
					x = "cut";
					c = "copy";
					v = "paste";
					h = "left";
					j = "down";
					k = "up";
					l = "right";
					esc = "esc";
					rightcontrol = "leftcontrol";
					# space = "macro2(1, 100, macro(space))"; # NOTE: Possible bhop example. Use in per-application, not here.
				};

				# Media controls.
				layer_control = {
					space = "playpause";
					w = "volumeup";
					s = "volumedown";
					d = "forward";
					a = "back";
					e = "nextsong";
					q = "previoussong";
					x = "stopcd";
					z = "mute";
				};

				layer_macro = {};
			};
		};
	};

	# HACK: Workaround for https://github.com/NixOS/nixpkgs/issues/290161
	users.groups.keyd = {};
	systemd.services.keyd.serviceConfig.CapabilityBoundingSet = [ "CAP_SETGID" ];

	# Debug toggle just in case I need it again.
	# systemd.services.keyd.environment.KEYD_DEBUG = "1";
}
