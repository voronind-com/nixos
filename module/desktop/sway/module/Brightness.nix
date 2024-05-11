{ setting, ... }: let
	step = toString(setting.brightness.step);
in {
	text = ''
		bindsym XF86MonBrightnessDown exec light -U ${step}
		bindsym XF86MonBrightnessUp   exec light -A ${step}
	'';
}
