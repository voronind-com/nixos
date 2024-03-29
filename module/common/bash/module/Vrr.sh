# Enable VRR.
function vrron() {
	swaymsg 'output "Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622" adaptive_sync on'
}

# Disable VRR.
function vrroff() {
	swaymsg 'output "Huawei Technologies Co., Inc. ZQE-CBA 0xC080F622" adaptive_sync off'
}
