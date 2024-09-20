#!/bin/bash
# Script made with <3 by Syanic XD (YouTube)

# Kya dekh rahe ho bhai? Naam change krke apne channel par daloge?? 
# Don't steal my code bruhh

setup() {
    echo ""
    echo "### Su: Stating.."
    echo "### Su: Updating System.. [1/2]"
    sudo apt-get update
    echo "### Su: Updated System.. [1/2]"
    echo "### Su: Upgrading System.. [2/2]"
    sudo apt-get upgrade -y
    echo "### Su: Upgraded System.. [2/2]"

    echo "### Su: Installing Discord PTB, Chromium & Chrome Remote Desktop.."
    wget -O discord-ptb.deb "https://discordapp.com/api/download/ptb?platform=linux&format=deb"
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    
    sudo apt install ./discord-ptb.deb -y
    sudo apt-get install chromium-browser -y
    sudo apt install ./chrome-remote-desktop_current_amd64.deb -y
    
    echo "### Su: Installing Openbox with English Keyboard.."
    sudo apt-get install openbox -y
    echo "### Su: Installed Openbox with English Keyboard."
    
    remotedesktop
}

remotedesktop() {
    echo "### Su: Paste your Chrome Remote Desktop s' Derbian SSH Command below >"
    read ssh_command

    echo "### Su: Killing all existing Chrome Remote Desktop instances..."
    sudo pkill -f chrome-remote-desktop

    if pgrep -x "chrome-remote-desktop" > /dev/null; then
        echo "### Su: Waiting for Chrome Remote Desktop daemon to stop..."
        sleep 5
    else
        echo "### Su: Chrome Remote Desktop daemon is fully stopped."
    fi

    echo "### Su: Removing all existing Chrome Remote Desktop hosts..."
    existing_hosts=$(sudo /opt/google/chrome-remote-desktop/chrome-remote-desktop --list-hosts 2>/dev/null | grep -oP '(?<=`)[a-f0-9\-]+(?=`)')
    
    if [ -n "$existing_hosts" ]; then
        for host in $existing_hosts; do
            sudo /opt/google/chrome-remote-desktop/chrome-remote-desktop --remove-host=$host
            echo "### Su: Removed host: $host"
        done
    else
        echo "### Su: No existing hosts found."
    fi

    sudo pkill -f chrome-remote-desktop
    random_number=$(( RANDOM % 101 + 1 ))
    modified_command=${ssh_command//DISPLAY=/}
    modified_command=${modified_command/--name=\$(hostname)/--name=\"Sub to Syanic XD ($random_number)\"}
    modified_command+=" --pin=111111"
    #echo "### Running command: $modified_command"
    
    output=$(eval "$modified_command" 2>&1)
    sleep 5
    echo "$output"
    
    if echo "$output" | grep -q "OAuth error"; then
        echo "### Su: Error Detected (OAuth) -> Your SSH command might be old, please provide the new SSH command."
    elif echo "$output" | grep -q "Host started successfully."; then
        echo "### Su: The Machine is UP and Ready!! An instance named [Sub to Syanic XD ($random_number)] should appear on your Chrome Remote Desktop APP."
        echo "### Su: Use the code 111111 to Connect!!"
    fi
}

main() {
    clear
    echo "===== SYANIC UTILITY (Su) ====="
    echo "Made by Syanic XD on YouTube <3"
    echo ""
    echo "Options:"
    echo "1. Setup Openbox + Chrome Remote Connection + Discord PTB"
    echo "2. Start Chrome Remote Connection (ONLY USE IF ALREADY SETUPED)"
    echo "3. Exit"
    echo ""
    read -p "Select an option (1/2/3): " option

    case $option in
        1)
            setup
            ;;
        2)
            remotedesktop
            ;;
        3)
            echo "### Su: Exiting..."
            exit 0
            ;;
        *)
            echo "Su: Invalid option."
            main
            ;;
    esac
}

main
