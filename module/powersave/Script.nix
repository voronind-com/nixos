{ controlFile, enable, disable, ... }: {
	script = ''
		function _toggle() {
			if _status; then
				echo ${disable} > ${controlFile}
			else
				echo ${enable} > ${controlFile}
			fi

			true
		}

		function _waybar() {
			_status || echo -n "󰓅"
		}

		function _status() {
			local current=$(cat ${controlFile})
			local enabled="${enable}"

			[[ "''${current}" = "''${enabled}" ]]
		}

		_''${1}
	'';
}
