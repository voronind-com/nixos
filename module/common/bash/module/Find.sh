# Find all file extensions.
function find_ext() {
	local types=($(find -type f | sed -e "s/.*\///" -e "s/^\.//" -e "/\./!d" -e "s/.*\.//"))
	echo "${types[@]}" | tr ' ' '\n' | sort -u
}

# Find all modules.
function find_module() {
	ls "${BASH_MODULE_PATH}" | sed -e "s/.sh$//"
}

# Find all module functions.
# Functions from all modules by default.
# Usage: find_function [MODULE]
function find_function() {
	local module="${1}"
	[[ "${module}" = "" ]] && module="*"
	cat "${BASH_MODULE_PATH}"/${module}.sh | grep "^function.*()" | sed -e "s/^function //" -e "s/().*//"
}

# Autocomplete with module.
_find_module() {
	_autocomplete_first $(find_module)
}

complete -F _find_module find_function
