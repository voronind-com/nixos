{ setting, ... }: let
	step = setting.volume.step;
in {
	text = ''
		bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +${step}%'
		bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -${step}%'
		bindsym XF86AudioMute        exec 'pactl set-sink-mute   @DEFAULT_SINK@ toggle'

		bindsym XF86AudioPlay  exec 'playerctl play-pause'
		bindsym XF86AudioPause exec 'playerctl pause'
		bindsym XF86AudioStop  exec 'playerctl stop'
		bindsym XF86AudioNext  exec 'playerctl next'
		bindsym XF86AudioPrev  exec 'playerctl previous'
	'';
}
