{ setting, ... }: {
	text = ''
		// -*- mode: jsonc -*-
		{
			"layer": "top", // Waybar at top layer
			"position": "top", // Waybar position (top|bottom|left|right)
			"height": 30, // Waybar height (to be removed for auto height)
			"spacing": 4, // Gaps between modules (4px)
			// "mode": "dock",
			"exclusive": false,
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
				"cpu",
				"temperature",
				"memory",
				"tray"
			],
			"sway/scratchpad": {
				"format": "{icon}  {count}",
				"show-empty": false,
				"format-icons": ["", ""],
				"tooltip": true,
				"tooltip-format": "{app}: {title}"
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
				"format-icons": ["󰂎", "󱊡", "󱊢", "󱊣", "󱊣"]
			},
			"pulseaudio": {
				"scroll-step": ${toString(setting.volume.step)},
				"format": "{volume}% {icon}",
				"format-muted": "󰸈",
				"format-icons": {
					"default": ["", "", ""]
				},
				"on-click": "pavucontrol"
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
				// "ignored-players": ["firefox"]
			},
			"cpu": {
				"format": "{usage}% {load}",
				"tooltip": false
			},
			"memory": {
				"format": "{percentage}%"
			},
			"temperature": {
				"hwmon-path": "/sys/class/hwmon/hwmon1/temp1_input",
				"format": "{temperatureC}°C",
			}
		}
	'';
}
