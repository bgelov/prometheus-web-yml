#!/usr/bin/env bash
set -Eeuo pipefail

echo "Generation web.yml for Prometheus basic authentication."
echo "Enter username:"
read htpasswd_username
htpasswd_string=$(htpasswd -nBC 17 "$htpasswd_username")

echo "Creating web.yml..."
if [ -f "web.yml" ]
then
	read -p "Do you want recreate web.yml? (y/n)" choice
	case "$choice" in 
	  y|Y )
		echo "yes"
		echo "basic_auth_users:" > web.yml
		echo "  $htpasswd_string" >> web.yml
		;;
	  n|N )
		echo "no";
		read -p "Do you want add htpasswd username:password to the end of the web.yml file? (y/n)" choice
		case "$choice" in 
		  y|Y )
			echo "yes"
			echo "  $htpasswd_string" >> web.yml
			;;
		  n|N )
			echo "no";
			echo "Bye!"
			exit
			;;
		  * )
			echo "invalid"
			;;
		esac
		;;
	  * )
		echo "invalid"
		;;
	esac
fi


echo "=============================="
echo "web.yml file content:"
cat web.yml
