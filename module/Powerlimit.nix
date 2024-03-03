{ pkgs, lib, ... }: {
	systemd.services.powerlimit = {
		description = "Limit battery charge.";
		enable      = true;
		wantedBy    = [ "multi-user.target" ];
		serviceConfig = {
			Type = "simple";
			RemainAfterExit = "yes";
			ExecStart = "${lib.getExe pkgs.bash} -c 'echo 40 > /sys/class/power_supply/BAT0/charge_control_start_threshold; echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold;'";
			ExecStop  = "${lib.getExe pkgs.bash} -c 'echo 95 > /sys/class/power_supply/BAT0/charge_control_end_threshold; echo 90 > /sys/class/power_supply/BAT0/charge_control_start_threshold;'";
		};
	};
}
