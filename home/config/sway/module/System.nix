{ config, ... }: let
	mod = config.setting.sysctrl;
in {
	text = ''
		bindsym ${mod}+c exec 'systemctl reboot -i'
		bindsym ${mod}+g exec 'swayscript gamingtoggle'
		bindsym ${mod}+l exec 'powerlimit toggle'
		bindsym ${mod}+m exec 'swayscript montoggle'
		bindsym ${mod}+p exec 'powersave toggle'
		bindsym ${mod}+v exec 'swayscript vpntoggle'
		bindsym ${mod}+x exec 'systemctl poweroff -i'
		bindsym ${mod}+z exec 'systemctl suspend -i'
	'';
}
