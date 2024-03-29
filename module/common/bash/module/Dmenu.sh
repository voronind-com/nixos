# Wrapped dmenu_path to include my functions.
function _dmenu_path_wrapped() {
	dmenu_path
	find_function | grep -v ^_
}
