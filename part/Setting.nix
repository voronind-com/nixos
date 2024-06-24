# Global settings.
# Just like I can configure each package, here I configure my config! :O)
{ pkgs
, config
,lib
, ... }: {
	options.setting = with lib; {
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

		dpiAware = mkOption {
			default = false;
			type    = types.bool;
		};

		sysctrl = mkOption {
			default = "print";
			type    = types.str;
		};

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
