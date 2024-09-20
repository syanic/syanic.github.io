#!/bin/bash
# Script made with <3 by Syanic XD (YouTube)

# Kya dekh rahe ho bhai? Naam change krke apne channel par daloge?? 
# Don't steal my code bruhh

echo "===== SYANIC UTILITY ====="
echo "Made by Syanic XD on YouTube <3"
echo
echo "Options:"
echo "1. Setup Openbox + Chrome Remote Connection + Discord PTB"
echo "2. Exit"

read -p "Select an option (1 or 2): " option

if [ "$option" -eq 1 ]; then
    echo "### Updating System.. [1/2]"
    sudo apt-get update
    echo "### Updated System.. [1/2]"
    
    echo "### Upgrading System.. [2/2]"
    sudo apt-get upgrade -y
    echo "### Upgraded System.. [2/2]"

    echo "### Installing Discord PTB, Chromium & Chrome Remote Desktop.."
    wget -O discord-ptb.deb "https://discordapp.com/api/download/ptb?platform=linux&format=deb"
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    
    sudo apt install ./discord-ptb.deb -y
    sudo apt-get install chromium-browser -y
    sudo apt install ./chrome-remote-desktop_current_amd64.deb -y

    echo "### Installing Openbox with English Keyboard.."
    sudo apt-get install openbox -y
    sudo apt-get install xkb-utils -y
    echo "### Installed Openbox with English Keyboard."

    read -p "Enter your Chrome Remote Desktop SSH Command > " ssh_command
    
    while true; do
        echo "You entered: $ssh_command"
        read -p "Is this correct? (y/n): " confirm
        if [[ "$confirm" == "y" ]]; then
            break
        else
            read -p "Enter your Chrome Remote Desktop SSH Command > " ssh_command
        fi
    done

    modified_command=$(echo "$ssh_command" | sed 's/--name=.*$/--name="Sub to Syanic XD"/')
    
    echo "### Running Chrome Remote Desktop Command.."
    eval "$modified_command"
else
    echo "Exiting..."
    exit 0
fi
