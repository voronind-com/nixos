# TODO: Add different modes for different screens.
{ ... }: {
	text = ''
		export _swayvrrlist=(
			"Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622"
		)

		# Enable VRR.
		function vrron() {
			on() {
				for vrr in ''${_swayvrrlist[@]}; do
					swaymsg "output \"''${vrr}\" adaptive_sync on"
					swaymsg "output \"''${vrr}\" mode 3440x1440@164.999Hz"
				done
				_vrrstate on
			}
			_sway_iterate_sockets on
		}

		# Disable VRR.
		function vrroff() {
			off() {
				for vrr in ''${_swayvrrlist[@]}; do
					swaymsg "output \"''${vrr}\" adaptive_sync off"
					swaymsg "output \"''${vrr}\" mode 3440x1440@59.973Hz"
				done
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
