{ pkgs, lib, ... }: {
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
					esc          = "layer(layer_system)";                      # System controls.
					leftcontrol  = "overload(layer_alternative, leftcontrol)"; # Alternative layer for home, end etc.
					print        = "layer(layer_macro)";                       # ThinkPad remap to compose.
					rightalt     = "capslock";                                 # Language toggle.
					rightcontrol = "layer(layer_control)";                     # Media and other controls.
					rightshift   = "backspace";                                # Backspace.
				};

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
					# space = "macro2(1, 100, macro(space))"; # NOTE: Possible bhop example.
				};

				layer_control = {
					space = "playpause";
					w = "volumeup";
					s = "volumedown";
					d = "forward";
					a = "back";
					e = "nextsong";
					q = "previoussong";
					x = "mute";
					z = "stopcd";
				};

				layer_system = {
					f = "command(swayscript montoggle)";
					c = "command(loginctl kill-user voronind)";
					l = "command(powerlimit toggle)";
					m = "command(swayscript montoggle)";
					p = "command(powersave toggle)";
					v = "command(swayscript vrrtoggle)";
					x = "command(systemctl poweroff -i)";
					z = "command(systemctl suspend -i)";
				};

				layer_macro = {};
			};
		};
	};

	# HACK: Workaround for https://github.com/NixOS/nixpkgs/issues/290161
	users.groups.keyd = {};
	systemd.services.keyd.serviceConfig.CapabilityBoundingSet = [ "CAP_SETGID" ];

	# HACK: Workaround for powersave/powerlimit/swayscript scripts.
	systemd.services.keyd.serviceConfig.ProtectKernelTunables = lib.mkForce false;
	# systemd.services.keyd.serviceConfig.ProtectHome           = lib.mkForce false;
	# systemd.services.keyd.environment.KEYD_DEBUG = "1";
}
