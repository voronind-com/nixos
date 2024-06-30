# This is a common user configuration.
{ const
, util
, config
, lib
, __findFile
, ... } @args: with lib; let
	cfg = config.home.hm;
	package = import <package> args;
in {
	options = {
		home.hm = {
			enable = mkEnableOption "Home-Manager standalone config.";
			username = mkOption {
				default = null;
				type    = types.str;
			};
			homeDirectory = mkOption {
				default = "/home/${cfg.username}";
				type    = types.str;
			};
			packages = mkOption {
				default = {};
				type    = types.submodule {
					options = {
						core.enable     = mkEnableOption "Core apps.";
						common.enable   = mkEnableOption "Common apps.";
						desktop.enable  = mkEnableOption "Desktop apps.";
						gaming.enable   = mkEnableOption "Gaming apps.";
						creative.enable = mkEnableOption "Creative apps.";
						dev.enable      = mkEnableOption "Dev apps.";
						extra.enable    = mkEnableOption "Extra apps.";
					};
				};
			};
		};
	};

	config = mkIf cfg.enable (mkMerge [
		{
			home = {
				inherit (cfg) username homeDirectory;
				inherit (const) stateVersion;
				file             = import ./config args;
				sessionVariables = import ./variable args;
			};
			xdg      = import ./xdg { inherit (cfg) homeDirectory; };
			programs = import ./program args;
			dconf.settings = util.catSet (util.ls ./config/dconf) args;
		}
		(mkIf cfg.packages.core.enable     { home.packages = package.core;     })
		(mkIf cfg.packages.common.enable   { home.packages = package.common;   })
		(mkIf cfg.packages.desktop.enable  { home.packages = package.desktop;  })
		(mkIf cfg.packages.gaming.enable   { home.packages = package.gaming;   })
		(mkIf cfg.packages.creative.enable { home.packages = package.creative; })
		(mkIf cfg.packages.dev.enable      { home.packages = package.dev;      })
		(mkIf cfg.packages.extra.enable    { home.packages = package.extra;    })
	]);
}
