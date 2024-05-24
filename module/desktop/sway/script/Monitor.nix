{ ... }: {
	text = ''
		export _swaymonlist=(
			"ASUSTek COMPUTER INC ASUS VA24E R2LMTF127165"
			"AU Optronics 0x418D Unknown"
		)

		# Enable monitors.
		function monon() {
			on() {
				for mon in ''${_swaymonlist[@]}; do
					swaymsg "output \"''${mon}\" power on"
				done
				_monstate on
			}
			_sway_iterate_sockets on
		}

		# Disable monitors.
		function monoff() {
			off() {
				for mon in ''${_swaymonlist[@]}; do
					swaymsg "output \"''${mon}\" power off"
				done
				_monstate off
			}
			_sway_iterate_sockets off
		}

		# Toggle monitors.
		function montoggle() {
			if [[ "$(_monstate)" = "on" ]]; then
				monoff
			else
				monon
			fi
		}

		function monbar() {
			local __monstate=$(_monstate)
			local __vrrstate=$(_vrrstate)
			local class=""

			if [[ "''${__monstate}" = "off" ]] || [[ "''${__vrrstate}" = "on" ]]; then
				class="modified"
			fi

			printf "{\"text\": \"󰍹\", \"tooltip\": \"Mon: ''${__monstate^} / Vrr: ''${__vrrstate^}\", \"class\": \"''${class}\"}\n"
		}

		function _monstate() {
			if [[ "''${1}" = "" ]]; then
				cat /tmp/.monstate 2> /dev/null || echo on
			else
				echo "''${*}" > /tmp/.monstate
			fi
		}
	'';
}
