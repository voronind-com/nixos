{ ... }: {
	text = ''
		# Enable monitors.
		function monon() {
			swaymsg 'output "ASUSTek COMPUTER INC ASUS VA24E R2LMTF127165" power on'
		}

		# Disable monitors.
		function monoff() {
			swaymsg 'output "ASUSTek COMPUTER INC ASUS VA24E R2LMTF127165" power off'
		}
	'';
}
