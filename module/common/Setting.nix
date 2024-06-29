# Global settings.
# Just like I can configure each package, here I configure my config! :O)
{ lib, ... }: {
	options.setting = with lib; {
		# Ollama settings.
		# I use the best light model by default.
		ollama = mkOption {
			default = { };
			type = types.submodule {
				# freeformType = lib.jsonFormat.type;
				options = {
					primaryModel = mkOption {
						default = "llama3";
						type    = types.str;
					};
				};
			};
		};

		# Default browser settings.
		browser = mkOption {
			default = { };
			type = types.submodule {
				options = {
					bin = mkOption {
						default = "firefox-esr";
						type    = types.str;
					};
				};
			};
		};

		# Terminal settings.
		terminal = mkOption {
			default = { };
			type = types.submodule {
				options = {
					bin = mkOption {
						default = "foot";
						type    = types.str;
					};
				};
			};
		};

		# Whether to use Dpi-aware setting in supported apps.
		dpiAware = mkOption {
			default = false;
			type    = types.bool;
		};

		# The key used for system-related shortcuts.
		sysctrl = mkOption {
			default = "print";
			type    = types.str;
		};

		# Keyboard options.
		keyboard = mkOption {
			default = { };
			type = types.submodule {
				options = {
					layouts = mkOption {
						default = "us,ru";
						type    = types.str;
					};
					options = mkOption {
						default = "grp:toggle";
						type    = types.str;
					};
				};
			};
		};

		# Settings related to different refreshes, like top apps.
		refresh = mkOption {
			default = { };
			type = types.submodule {
				options = {
					top = mkOption {
						default = 2000;
						type    = types.int;
					};
				};
			};
		};

		# Configure steps for different actions.
		step = mkOption {
			default = { };
			type = types.submodule {
				options = {
					brightness = mkOption {
						default = 5;
						type    = types.int;
					};
					volume = mkOption {
						default = 5;
						type    = types.int;
					};
					media = mkOption {
						default = 10;
						type    = types.int;
					};
				};
			};
		};

		# Specify timeouts.
		timeout = mkOption {
			default = { };
			type = types.submodule {
				options = {
					popup = mkOption {
						default = 5000;
						type    = types.int;
					};
					keyd = mkOption {
						default = 150;
						type    = types.int;
					};
				};
			};
		};
	};
}
