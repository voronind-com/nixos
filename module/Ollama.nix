# https://github.com/ollama/ollama
{ pkgsStable, lib, setting, ... }: let
	pkgs = pkgsStable;
in {
	environment = {
		# Add Ollama CLI app.
		systemPackages = with pkgs; [ ollama ];

		# Specify default model.
		variables.OLLAMA_MODEL = setting.ollama.primaryModel;
	};

	# Enable Ollama server.
	systemd.services.ollama = {
		description = "Ollama LLM server.";
		wantedBy    = [ "multi-user.target" ];
		wants       = [ "NetworkManager-wait-online.service" ];
		after       = [ "NetworkManager-wait-online.service" ];
		serviceConfig.Type = "simple";
		script = ''
			HOME=/root ${lib.getExe pkgs.ollama} serve
		'';
	};

	# Download Ollama models.
	systemd.services.ollamamodel = {
		description = "Ollama LLM model.";
		wantedBy    = [ "multi-user.target" ];
		wants       = [ "ollama.service" ];
		after       = [ "ollama.service" ];
		serviceConfig.Type = "simple";
		script = ''
			sleep 5
			${lib.getExe pkgs.ollama} pull ${setting.ollama.primaryModel}
		'';
	};
}
