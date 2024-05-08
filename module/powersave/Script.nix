{ controlFile, enable, disable, ... }: {
	script = ''
		function toggle() {
			if status; then
				echo ${disable} > ${controlFile}
			else
				echo ${enable} > ${controlFile}
			fi

			true
		}

		function waybar() {
			status || echo -n "󰓅"
		}

		function status() {
			local current=$(cat ${controlFile})
			local enabled="${enable}"

			[[ "''${current}" = "''${enabled}" ]]
		}

		''${@}
	'';
}
