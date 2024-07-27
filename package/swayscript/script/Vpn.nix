{ ... }: {
	text = ''
		# Enable VPN.
		function vpnon() {
			nmcli connection up vpn
			_vpnstate on
		}

		# Disable vpn.
		function vpnoff() {
			nmcli connection down vpn
			_vpnstate off
		}

		# Toggle vpn.
		function vpntoggle() {
			if [[ "$(_vpnstate)" = "on" ]]; then
				vpnoff
			else
				vpnon
			fi
		}

		function _vpnstate() {
			local state=$(nmcli connection show vpn | rg -i state.*activated)
			[ "''${state}" != "" ] && printf on || printf off
		}
	'';
}
