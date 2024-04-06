{ key, util, ... }: {
	text = util.trimTabs ''
		{
			"detachKeys": "ctrl-${key.action.wait}"
		}
	'';
}
