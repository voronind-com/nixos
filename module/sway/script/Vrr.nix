{ ... }: {
	text = ''
		# Enable VRR.
		function vrron() {
			on() {
				_vrrstate on
				swaymsg 'output "Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622" adaptive_sync on'
			}
			_sway_iterate_sockets on
		}

		# Disable VRR.
		function vrroff() {
			off() {
				_vrrstate off
				swaymsg 'output "Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622" adaptive_sync off'
			}
			_sway_iterate_sockets off
		}

		# Toggle VRR.
		function vrrtoggle() {
			if [[ "$(_vrrstate)" = "on" ]]; then
				vrroff
			else
				vrron
			fi
		}

		function _vrrstate() {
			if [[ "''${1}" = "" ]]; then
				cat /tmp/.vrrstate 2> /dev/null || echo off
			else
				echo "''${*}" > /tmp/.vrrstate
			fi
		}
	'';
}
