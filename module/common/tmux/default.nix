{ util, config, ... } @args: {
	config = util.catText (util.ls ./module) args;
}
