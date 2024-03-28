# Open file/dir in GUI.
# Usage: open <FILE>
function open() {
	xdg-open "${@}"
}
alias o="open"

# Play media file from CLI. All files by default.
# Usage: play [FILE]
function play() {
	local targets=${*}
	[[ "${targets}" = "" ]] && targets=$(_ls_file)

	mpv --no-video ${targets}
}

# Play media files shuffled from CLI. All files by default.
# Usage: play_shuffle [FILE]
function play_shuffle() {
	local targets=${*}
	[[ "${targets}" = "" ]] && targets=$(_ls_file)

	mpv --no-video --shuffle ${targets}
}
