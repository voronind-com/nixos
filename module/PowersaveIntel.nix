{ pkgs, lib, ... }: {
	systemd.services.powersave = {
		description = "Intel disable Boost";
		enable      = true;
		wantedBy    = [ "multi-user.target" ];
		serviceConfig = {
			Type = "simple";
			RemainAfterExit = "yes";
			ExecStart = "${lib.getExe pkgs.bash} -c 'echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo'";
			ExecStop  = "${lib.getExe pkgs.bash} -c 'echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo'";
		};
	};
}
