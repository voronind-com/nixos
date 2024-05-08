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
			if [[ "$(_monstate)" = "off" ]]; then
				monon
			else
				monoff
			fi
		}

		function _monstate() {
			if [[ "''${1}" = "" ]]; then
				cat /tmp/.monstate 2> /dev/null
			else
				echo "''${*}" > /tmp/.monstate
			fi
		}
	'';
}
