{ controlFileMax
, controlFileMin
, onMax
, onMin
, offMax
, offMin
, ... }: {
	script = ''
		function toggle() {
			if status; then
				echo ${offMax} > ${controlFileMax}
				echo ${offMin} > ${controlFileMin}
			else
				echo ${onMin} > ${controlFileMin}
				echo ${onMax} > ${controlFileMax}
			fi

			true
		}

		function waybar() {
			status || echo -n ""
		}

		function status() {
			local current=$(cat ${controlFileMax})
			local enabled="${onMax}"

			[[ "''${current}" = "''${enabled}" ]]
		}

		''${@}
	'';
}
