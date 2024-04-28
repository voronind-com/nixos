{ key, setting, ... }: {
	text = ''
		bindsym $mod+${key.action.resize.down}  resize grow   height ${toString(setting.sway.resize.step.vertical)}
		bindsym $mod+${key.action.resize.up}    resize shrink height ${toString(setting.sway.resize.step.vertical)}
		bindsym $mod+${key.action.resize.left}  resize shrink width  ${toString(setting.sway.resize.step.horizontal)}
		bindsym $mod+${key.action.resize.right} resize grow   width  ${toString(setting.sway.resize.step.horizontal)}
	'';
}
