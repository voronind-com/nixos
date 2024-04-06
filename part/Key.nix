{ ... }: {
	meta = {
		app.nvim   = " ";
		shell.tmux = "M";
		window = {
			sway  = "Mod4";
			gnome = "<Super>";
		};
	};

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
		launch = "Space";
		repeat = ".";
	};

	nvim = {
		buffer.new = "n";
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
		notification = {
			dismiss = "shift+N";
			restore = "n";
		};
		screenshot = {
			selection = "v";
			screen    = "shift+V";
		};
		launch.terminal = "Escape";
		window = {
			floating = {
				toggle = "shift+f";
				cycle  = "r";
			};
			split = {
				horizontal = "backslash";
				vertical   = "minus";
			};
			layout.toggle = "Tab";
			fullscreen = "f";
		};
	};

	gnome = {
		window = {
			switch     = "Tab";
			fullscreen = "f";
		};
		launch.terminal = "Escape";
		screenshot = "v";
	};
}
