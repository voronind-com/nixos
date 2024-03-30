# Open bluetooth control panel.
function bluetooth() {
	blueman-manager
}

# Open network control panel.
function network() {
	nm-connection-editor
}

# Show active connections.
function ns() {
	nmcli connection show
}

# Start the connection.
# Usage: nu <CONNECTION>
function nu() {
	nmcli connection up "${@}"
}

# Stop the connection.
# Usage: nd <CONNECTION>
function nd() {
	nmcli connection down "${@}"
}

function _complete_connections() {
	_autocomplete $(nmcli connection show | sed "1d" | cut -d\  -f1)
}

complete -F _complete_connections nd nu
