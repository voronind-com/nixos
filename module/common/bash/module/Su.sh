# Su shortcut for lazy me.
# Root by default.
# Usage: s [USER]
function s() {
	su - "${@}"
}

function _complete_s() {
	_autocomplete "voronind" "dasha"
}
complete -F _complete_s s
