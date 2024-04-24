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
				};

				layer_control = {
					space = "playpause";
					w = "volumeup";
					s = "volumedown";
					d = "nextsong";
					a = "previoussong";
				};

				layer_macro = {
					w = "macro(enter 10ms r enter)";
					a = "macro(enter 10ms N o enter)";
					s = "macro(enter 10ms W a i t enter)";
					d = "macro(enter 10ms Y e s enter)";
					q = "macro(enter 10ms S o r r y ! enter)";
					e = "macro(enter 10ms T h a n k s ! enter)";
					g = "macro(enter 10ms g g enter)";
					z = "macro(enter 10ms < space L e f t enter)";
					x = "macro(enter 10ms > space H e r e space < enter)";
					c = "macro(enter 10ms > space R i g h t enter)";
					r = "macro(enter 10ms N e e d space m o r e space a m m o enter)";
					t = "macro(enter 10ms M a y space I space t a k e space e x t r a ? enter)";
					f = "macro(enter 10ms A F K enter)";
					v = "macro(enter 10ms I space n e e d space h e l p ! enter)";
					b = "macro(enter 10ms I ' m space b a c k enter)";
				};

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
