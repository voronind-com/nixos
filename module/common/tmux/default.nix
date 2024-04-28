{ style, key, util, setting, ... }: let
	mod = key.tmux.mod;

	accent = style.color.accent;
	bg     = style.color.bg.dark;
	fg     = style.color.fg.light;
in {
	config = util.trimTabs ''
		# Remap <C-b> to <C-t>.
		unbind-key C-b
		set-option -g prefix C-t
		bind-key C-${key.tmux.prefix} send-prefix

		# Disable escape delay.
		set -sg escape-time 0

		# Reload config.
		bind -n ${mod}-${key.tmux.reload} source-file /etc/tmux.conf

		# Scroll.
		bind -n ${mod}-${key.tmux.scroll.up} copy-mode -u
		bind -n ${mod}-${key.tmux.scroll.down} send-keys Pagedown

		# Copy mode.
		setw -g mode-keys vi
		bind -n ${mod}-${key.tmux.copy.select} copy-mode
		bind -n ${mod}-${key.tmux.copy.paste} choose-buffer;
		bind -T copy-mode-vi ${key.tmux.copy.select} send      -X begin-selection
		bind -T copy-mode-vi ${key.tmux.copy.copy} send-keys -X copy-pipe-and-cancel "pbcopy"

		# Remap split keys.
		bind -n ${mod}-${key.action.split.vertical} split-window -h -c "#{pane_current_path}"
		bind -n ${mod}-${key.action.split.horizontal}  split-window -v -c "#{pane_current_path}"
		bind -n ${mod}-${key.action.resize.equalize} select-layout tiled
		bind -n ${mod}-${key.action.resize.up} resize-pane -U ${toString(setting.tmux.resize.step.vertical)}
		bind -n ${mod}-${key.action.resize.down} resize-pane -D ${toString(setting.tmux.resize.step.vertical)}
		bind -n ${mod}-${key.action.resize.left} resize-pane -L ${toString(setting.tmux.resize.step.horizontal)}
		bind -n ${mod}-${key.action.resize.right} resize-pane -R ${toString(setting.tmux.resize.step.horizontal)}
		bind -n ${mod}-${key.navigation.move.left} swap-pane -U
		bind -n ${mod}-${key.navigation.move.right} swap-pane -D
		unbind '"'
		unbind %

		# Swith panes.
		bind -n ${mod}-${key.navigation.go.left} select-pane -L
		bind -n ${mod}-${key.navigation.go.right} select-pane -R
		bind -n ${mod}-${key.navigation.go.up} select-pane -U
		bind -n ${mod}-${key.navigation.go.down} select-pane -D

		# Close pane.
		bind -n ${mod}-${key.action.hide} kill-pane
		bind -n ${mod}-${key.action.seek} kill-pane -a

		# Detach.
		bind -n ${mod}-${key.action.wait} detach-client
		bind -n ${mod}-${key.action.exit} detach-client -a

		# Switch sessions.
		bind -n ${mod}-${key.tmux.session.prev} switch-client -p
		bind -n ${mod}-${key.tmux.session.next} switch-client -n
		bind -n ${mod}-${key.tmux.session.choose} choose-session

		# Resize to smallest client.
		set -g window-size smallest

		# Selection style.
		set -g mode-style "fg=#${bg} bg=#${accent} bold"

		# Pane style.
		set -g pane-border-style "fg=#${bg}"
		set -g pane-active-border-style "fg=#${accent}"

		# Statusbar.
		bind-key -n ${mod}-${key.tmux.status.toggle} set-option -g status;
		bind-key -n ${mod}-${key.tmux.status.uber} run-shell 'tmux_script togglestatusbar'
		set -g status-interval ${toString(setting.tmux.status.interval)}
		set -g status-position bottom
		set -g status-justify  left
		set -g status-style "fg=#${fg}"

		set -g status-left "#[bold] #H-#S #(tmux_script client_count #S)"
		set -g status-left-length  ${toString(setting.tmux.status.length)}
		set -g status-right-length ${toString(setting.tmux.status.length)}
		set -g status-right "#(tmux_script statusbar) %d %a #[bold] %H:%M "

		set-window-option -g window-status-separator ""

		setw -g window-status-current-style  "fg=#${accent} bold"
		setw -g window-status-current-format " #W "

		setw -g window-status-style  ""
		setw -g window-status-format " #W "

		set-window-option -g visual-bell off
		setw -g window-status-bell-style "bold blink"

		# Create new window.
		bind -n ${mod}-${key.tmux.window.new} new-window -c "#{pane_current_path}"
		bind -n ${mod}-${key.tmux.window.new_compat} new-window -c "#{pane_current_path}"

		# Close window.
		bind -n ${mod}-${key.action.close} kill-window
		bind -n ${mod}-${key.action.kill} kill-window -a

		# Switch window.
		bind -n ${mod}-${key.navigation.go.next} next-window
		bind -n ${mod}-${key.navigation.go.prev} previous-window

		# Move window.
		bind -n ${mod}-${key.navigation.move.next} swap-window -t +1\; select-window -t +1
		bind -n ${mod}-${key.navigation.move.prev} swap-window -t -1\; select-window -t -1

		# Env.
		set-option -g default-terminal "tmux-256color"
		set-option -g focus-events on
		set-option -sa terminal-features "RGB"
		set-option -g update-environment "SSH_CLIENT SSH_TTY DOCKER_CONFIG DOCKER_HOST DISPLAY XAUTHORITY BASH_PATH SWAY_SOCK"
	'';

	script = ''
		#!/usr/bin/env bash

		function _tmux_battery() {
			local IFS=$'\n'

			local batteries=($(ls /sys/class/power_supply/ | grep ^BAT[0-9]$))
			[[ "''${batteries}" = "" ]] && return 1

			local battery="/sys/class/power_supply/''${batteries[0]}"
			local level=$(cat ''${battery}/capacity)
			local status=$(cat ''${battery}/status)
			local is_charging=false
			[[ "''${status}" = "Charging" ]] && is_charging=true

			local icon
			if ((level>=${toString(setting.tmux.status.battery.threshold.high)}))
			then
				icon="󱊣"
			elif ((level>=${toString(setting.tmux.status.battery.threshold.medium)}))
			then
				icon="󱊢"
			elif ((level>=${toString(setting.tmux.status.battery.threshold.low)}))
			then
				icon="󱊡"
			else
				icon="󰂎"
			fi

			echo -n "''${icon}"
			''${is_charging} && echo -n "󱐋"
			echo
			echo -n "''${level}"
		}

		function _tmux_volume() {
			local IFS=$'\n'
			local level=$(wpctl get-volume @DEFAULT_SINK@ | cut -d\  -f2 | sed -e "s/^0//" -e "s/\.//")
			[[ "''${level}" = "" ]] && return 1
			[[ "''${level}" = "00" ]] && level="0"

			local icon
			if ((level>=${toString(setting.tmux.status.volume.threshold.high)}))
			then
				icon="󰕾"
			elif ((level>=${toString(setting.tmux.status.volume.threshold.medium)}))
			then
				icon="󰖀"
			elif ((level>=${toString(setting.tmux.status.volume.threshold.low)}))
			then
				icon=""
			else
				icon="󰝟"
			fi

			local muted=$(wpctl get-volume @DEFAULT_SINK@ | grep '[MUTED]')
			if [[ "''${muted}" != "" ]]; then
				icon="󰸈"
			fi

			echo "''${icon}"
			echo -n "''${level}"
		}

		function _tmux_statusbar() {
			local IFS=$'\n'
			local sep=""
			local thr_volume=${toString(setting.tmux.status.volume.threshold.show)}
			local thr_battery=${toString(setting.tmux.status.battery.threshold.show)}
			local is_uber=$(cat "/tmp/.tmux_uber" || echo -n false)

			# Get data.
			battery=($(_tmux_battery))
			volume=($(_tmux_volume))

			# Prepare separators.
			sep_batvol=" "

			if ''${is_uber} || [[ "''${battery[1]}" -lt "''${thr_battery}" ]] || [[ "''${volume[1]}" -gt "''${thr_volume}" ]]; then
				sep_batvol=" ''${sep} "
			fi
			if [[ "''${battery[0]}" = "" ]]; then
				sep_batvol=""
			fi

			# Print.
			echo -n " "

			# Assemble.
			if ''${is_uber}; then
				local lang=($(_tmux_language))
				[[ "''${lang[0]}" != "" ]] && {
					echo -n "''${lang[0]} ''${sep} "
				};

				[[ "''${volume[0]}"  != "" ]] && echo -n "''${volume[0]} ''${volume[1]}%''${sep_batvol}"
				[[ "''${battery[0]}" != "" ]] && echo -n "''${battery[0]} ''${battery[1]}%"
			else
				[[ "''${volume[0]}"  != "" ]] && {
					echo -n "''${volume[0]}"
					[[ "''${volume[1]}" -gt 100 ]] && echo -n " ''${volume[1]}%"
					echo -n "''${sep_batvol}"
				};
				[[ "''${battery[0]}" != "" ]] && {
					echo -n "''${battery[0]}"
					[[ "''${battery[1]}" -lt 40 ]] && echo -n " ''${battery[1]}%"
				};
			fi

			echo -n " "
		}

		function _tmux_language() {
			local IFS=$'\n'
			local lang=$(swaymsg -t get_inputs | jq 'map(select(has("xkb_active_layout_name")))[0].xkb_active_layout_name')

			echo -n ''${lang:1:2}
		}

		function _tmux_client_count() {
			local IFS=$'\n'
			local session=''${1}
			local count=$(tmux list-clients -t ''${session} | wc -l)

			[ ''${count} -gt 1 ] && echo -n "+''${count} "
		}

		function _tmux_toggle_statusbar() {
			local file="/tmp/.tmux_uber"
			if [[ ! -f ''${file} ]]; then
				echo "true" > ''${file}
			elif $(cat ''${file}); then
				echo "false" > ''${file}
			else
				echo "true" > ''${file}
			fi
		}

		IFS=$'\n'
		action=''${1}
		session=''${2}

		case "''${action}" in
			"statusbar")       _tmux_statusbar ;;
			"client_count")    _tmux_client_count ''${session} ;;
			"togglestatusbar") _tmux_toggle_statusbar ;;
		esac
	'';
}
