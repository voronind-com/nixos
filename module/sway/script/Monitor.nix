{ ... }: {
	text = ''
		# Enable monitors.
		function monon() {
			on() {
				_monstate on
				swaymsg 'output "ASUSTek COMPUTER INC ASUS VA24E R2LMTF127165" power on'
			}
			_sway_iterate_sockets on
		}

		# Disable monitors.
		function monoff() {
			off() {
				_monstate off
				swaymsg 'output "ASUSTek COMPUTER INC ASUS VA24E R2LMTF127165" power off'
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
			printf "{\"text\": \"󰍹\", \"tooltip\": \"Mon: $(_monstate) / Vrr: $(_vrrstate)\"}\n"
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
