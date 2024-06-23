# Global settings.
# Just like I can configure each package, here I configure my config! :O)
{ ... }: {
	ollama.primaryModel = "llama3";
	browser.bin  = "firefox-esr";
	terminal.bin = "foot";
	dpiAware = true;
	sysctrl = "print";

	keyboard = {
		layouts = "us,ru";
		options = "grp:toggle";
	};

	refresh = {
		top = 2000;
	};

	step = {
		brightness = 5;
		volume     = 5;
		media      = 10;
	};

	timeout = {
		popup = 5000;
		keyd  = 150;
	};
}
