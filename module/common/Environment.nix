{ environment, pkgs, ... }: {
	security.loginDefs.settings.UMASK = "077";
	environment.variables = {
		# Neovim.
		EDITOR   = "nvim";
		MANPAGER = "nvim +Man!";

		# Mangohud.
		MANGOHUD = "1";
		MANGOHUD_CONFIG = "no_display=0,hud_no_margin=1,font_size=12,toggle_hud=F1,fps_sampling_period=1000,fps_limit=165,fps_limit_method=early,af=16,vsync=3,gl_vsync=1,throttling_status=1,cpu_temp=1,gpu_temp=1,gpu_junction_temp=1,device_battery=gamepad,mouse,frame_timing=0,benchmark_percentiles=0,battery=1,battery_time=1,time=1,ram=1,vram=1,swap=1";

		# Proton.
		WINEFSYNC = "1";

		# Nix.
		NIX_CURRENT_SYSTEM = "${pkgs.stdenv.system}";
	};
}
