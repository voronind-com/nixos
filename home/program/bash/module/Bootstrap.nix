{ ... }: {
	text = ''
		# Install nixos to specified drive. To be run from Live ISO.
		# Usage: bootstrap_nixos <DRIVE> [HOST]
		function bootstrap_nixos() {
			local target="''${1}"
			local host="''${2}"

			if [[ "''${target}" = "" ]]; then
				help bootstrap_nixos
				return 2
			fi

			# Create partitions.
			parted -s "''${target}" mktable gpt
			parted -s "''${target}" mkpart primary 0% 512MB
			parted -s "''${target}" mkpart primary 512MB 100%
			parted -s "''${target}" name 1 NIXBOOT
			parted -s "''${target}" name 2 NIXROOT
			parted -s "''${target}" set 1 esp on

			# Format.
			mkfs.fat -F 32 /dev/disk/by-partlabel/NIXBOOT
			mkfs.ext4 -F /dev/disk/by-partlabel/NIXROOT

			# Mount.
			mount /dev/disk/by-partlabel/NIXROOT /mnt
			mkdir /mnt/boot
			mount /dev/disk/by-partlabel/NIXBOOT /mnt/boot

			# Generate config.
			nixos-generate-config --root /mnt

			# Install.
			cd /mnt
			if [[ "''${host}" = "" ]]; then
				_warn "Warning: Installing basic system."
				nixos-install
			else
				_info "Installing ''${host}..."
				nixos-install --no-root-password --no-channel-copy --flake "''${_nix_system_config}#''${host}"
			fi
		}
	'';
}