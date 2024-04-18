{ ... }: {
	navigation = {
		go = {
			down  = "s";
			left  = "a";
			right = "d";
			up    = "w";
			next  = "e";
			prev  = "q";
		};
		move = {
			down  = "S";
			left  = "A";
			right = "D";
			up    = "W";
			next  = "E";
			prev  = "Q";
		};
	};

	action = {
		resize = {
			down  = "j";
			left  = "h";
			right = "l";
			up    = "k";
			begin    = "r";
			equalize = "=";
		};
		split = {
			horizontal = "-";
			vertical   = "\\\\";
		};
		close  = "x";
		kill   = "X";
		hide   = "c";
		seek   = "C";
		wait   = "z";
		exit   = "Z";
		launch = "r";
		repeat = ".";
	};

	nvim = {
		buffer.new = "n";
		leader     = " ";
		colorscheme.toggle = {
			contrast = "[";
			light    = "]";
		};
		editor = {
			indent.size = "<Tab>";
			git.inspect = "g";
		};
		telescope = {
			mod        = "f";
			all        = "a";
			buffer     = "b";
			file       = "f";
			grep       = "g";
			help       = "h";
			treesitter = "t";
		};
		text = {
			comment = "/";
			prompt  = "p";
			sort    = "A";
		};
		window = {
			filetree = "1";
			trouble  = "2";
			todo     = "3";
			terminal = "4";
			whichkey = "?";
		};
	};

	tmux = {
		mod    = "M";
		prefix = "t";
		reload = "r";
		scroll = {
			down = "n";
			up   = "p";
		};
		copy = {
			copy   = "y";
			paste  = "P";
			select = "v";
		};
		session = {
			choose = "g";
			next   = "0";
			prev   = "9";
		};
		status = {
			toggle = "F";
			uber   = "f";
		};
		window = {
			new        = "Escape";
			new_compat = "t";
		};
	};

	sway = {
		launch.terminal = "Escape";
		mod = "Mod4";
		notification = {
			dismiss = "shift+N";
			restore = "n";
		};
		screenshot = {
			selection = "v";
			screen    = "shift+V";
		};
		window = {
			layout.toggle = "Tab";
			fullscreen    = "f";
			floating = {
				toggle = "shift+f";
				cycle  = "shift+r";
			};
			split = {
				horizontal = "backslash";
				vertical   = "minus";
			};
		};
	};

	gnome = {
		launch.terminal = "Escape";
		mod        = "<Super>";
		screenshot = "v";
		window = {
			switch     = "Tab";
			fullscreen = "f";
		};
	};
}
