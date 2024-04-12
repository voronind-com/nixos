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

		# Copy and also merge all changes FAST (delete dst files that do not exist in src, only compare size).
		# Usage: rcp_merge_fast <FROM> <TO>
		function rcp_merge_fast() {
			rsync -ahP --chmod=u+w --delete --size-only "''${@}"
		}

		# Copy and also merge all changes BY CHECKSUM (delete dst files that do not exist in src, compare hashes).
		# Usage: rcp_merge_hash <FROM> <TO>
		function rcp_merge_hash() {
			rsync -ahP --chmod=u+w --delete --checksum "''${@}"
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
