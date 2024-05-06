{ pkgs, lib, ... }: let
	controlFileMin = "/sys/class/power_supply/BAT0/charge_control_start_threshold";
	controlFileMax = "/sys/class/power_supply/BAT0/charge_control_end_threshold";

	onMin  = "40";
	onMax  = "80";
	offMin = "90";
	offMax = "95";

	script = pkgs.writeShellScriptBin "powerlimit" ''
		function _toggle() {
			if _status; then
				echo ${offMax} > ${controlFileMax}
				echo ${offMin} > ${controlFileMin}
			else
				echo ${onMin} > ${controlFileMin}
				echo ${onMax} > ${controlFileMax}
			fi

			true
		}

		function _waybar() {
			_status || echo -n ""
		}

		function _status() {
			local current=$(cat ${controlFileMax})
			local enabled="${onMax}"

			[[ "''${current}" = "''${enabled}" ]]
		}

		_''${1}
	'';
in {
	systemd = {
		services.powerlimit = {
			description = "Limit battery charge.";
			enable      = true;
			wantedBy    = [ "multi-user.target" ];
			serviceConfig = {
				Type = "simple";
				RemainAfterExit = "yes";
				ExecStart = "${lib.getExe pkgs.bash} -c 'echo 40 > ${controlFileMin}; echo 80 > ${controlFileMax};'";
				ExecStop  = "${lib.getExe pkgs.bash} -c 'echo 95 > ${controlFileMax}; echo 90 > ${controlFileMin};'";
			};
		};

		# NOTE: Allow user access.
		tmpfiles.rules = [
			"z ${controlFileMax} 0777 - - - -"
			"z ${controlFileMin} 0777 - - - -"
		];
	};

	environment.systemPackages = [ script ];
}
