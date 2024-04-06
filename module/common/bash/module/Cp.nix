{ ... }: {
	text = ''
		# Replaces default cp with rsync.
		# Usage: rcp <FROM> <TO>
		function rcp() {
			rsync -ahP --chmod=u+w "''${@}"
		}

		# Copy and also merge all changes (delete dst files that do not exist in src).
		# Usage: rcp_merge <FROM> <TO>
		function rcp_merge() {
			rsync -ahP --chmod=u+w --delete "''${@}"
		}

		# Copy by creating hardlinks.
		# Works for directories, too.
		# Usage: cp_link <FROM> <TO>
		function cp_link() {
			/usr/bin/env cp -lr "''${@}"
		}

		# Print output of cp_merge without writing anything.
		# Usage: rcp_test <FROM> <TO>
		function rcp_test() {
			rsync -ahP --chmod=u+w --delete -n "''${@}"
		}
	'';
}
