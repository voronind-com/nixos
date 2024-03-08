# Get help about dotfiles bash function.
# Usage: help <FUNCTION>
function help() {
	local fun="${1}"

	if [[ "${fun}" = "" ]] || [[ "$(find_function | /usr/bin/env grep ${fun})" = "" ]]; then
		help help
		return 2
	fi

	/usr/bin/env sed -e '$s/$/\n/' -s "${BASH_PATH}/module"/* | /usr/bin/env sed -n -e "/function ${fun}()/q;p" | /usr/bin/env tac | /usr/bin/env sed -n -e "/^$/q;p" | /usr/bin/env tac | /usr/bin/env sed -e "s/^# \+//" -e "\$i \ "
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
