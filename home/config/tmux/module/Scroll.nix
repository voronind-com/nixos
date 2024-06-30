{ ... }: let
	mod = "M";
in {
	text = ''
		bind -n ${mod}-p copy-mode -u
		bind -n ${mod}-n send-keys Pagedown
	'';
}
