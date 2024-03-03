# Set specified file as a wallpaper.
# Usage: wallpaper <FILE>
function wallpaper() {
	local target="${1}"
	local path_wallpaper=~/.local/share/backgrounds/background.jpg

	if [[ "${target}" = "" ]]; then
		help wallpaper
		return 2
	fi

	cp "${target}" "${path_wallpaper}"
	chmod 644 "${path_wallpaper}"
}
