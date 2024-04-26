{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ keyd ];
	services.keyd = {
		enable = true;
		keyboards.default = {
			ids = [ "*" ];
			settings = {
				main = {
					capslock     = "overload(control, esc)";
					compose      = "layer(layer_macro)";
					esc          = "capslock";
					rightalt     = "layer(layer_rightalt)";
					rightcontrol = "layer(layer_control)";
					rightshift   = "layer(layer_rightshift)";
					leftcontrol  = "overload(layer_alternative, leftcontrol)";
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
				};

				layer_macro = {};

				# Vacant layers.
				layer_rightalt = {};
				layer_rightshift = {};
			};
		};
	};

	# HACK: Workaround for https://github.com/NixOS/nixpkgs/issues/290161
	users.groups.keyd = {};
	systemd.services.keyd.serviceConfig.CapabilityBoundingSet = [ "CAP_SETGID" ];
}
