# Su shortcut for lazy me.
# Root by default.
# Usage: s [USER]
function s() {
	su - ${1}
}

# Run something as root.
# Usage: sudo <COMMAND>
function sudo() {
	su -c "$(echo ${*} | tr '\n' ' ')"
}

function _complete_s() {
	_autocomplete "voronind" "dasha"
}

complete -F _complete_s s
complete -F _autocomplete_nested sudo
