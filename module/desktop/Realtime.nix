# Improve DE performance.
{ ... }: {
	security.pam.loginLimits = [
		{ domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
	];
}
