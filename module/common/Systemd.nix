{ ... }: {
	# HACK: Fix for broken tmpfiles setup for some services like PowerLimit.
	systemd.timers.tmpfilesfix = {
		timerConfig = {
			OnBootSec = 5;
			Unit      = "systemd-tmpfiles-resetup.service";
		};
		wantedBy = [ "timers.target" ];
	};
}
