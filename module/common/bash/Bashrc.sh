# If not running interactively, don't do anything.
[[ "$-" != *i* ]] && return

# Src system bashrc.
[[ -f /etc/bashrc ]] && source /etc/bashrc

# Src custom modules.
for module in ${BASH_PATH}/module/*.sh; do
	source "${module}"
done

# Alias to reload.
function bashrc() {
	source ${BASH_PATH}/Bashrc.sh
}

# Export all functions.
export -f $(find_function | tr '\n' ' ')
