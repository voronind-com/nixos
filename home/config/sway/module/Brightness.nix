{ config, ... }: let
	step = config.setting.step.brightness;
in {
	text = ''
		bindsym XF86MonBrightnessDown exec light -U ${toString step}
		bindsym XF86MonBrightnessUp   exec light -A ${toString step}
	'';
}
