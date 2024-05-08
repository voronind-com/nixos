{ key, ... }: let
	mod = key.sysctrl;
in {
	text = ''
		bindsym ${mod}+c exec 'swaymsg exit'
		bindsym ${mod}+f exec 'swayscript montoggle'
		bindsym ${mod}+l exec 'powerlimit toggle'
		bindsym ${mod}+m exec 'swayscript montoggle'
		bindsym ${mod}+p exec 'powersave toggle'
		bindsym ${mod}+v exec 'swayscript vrrtoggle'
		bindsym ${mod}+x exec 'systemctl poweroff -i'
		bindsym ${mod}+z exec 'systemctl suspend -i'
	'';
}
