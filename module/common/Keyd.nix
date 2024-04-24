{ ... }: {
	services.keyd = {
		enable = true;
		keyboards.default = {
			ids = [ "*" ];
			settings = {
				main = {
					capslock     = "overload(control, esc)";
					compose      = "layer(compose)";
					esc          = "capslock";
					rightalt     = "layer(rightalt)";
					rightcontrol = "layer(rightcontrol)";
					rightshift   = "layer(rightshift)";
				};
				rightalt = {};
				rightcontrol = {};
				rightshift = {};
				compose = {};
			};
		};
	};
}
