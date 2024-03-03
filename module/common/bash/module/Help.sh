# Get help about dotfiles bash function.
# Usage: help <FUNCTION>
function help() {
	local fun="${1}"

	if [[ "${fun}" = "" ]] || [[ "$(find_function | grep ${fun})" = "" ]]; then
		help help
		return 2
	fi

	sed -e '$s/$/\n/' -s "${BASH_MODULE_PATH}"/* | sed -n -e "/function ${fun}()/q;p" | tac | sed -n -e "/^$/q;p" | tac | sed -e "s/^# \+//" -e "\$i \ "
}

# Short for help.
# Usage: h <FUNCTION>
function h() {
	help "${@}"
}

# Autocomplete with available functions.
function _help_functions() {
	_autocomplete_first $(find_function)
}

complete -F _help_functions help h
