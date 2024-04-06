{ key, setting, ... }: {
	text = ''
		bindsym $mod+${key.action.resize.down}  resize grow   height ${setting.sway.resize.step.vertical}
		bindsym $mod+${key.action.resize.up}    resize shrink height ${setting.sway.resize.step.vertical}
		bindsym $mod+${key.action.resize.left}  resize shrink width  ${setting.sway.resize.step.horizontal}
		bindsym $mod+${key.action.resize.right} resize grow   width  ${setting.sway.resize.step.horizontal}
	'';
}
