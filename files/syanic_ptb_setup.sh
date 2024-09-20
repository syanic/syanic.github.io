#!/bin/bash
# Script made with <3 by Syanic XD (YouTube)

# Kya dekh rahe ho bhai? Naam change krke apne channel par daloge?? 
# Don't steal my code bruhh

echo "===== SYANIC UTILITY ====="
echo "Made by Syanic XD on YouTube <3"
echo ""
echo "Options:"
echo "1. Setup Openbox + Chrome Remote Connection + Discord PTB"
echo "2. Start Chrome Remote Connection (ONLY USE IF ALREADY SETUP)"
echo "3. Exit"
read -p "Select an option [1-3]: " option

if [[ $option -eq 1 ]]; then
    echo "### Updating System.. [1/2]"
    sudo apt-get update
    echo "### Updated System.. [1/2]"
    
    echo "### Upgrading System.. [2/2]"
    sudo apt-get upgrade -y
    echo "### Upgraded System.. [2/2]"
    
    echo "### Installing Discord PTB, Chromium & Chrome Remote Desktop..."
    wget -O discord-ptb.deb "https://discordapp.com/api/download/ptb?platform=linux&format=deb"
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    
    sudo apt install ./discord-ptb.deb -y
    sudo apt-get install chromium-browser -y
    sudo apt install ./chrome-remote-desktop_current_amd64.deb -y

    echo "### Installing Openbox with English Keyboard..."
    sudo apt-get install openbox -y
    echo "### Openbox Installed."

    read -p "Enter your Chrome Remote Desktop SSH Command > " ssh_command

    while true; do
        echo "You entered: $ssh_command"
        read -p "Is this correct? (y/n): " confirm
        if [[ $confirm == "y" || $confirm == "Y" ]]; then
            break
        else
            read -p "Enter your Chrome Remote Desktop SSH Command > " ssh_command
        fi
    done

    modified_command=${ssh_command/--name=*/--name="Sub to Syanic XD"}
    echo "### Starting Chrome Remote Connection..."
    $modified_command

elif [[ $option -eq 2 ]]; then
    echo "Please ensure that Chrome Remote Desktop is already set up."
    read -p "Enter your Chrome Remote Desktop SSH Command > " ssh_command
    $ssh_command

elif [[ $option -eq 3 ]]; then
    echo "Exiting..."
    exit 0

else
    echo "Invalid option selected."
    exit 1
fi
