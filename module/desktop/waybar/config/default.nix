{ setting, style, ... }: {
	text = ''
		// -*- mode: jsonc -*-
		{
			"layer": "top",
			"position": "top",
			"height": 30,
			"spacing": 4,
			"margin-top": ${toString(style.window.gap)},
			"margin-left": ${toString(style.window.gap)},
			"margin-right": ${toString(style.window.gap)},
			"mode": "dock",
			// "exclusive": false,
			"start_hidden": true,
			"modules-left": [
				"sway/workspaces",
				"sway/scratchpad",
			],
			"modules-center": [
				"clock",
				"mpris"
			],
			"modules-right": [
				"sway/language",
				"pulseaudio",
				"battery",
				"custom/powerlimit",
				"cpu",
				"temperature",
				"memory",
				"custom/powersave",
				"tray"
			],
			"sway/scratchpad": {
				"format": "{icon}  {count}",
				"show-empty": false,
				"format-icons": ["", ""],
				"tooltip": true,
				"tooltip-format": "{app}: {title}",
				"on-click": "swaymsg 'scratchpad show'",
				"on-click-right": "sway_scratchpad_kill"
			},
			"tray": {
				// "icon-size": 21,
				"spacing": 10
			},
			"clock": {
				// "timezone": "America/New_York",
				"tooltip-format": "<big><tt>{calendar}</tt></big>",
				"format-alt": "{:%d %a %H:%M}"
			},
			"battery": {
				"states": {
					"good": 60,
					"warning": 40,
					"critical": 20
				},
				"format": "{capacity}% {icon}",
				"format-charging": "{capacity}% ",
				"format-plugged": "{capacity}% ",
				"format-alt": "{time} {icon}",
				"format-icons": ["󰂎", "󱊡", "󱊢", "󱊣", "󱊣"],
				"on-click-right": "powerlimit toggle"
			},
			"custom/powerlimit": {
				"exec": "powerlimit waybar",
				"interval": 1,
				"on-click-right": "powerlimit toggle"
			},
			"pulseaudio": {
				"scroll-step": ${toString(setting.volume.step)},
				"format": "{volume}% {icon}",
				"format-muted": "󰸈",
				"format-icons": {
					"default": ["", "", ""]
				},
				"on-click": "sound_output_cycle",
				"on-click-right": "pavucontrol"
			},
			"mpris": {
				"format": "{player_icon}  {artist} - {title}",
				"format-paused": "{status_icon}  {artist} - {title}",
				"player-icons": {
					"default": "",
					"firefox": "󰈹",
					"mpv": ""
				},
				"status-icons": {
					"paused": ""
				},
				"on-click-middle": "playerctl stop"
				// "ignored-players": ["firefox"]
			},
			"cpu": {
				"format": "{usage}% ({load})",
				"tooltip": false,
				"on-click": "foot -e bash -c btop",
				"on-click-right": "powersave toggle"
			},
			"memory": {
				"format": "{percentage}%",
				"on-click": "foot -e bash -c btop",
				"on-click-right": "powersave toggle"
			},
			"temperature": {
				"hwmon-path": "/sys/class/hwmon/hwmon1/temp1_input",
				"format": "{temperatureC}°C",
				"on-click": "foot -e bash -c btop",
				"on-click-right": "powersave toggle",
				"interval": 1
			},
			"custom/powersave": {
				"exec": "powersave waybar",
				"interval": 1,
				"on-click": "foot -e bash -c btop",
				"on-click-right": "powersave toggle"
			}
		}
	'';
}
