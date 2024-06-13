# Guide: https://nixos-mailserver.readthedocs.io/en/latest/setup-guide.html
{ container, domain, pkgs, util, const, ... } @args: let cfg = container.config.mail;
in {
	systemd.tmpfiles.rules = container.mkContainerDir cfg [
		"data"
		# "data/indices"
		# "data/vmail"
		# "data/sieve"
		# "data/dkim"
	];

	containers.mail = container.mkContainer cfg {
		forwardPorts = [
			{
				containerPort = 993;
				hostPort      = 993;
				protocol      = "tcp";
			} {
				containerPort = 25;
				hostPort      = 25;
				protocol      = "tcp";
			} {
				containerPort = 465;
				hostPort      = 465;
				protocol      = "tcp";
			}
		];

		bindMounts = {
			"/var/lib/dovecot/indices" = {
				hostPath   = "${cfg.storage}/data/indices";
				isReadOnly = false;
			};
			"/var/vmail" = {
				hostPath   = "${cfg.storage}/data/vmail";
				isReadOnly = false;
			};
			"/var/sieve" = {
				hostPath   = "${cfg.storage}/data/sieve";
				isReadOnly = false;
			};
			"/var/dkim" = {
				hostPath   = "${cfg.storage}/data/dkim";
				isReadOnly = false;
			};
			"/acme" = {
				hostPath   = "${container.config.proxy.storage}/letsencrypt";
				isReadOnly = false;
			};
		};

		config = { config, ... }: container.mkContainerConfig cfg {
			imports = [
				(builtins.fetchTarball {
					url    = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-${const.stateVersion}/nixos-mailserver-nixos-${const.stateVersion}.tar.gz";
					sha256 = "sha256:0clvw4622mqzk1aqw1qn6shl9pai097q62mq1ibzscnjayhp278b";
				})
			];

			mailserver = {
				enable = true;
				fqdn = cfg.domain;
				domains = [ domain ];
				sendingFqdn = domain;

				# Use `mkpasswd -sm bcrypt`.
				loginAccounts = let
					defaultQuota = "1G";
				in {
					"admin@${domain}" = {
						name = "admin";
						hashedPassword = "$2b$05$1O.dxXxaVshcBNybcqDRYuTlnYt3jDBwfPZWoDtP4BjOLoL0StYsi";
						quota = defaultQuota;
					};
					"account@${domain}" = {
						name = "account";
						hashedPassword = "$2b$05$sCyZHdk98KqQ1qsTIvbrUeRJlNBOwBqDgpdc1QxiSnONlEkZ8xGNO";
						quota = defaultQuota;
					};
					"hi@${domain}" = {
						name = "hi";
						hashedPassword = "$2b$05$6fT5hIhzIasNfp9IQr/ds.5RuxH95VKU3QJWlX3hmrAzDF3mExanq";
						quota = defaultQuota;
						aliases = [ "voronind@${domain}" ];
					};
					"job@${domain}" = {
						name = "job";
						hashedPassword = "$2b$05$.sUmv2.9EWPfLwJn/oZw2e1UbR7HrpNQ2THc5jjX3ysy7CY8ZWHUC";
						quota = defaultQuota;
					};
					"trash@${domain}" = {
						name = "trash";
						hashedPassword = "$2b$05$kn5ygZjN9NR3LXjnKKRw/.DXaZQNW.1XEottlCFIoKiDpIj.JGLJm";
						catchAll = [ domain ];
						quota = defaultQuota;
					};
					"noreply@${domain}" = {
						name = "noreply";
						hashedPassword = "$2b$05$TaKwoYmcmkAhsRRv6xG5wOkChcz50cB9BP6QPUDKNAcxMbrY6AeMK";
						sendOnly = true;
						quota = defaultQuota;
					};
				};

				enableImap          = true;
				enableImapSsl       = true;
				enableSubmission    = true;
				enableSubmissionSsl = true;

				virusScanning = false;

				certificateScheme = "manual";
				keyFile           = "/acme/live/${domain}/privkey.pem";
				certificateFile   = "/acme/live/${domain}/cert.pem";

				indexDir         = "/var/lib/dovecot/indices";
				mailDirectory    = "/var/vmail";
				sieveDirectory   = "/var/sieve";
				dkimKeyDirectory = "/var/dkim";

				mailboxes = {
					Drafts = {
						auto       = "subscribe";
						specialUse = "Drafts";
					};
					Junk = {
						auto       = "subscribe";
						specialUse = "Junk";
					};
					Sent = {
						auto       = "subscribe";
						specialUse = "Sent";
					};
					Trash = {
						auto       = "no";
						specialUse = "Trash";
					};
				};

				dmarcReporting = {
					inherit domain;
					enable = true;
					organizationName = "voronind";
					# email = "noreply@${domain}";
				};

				# monitoring = {
				# 	enable = true;
				# 	alertAddress = "admin@${domain}";
				# };
			};

			services.roundcube = {
				enable = true;
				dicts = with pkgs.aspellDicts; [ en ru ];
				hostName = cfg.domain;
				extraConfig = ''
					# starttls needed for authentication, so the fqdn required to match
					# the certificate
					# $config['smtp_server'] = "tls://${config.mailserver.fqdn}";
					# $config['smtp_server'] = "tls://localhost";
					$config['smtp_server'] = "localhost:25";
					$config['smtp_auth_type'] = null;
					$config['smtp_user'] = "";
					$config['smtp_pass'] = "";
					# $config['smtp_user'] = "%u";
					# $config['smtp_pass'] = "%p";
			 '';
			};

			services.nginx = {
				virtualHosts.${cfg.domain} = {
					forceSSL   = false;
					enableACME = false;
				};
			};
		};
	};
}
