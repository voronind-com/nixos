{ pkgs, wallpaper, style, util, setting, ... } @args: let
	mkConfig = { modules }: builtins.foldl' (acc: mod:
		acc + (import mod args).text
	) "" modules;

	swayRc = mkConfig {
		modules = [
			./module/Style.nix
			./module/Display.nix
			./module/Input.nix
			./module/Mod.nix
			./module/Font.nix
			./module/Launcher.nix
			./module/Terminal.nix
			./module/TitleBar.nix
			./module/Brightness.nix
			./module/Navigation.nix
			./module/Notification.nix
			./module/Resize.nix
			./module/ScratchPad.nix
			./module/Screenshot.nix
			./module/Sound.nix
			./module/Tiling.nix
			./module/Workspace.nix
			./module/Session.nix
			./module/Keyd.nix
		];
	};
in {
	config = util.trimTabs (''
		# Read `man 5 sway` for a complete reference.
		include /etc/sway/config.d/*
	'' + swayRc);
}

