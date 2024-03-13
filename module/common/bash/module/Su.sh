# Su shortcut for lazy me.
# Root by default.
# Usage: s [USER]
function s() {
	su - ${1}
}

# Run something as root. Runs command as a current user if su is not available.
# Usage: sudo <COMMAND>
function sudo() {
	if command -v su &> /dev/null; then
		su -c "$(echo ${*} | tr '\n' ' ')"
	else
		${*}
	fi

}

function _complete_s() {
	_autocomplete "voronind" "dasha"
}

complete -F _complete_s s
complete -F _autocomplete_nested sudo
