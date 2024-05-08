{ util, setting, ... } @args: {
	config = util.catText (util.ls ./module) args;
}
