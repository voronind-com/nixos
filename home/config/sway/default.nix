{ pkgs, util, config, ... } @args: let
	# Order is required for Sway configuration.
	swayRc = util.catText [
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
		./module/Waybar.nix
		./module/System.nix
		./module/Mouse.nix
	] args;
in {
	text = (util.trimTabs ''
		# Read `man 5 sway` for a complete reference.
		include /etc/sway/config.d/*
	'') + swayRc;
}

