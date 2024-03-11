{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		adwsteamgtk
		android-studio
		blender-hip
		bottles
		gimp
		gradience
		jellyfin
		jetbrains.idea-community
		obs-studio
		onlyoffice-bin
		tor-browser
	];

	hardware.opengl = let
		packages = with pkgs; [
			dxvk
			gamescope
			mangohud
			vkd3d
		];
	in {
		extraPackages   = packages;
		extraPackages32 = packages;
	};

	# Special packages.
	programs.steam.enable = true;
}
