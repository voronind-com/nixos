# Find all file extensions.
function find_ext() {
	local types=($(find -type f | sed -e "s/.*\///" -e "s/^\.//" -e "/\./!d" -e "s/.*\.//"))
	echo "${types[@]}" | tr ' ' '\n' | sort -u
}

# Find all modules.
function find_module() {
	/usr/bin/env ls "${BASH_PATH}/module" | /usr/bin/env sed -e "s/.sh$//"
}

# Find all module functions.
# Functions from all modules by default.
# Usage: find_function [MODULE]
function find_function() {
	local module="${1}"
	[[ "${module}" = "" ]] && module="*"
	/usr/bin/env cat "${BASH_PATH}/module"/${module}.sh | /usr/bin/env grep "^function.*()" | /usr/bin/env sed -e "s/^function //" -e "s/().*//"
}

# Autocomplete with module.
_find_module() {
	_autocomplete_first $(find_module)
}

complete -F _find_module find_function
