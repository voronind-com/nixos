{ domain, util, container, pkgs, ... } @args: let
	cfg = container.config.proxy;
	virtualHosts = util.catSet (util.ls ./proxy/host) args;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"challenge"
		"letsencrypt"
	];

	containers.proxy = container.mkContainer cfg {
		forwardPorts = [
			# {
			# 	containerPort = 80;
			# 	hostPort      = 80;
			# 	protocol      = "tcp";
			# } {
			{
				containerPort = 443;
				hostPort      = 443;
				protocol      = "tcp";
			}
		];

		bindMounts = {
			"/etc/letsencrypt" = {
				hostPath   = "${cfg.storage}/letsencrypt";
				isReadOnly = true;
			};
			"/var/www/.well-known" = {
				hostPath   = "${cfg.storage}/challenge";
				isReadOnly = false;
			};
		};

		config = { ... }: container.mkContainerConfig cfg {
			environment.systemPackages = with pkgs; [ certbot ];

			services.nginx = {
				inherit virtualHosts;

				enable = true;
				recommendedOptimisation  = true;
				recommendedProxySettings = true;
				appendConfig = util.trimTabs ''
					worker_processes 4;
				'';
				eventsConfig = util.trimTabs ''
					worker_connections 4096;
				'';
				# TODO: Fix 80 redirect and 403 default.
				appendHttpConfig = util.trimTabs ''
					server {
						server_name default_server;
						listen 80;

						location / {
							return 301 https://$host$request_uri;
						}
					}

					map $http_accept_language $resume {
						default https://git.${domain}/voronind/resume/releases/download/latest/voronind_en.pdf;
						~ru     https://git.${domain}/voronind/resume/releases/download/latest/voronind_ru.pdf;
					}

					server {
						server_name ${domain};
						listen 443 ssl;

						ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
						ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
						include /etc/letsencrypt/conf/options-ssl-nginx.conf;
						ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;

						return 301 $resume;
					}

					server {
						listen 443 ssl default_server;
						server_name _;

						ssl_certificate /etc/letsencrypt/live/${domain}/fullchain.pem;
						ssl_certificate_key /etc/letsencrypt/live/${domain}/privkey.pem;
						include /etc/letsencrypt/conf/options-ssl-nginx.conf;
						ssl_dhparam /etc/letsencrypt/conf/ssl-dhparams.pem;

						return 403;
					}
				'';
			};
		};
	};
}