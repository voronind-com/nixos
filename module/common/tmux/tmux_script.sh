#!/usr/bin/env bash

action="${1}"

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
	[[ "${level}" -lt 40 ]] && echo -n " ${level}"
}

function _tmux_volume() {
	local IFS=$'\n'
	local level=$(wpctl get-volume @DEFAULT_SINK@ | cut -d\  -f2 | sed -e "s/^0//" -e "s/\.//")
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

	wpctl get-volume @DEFAULT_SINK@ | grep '[MUTED]' && icon="󰸈"

	echo -n "${icon}"
	[[ "${level}" -gt 100 ]] && echo -n " ${level}%"
}

case ${action} in
	"battery") _tmux_battery ;;
	"volume")  _tmux_volume  ;;
	"*") ;;
esac
