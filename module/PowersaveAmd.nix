{ pkgs, lib, ... }: {
	# Requirements:
	# CPPC (Collaborative Power Control) - Disabled.
	# PSS  (Cool and Quiet)              - Enabled.
	systemd.services.powersave = {
		description = "AMD disable Boost";
		enable      = true;
		wantedBy    = [ "multi-user.target" ];
		serviceConfig = {
			Type = "simple";
			RemainAfterExit = "yes";
			ExecStart = "${lib.getExe pkgs.bash} -c 'echo 0 > /sys/devices/system/cpu/cpufreq/boost'";
			ExecStop  = "${lib.getExe pkgs.bash} -c 'echo 1 > /sys/devices/system/cpu/cpufreq/boost'";
		};
	};
}
