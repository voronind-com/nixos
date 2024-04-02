#!/usr/bin/env bash

function _tmux_battery() {
	local IFS=$'\n'

	local batteries=($(ls /sys/class/power_supply/ | grep ^BAT[0-9]$))
	[[ "${batteries}" = "" ]] && return 1

	local battery="/sys/class/power_supply/${batteries[0]}"
	local level=$(cat ${battery}/capacity)
	local status=$(cat ${battery}/status)
	local is_charging=false
	[[ "${status}" = "Charging" ]] && is_charging=true

	local icon
	if ((level>=60))
	then
		icon="󱊣"
	elif ((level>=40))
	then
		icon="󱊢"
	elif ((level>=20))
	then
		icon="󱊡"
	else
		icon="󰂎"
	fi

	echo -n "${icon}"
	${is_charging} && echo -n "󱐋"
	echo -n "\n${level}"
}

function _tmux_volume() {
	local IFS=$'\n'
	local level=$(wpctl get-volume @DEFAULT_SINK@ | cut -d\  -f2 | sed -e "s/^0//" -e "s/\.//")
	[[ "${level}" = "" ]] && return 1
	[[ "${level}" = "00" ]] && level="0"

	local icon
	if ((level>=80))
	then
		icon="󰕾"
	elif ((level>=40))
	then
		icon="󰖀"
	elif ((level>=10))
	then
		icon=""
	else
		icon="󰝟"
	fi

	local muted=$(wpctl get-volume @DEFAULT_SINK@ | grep '[MUTED]')
	if [[ "${muted}" != "" ]]; then
		icon="󰸈"
	fi

	echo "${icon}"
	echo -n "${level}"
}

function _tmux_statusbar() {
	local IFS=$'\n'

	# Get data.
	battery=($(_tmux_battery))
	volume=($(_tmux_volume))

	# Prepare separators.
	sep_batvol=" "

	if [[ "${battery[1]}" != "" ]] || [[ "${volume[1]}" != "" ]]; then
		sep_batvol="  "
	fi
	if [[ "${battery[0]}" = "" ]]; then
		sep_batvol=""
	fi

	# Print.
	echo -n " "

	# Assemble.
	if $(cat "/tmp/.tmux_uber" || echo false); then
		[[ "${volume[0]}"  != "" ]] && echo -n "${volume[0]} ${volume[1]}%${sep_batvol}"
		[[ "${battery[0]}" != "" ]] && echo -n "${battery[0]} ${battery[1]}%"
	else
		[[ "${volume[0]}"  != "" ]] && {
			echo -n "${volume[0]}"
			[[ "${volume}" -gt 100 ]] && echo -n " ${volume[1]}%"
			echo -n "${sep_batvol}"
		};
		[[ "${battery[0]}" != "" ]] && {
			echo -n "${battery[0]}"
			[[ "${battery[1]}" -lt 40 ]] && echo -n " ${battery[1]}%"
		};
	fi

	echo -n " "
}

function _tmux_client_count() {
	local IFS=$'\n'
	local session=${1}
	local count=$(tmux list-clients -t ${session} | wc -l)

	[ ${count} -gt 1 ] && echo -n "(${count}) "
}

function _tmux_toggle_statusbar() {
	local file="/tmp/.tmux_uber"
	if [[ ! -f ${file} ]]; then
		echo "true" > ${file}
	elif $(cat ${file}); then
		echo "false" > ${file}
	else
		echo "true" > ${file}
	fi
}

IFS=$'\n'
action=${1}
session=${2}

case "${action}" in
	"statusbar")       _tmux_statusbar ;;
	"client_count")    _tmux_client_count ${session} ;;
	"togglestatusbar") _tmux_toggle_statusbar ;;
esac
