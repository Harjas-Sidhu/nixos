{ config, pkgs, varibales, ... }:

let
rofi = config.home-manager.users.${config.user}.programs.rofi.finalPackage;
in
{

# Adapted from:
# https://gitlab.com/vahnrr/rofi-menus/-/blob/b1f0e8a676eda5552e27ef631b0d43e660b23b8e/scripts/rofi-power
# A rofi powered menu to execute power related action.

	config.powerCommand = builtins.toString (
			pkgs.writeShellScript "powermenu" ''
			#!/usr/bin/env bash

			# Current Theme
			dir="$HOME/.config/rofi/themes"

			# CMDs
			lastlogin="`last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7`"
			uptime="`uptime -p | sed -e 's/up //g'`"
			host=`hostname`

			# Options
			hibernate=''
			shutdown=''
			reboot=''
			lock=''
			suspend=''
			logout=''
			yes=''
			no=''

			# Rofi CMD
			rofi_cmd() {
				rofi -dmenu \
					-p " $USER@$host" \
					-mesg " Last Login: $lastlogin |  Uptime: $uptime" \
					-theme ${dir}/powermenu.rasi
			}

	# Confirmation CMD
	confirm_cmd() {
		rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
			-theme-str 'mainbox {children: [ "message", "listview" ];}' \
			-theme-str 'listview {columns: 2; lines: 1;}' \
			-theme-str 'element-text {horizontal-align: 0.5;}' \
			-theme-str 'textbox {horizontal-align: 0.5;}' \
			-dmenu \
			-p 'Confirmation' \
			-mesg 'Are you Sure?' \
			-theme ${dir}/powermenu.rasi
	}

	# Ask for confirmation
	confirm_exit() {
		echo -e "$yes\n$no" | confirm_cmd
	}

	# Pass variables to rofi dmenu
	run_rofi() {
		echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
	}

	# Execute Command
	run_cmd() {
		selected="$(confirm_exit)"
			if [[ "$selected" == "$yes" ]]; then
				if [[ $1 == '--shutdown' ]]; then
					systemctl poweroff
				elif [[ $1 == '--reboot' ]]; then
					systemctl reboot
				elif [[ $1 == '--hibernate' ]]; then
					systemctl hibernate
				elif [[ $1 == '--suspend' ]]; then
					systemctl suspend
				elif [[ $1 == '--logout' ]]; then
					systemctl logout
				fi
			else
				exit 0
			fi
	}

	# Actions
	chosen="$(run_rofi)"
		case ${chosen} in
		$shutdown)
		run_cmd --shutdown
		;;
	$reboot)
		run_cmd --reboot
		;;
	$hibernate)
		run_cmd --hibernate
		;;
	$lock)
		betterlockscreen -l
	$suspend)
		run_cmd --suspend
		;;
	$logout)
		run_cmd --logout
		;;
	esac
			''
	);
}
