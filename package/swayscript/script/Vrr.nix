# TODO: Add different modes for different screens.
{ ... }: {
	text = ''
		# Enable VRR.
		function vrron() {
			on() {
				swaymsg "output \"Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622\" adaptive_sync on"
				swaymsg "output \"Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622\" mode 3440x1440@164.999Hz"
				swaymsg "output \"AOC 24G2W1G4 ATNL61A129625\" adaptive_sync on"
				swaymsg "output \"AOC 24G2W1G4 ATNL61A129625\" mode 1920x1080@144.000Hz"
				_vrrstate on
			}
			_sway_iterate_sockets on
		}

		# Disable VRR.
		function vrroff() {
			off() {
				swaymsg "output \"Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622\" adaptive_sync off"
				swaymsg "output \"Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622\" mode 3440x1440@59.973Hz"
				swaymsg "output \"AOC 24G2W1G4 ATNL61A129625\" adaptive_sync off"
				swaymsg "output \"AOC 24G2W1G4 ATNL61A129625\" mode 1920x1080@60.000Hz"
				_vrrstate off
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
