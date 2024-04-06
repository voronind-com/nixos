{ setting, ... }: let
	step = setting.volume.step;
in {
	text = ''
		bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +${step}%'
		bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -${step}%'
		bindsym XF86AudioMute        exec 'pactl set-sink-mute   @DEFAULT_SINK@ toggle'
	'';
}
