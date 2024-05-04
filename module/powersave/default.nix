# Disable CPU boost after boot. Control with `powersave` script.
{ lib, pkgs, controlFile, enable, disable, ... }: {
	systemd = {
		services.powersave = {
			description = "Disable CPU Boost";
			enable      = true;
			wantedBy    = [ "multi-user.target" ];
			serviceConfig = {
				Type = "simple";
				RemainAfterExit = "yes";
				ExecStart = "${lib.getExe pkgs.bash} -c 'echo ${enable} > ${controlFile}'";
				ExecStop  = "${lib.getExe pkgs.bash} -c 'echo ${disable} > ${controlFile}'";
			};
		};

		# HACK: Allow user access.
		tmpfiles.rules = [ "z ${controlFile} 0777 - - - -" ];
	};
}
