{ ... }: {
	text = ''
		# Example configuration:
		#
		#   output HDMI-A-1 resolution 1920x1080 position 1920,0
		#
		# You can get the names of your outputs by running: swaymsg -t get_outputs
		output * scale 1
		output "Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622" mode 3440x1440@59.973Hz adaptive_sync off pos 0,1080
		output "ASUSTek COMPUTER INC ASUS VA24E R2LMTF127165" transform 180 mode 1920x1080@60.000Hz pos 780,0
	'';
}
