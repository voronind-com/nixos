{ key, ... }: let
	prompt = key.nvim.text.prompt;
in {
	text = ''
		rekey_normal("<Leader>${prompt}", ":<c-u>lua require('ollama').prompt()<cr>")
		rekey_visual("<Leader>${prompt}", ":<c-u>lua require('ollama').prompt()<cr>")
	'';
}
