{ util, ... } @args: {
	config = (import ./config args).text;
	style  = util.catText (util.ls ./style) args;
}
