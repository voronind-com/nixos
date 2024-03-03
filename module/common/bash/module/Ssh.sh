# Mount FS over ssh. Just extra config for sshfs.
# Usage: sshmount <REMOTE> <LOCAL>
function sshmount() {
	sshfs -o uid=${UID},auto_unmount "${@}"
}

complete -o nospace -F _sshfs sshmount
