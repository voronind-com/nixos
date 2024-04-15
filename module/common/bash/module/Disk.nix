{ ... }: {
	text = ''
		# Show only physical drives info.
		function pdf() {
			df --si | sed -e '1p' -e '/^\/dev\//!d'
		}

		# Show total size in SI.
		# Current dir by default.
		# Usage: tdu [DIRS]
		function tdu() {
			du -sh --si "''${@}"
		}

		# Unlock encrypted disk file.
		# Usage: unlock <FILE>
		function unlock() {
			_filter() {
				sed -e "s/.*\ a[st]\ //" -e "s/\.$//"
			}
			local file="''${1}"
			local name=$(parse_alnum ''${file} | _filter)
			local loop=$(udisksctl loop-setup -f "''${file}" | _filter)
			local unlock=$(udisksctl unlock -b "''${loop}" | _filter)
			local mount=$(udisksctl mount -b "''${unlock}" | _filter)

			cd "''${mount}"
		}
	'';
}
