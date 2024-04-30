{ style, key, util, setting, ... } @args: {
	config = util.catAllText ./module args;
	script = (import ./Script.nix args).text;
}
