# Global settings.
# Just like I can configure each package, here I configure my config! :O)
{ ... }: {
	tmux = {
		resize.step = {
			vertical   = 1;
			horizontal = 1;
		};
	};

	nvim = {
		editor = {
			relativenumber = true;
			indent.default = 2;
		};
		resize.step = {
			vertical   = 2;
			horizontal = 4;
		};
	};

	sway = {
		resize.step = {
			vertical   = 10;
			horizontal = 10;
		};
	};

	foot = {
		font = {
			step = 1;
		};
	};

	top.refresh.ms   = 2000;
	popup.timeout.ms = 5000;
	keyd.timeout.ms  = 150;

	brightness.step = 5;
	volume.step     = 5;
	media.step      = 10;

	keyboard = {
		layouts = "us,ru";
		options = "grp:toggle";
	};

	ollama.primaryModel = "llama3";

	browser  = "firefox-esr";
	terminal = "foot";

	dpiAware = true;
}
