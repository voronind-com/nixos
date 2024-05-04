{ const, pkgs, lib, secret, ... }: {
	systemd.services.autoupdate = {
		enable = true;
		description        = "Signed system auto-update.";
		restartIfChanged   = false;
		serviceConfig.Type = "oneshot";
		stopIfChanged      = false;
		unitConfig.X-StopOnRemoval = false;
		path = with pkgs; [
			bash
			git
			gnumake
			nixos-rebuild
			openssh
		];
		script = ''
			pushd /tmp
			rm -rf ./nixos
			${lib.getExe pkgs.git} clone --depth=1 --single-branch --branch=main ${const.url} ./nixos
			pushd ./nixos
			${lib.getExe pkgs.git} verify-commit HEAD || {
				echo "Verification failed."
				exit 1
			};
			${lib.getExe pkgs.gnumake} switch
		'';
		after = [ "network-online.target" ];
		wants = [ "network-online.target" ];
	};

	systemd.timers.autoupdate = {
		timerConfig = {
			OnCalendar = "hourly";
			Persistent = true;
			Unit       = "autoupdate.service";
			# RandomizedDelaySec = 60;
		};
		wantedBy = [ "timers.target" ];
	};
}
