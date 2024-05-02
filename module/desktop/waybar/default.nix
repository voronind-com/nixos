{ util, ... } @args: {
	config = (import ./config args).text;
	style  = util.catAllText ./style args;
}
