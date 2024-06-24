{ config, ... }: let
	step_volume = config.setting.step.volume;
	step_music  = config.setting.step.media;
in {
	text = ''
		bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +${toString step_volume}%'
		bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -${toString step_volume}%'
		bindsym XF86AudioMute        exec 'pactl set-sink-mute   @DEFAULT_SINK@ toggle'

		bindsym XF86AudioPlay  exec 'playerctl play-pause'
		bindsym XF86AudioPause exec 'playerctl pause'
		bindsym XF86AudioStop  exec 'playerctl stop'
		bindsym XF86AudioNext  exec 'playerctl next'
		bindsym XF86AudioPrev  exec 'playerctl previous'
		bindsym XF86Forward    exec 'playerctl position ${toString step_music}+'
		bindsym XF86Back       exec 'playerctl position ${toString step_music}-'
		bindsym XF86Eject      exec 'swayscript sound_output_cycle'
	'';
}
