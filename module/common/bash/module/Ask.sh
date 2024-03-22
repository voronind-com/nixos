export _ask_model="mistral"

# Ask general AI.
# Usage: ask <QUERY>
function ask() {
	curl http://localhost:11434/api/generate -d "{
		\"model\": \"${_ask_model}\",
		\"prompt\":\"${*}\"
	}" 2> /dev/null | parallel -j1 -- "echo {} | jq -r .response | tr -d '\n'"
	echo
}

# Specify ask model.
function ask_model() {
	export _ask_model="${1}"
}

function _complete_ask_model() {
	local IFS=$'\n'
	local models=($(ollama list | sed -e "1d" | cut -f1))
	_autocomplete_first ${models[@]}
}

complete -F _complete_ask_model ask_model
