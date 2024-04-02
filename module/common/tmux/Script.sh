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
	[[ "${level}" -lt 40 ]] && echo -n "\n${level}%"
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

	echo -n "${icon}"
	[[ "${level}" -gt 100 ]] && echo -n "\n${level}%"
}

function _tmux_statusbar() {
	IFS=$'\n'

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

	[[ "${volume[0]}"  != "" ]] && echo -n "${volume[0]}${sep_batvol}"
	[[ "${battery[0]}" != "" ]] && echo -n "${battery[0]}"

	echo -n " "
}

function _tmux_client_count() {
	local IFS=$'\n'
	local session=${1}
	local count=$(tmux list-clients -t ${session} | wc -l)

	[ ${count} -gt 1 ] && echo -n "(${count}) "
}

IFS=$'\n'
action=${1}
session=${2}

case "${action}" in
	"statusbar")    _tmux_statusbar ;;
	"client_count") _tmux_client_count ${session} ;;
esac
