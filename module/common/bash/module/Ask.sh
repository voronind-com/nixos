# Ask general AI.
# Usage: ask <QUERY>
function ask() {
	curl http://localhost:11434/api/generate -d "{
		\"model\": \"mistral\",
		\"prompt\":\"${*}\"
	}" 2> /dev/null | parallel -j1 -- "echo {} | jq -r .response | tr -d '\n'"
	echo
}
