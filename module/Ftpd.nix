{ ... }: {
	services.vsftpd = {
		enable                  = true;
		anonymousUser           = true;
		anonymousUserNoPassword = true;
		anonymousUploadEnable   = true;
		anonymousMkdirEnable    = true;
		anonymousUmask          = "000";
		anonymousUserHome       = "/storage/hot/ftp";
		allowWriteableChroot    = true;
		writeEnable             = true;
		localUsers              = false;
		extraConfig = ''
			anon_other_write_enable=YES
		'';
	};
}
