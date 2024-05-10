{ const, pkgs, lib, secret, util, ... }: {
	systemd.services.autoupdate = util.mkStaticSystemdService {
		enable      = true;
		description = "Signed system auto-update.";
		serviceConfig.Type = "oneshot";
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
