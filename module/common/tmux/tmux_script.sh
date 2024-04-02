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

	echo -n " ${level} ${icon}"
	${is_charging} && echo -n "󱐋"
	echo -n " "
}

case ${action} in
	"battery")
		_tmux_battery
		;;
	"*")
		;;
esac
