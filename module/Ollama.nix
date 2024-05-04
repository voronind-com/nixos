{ pkgs, lib, ... }: {
	# Add Ollama CLI app.
	environment.systemPackages = with pkgs; [ ollama ];

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
			${lib.getExe pkgs.ollama} pull mistral
		'';
	};
}
