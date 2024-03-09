# Mount FS over ssh. Just extra config for sshfs.
# Usage: ssh_mount <REMOTE> <LOCAL>
function ssh_mount() {
	sshfs -o uid=${UID},auto_unmount "${@}"
}

# Generate private an public keys on a local host and print a public key.
function ssh_keygen() {
	ssh-keygen && cat ~/.ssh/*.pub
}

complete -o nospace -F _sshfs sshmount
