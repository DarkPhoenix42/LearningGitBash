#!/bin/bash

print_banner(){
    printf " _   _          __  __             \n"    
    printf "| |/ /___ _   _|  \/  | __ _ _ __  \n"
    printf "| ' // _ \ | | | |\/| |/ _\` | '_ \ \n"
    printf "| . \  __/ |_| | |  | | (_| | | | |\n"
    printf "|_|\_\___|\__, |_|  |_|\__,_|_| |_|\n"
    printf "          |___/                    \n"
}

print_menu(){
    printf "\nOptions:\n\n"
    printf "1. List all GPG keys.\n" 
    printf "2. Generate a new key pair.\n" 
    printf "3. Choose a key to use for git.\n" 
    printf "4. Delete a key.\n" 
    printf "5. Exit.\n\n"
}

list_keys(){
    printf "You have the following keys..\n"

    key_ids=()
    while IFS= read -r line; do
        key_ids+=( "$line" )
    done < <( gpg --list-secret-keys --keyid-format=long | awk '/sec/{if (length($2)>0) print $2}' )
    
    key_users=()
    while IFS= read -r line; do
        key_users+=( "$line" )
    done < <( gpg --list-secret-keys --keyid-format=long | awk -F"[\](]" '{if (length($2)>0) print $2}' )
    
    key_emails=()
    while IFS= read -r line; do
        key_emails+=( "$line" )
    done < <( gpg --list-secret-keys --keyid-format=long | awk -F"[<>]" '{if (length($2)>0) print $2}' )
   
   for i in "${!key_ids[@]}"; do
        printf "\n$((i+1)). "
        printf "Key ID: ${key_ids[$i]}\n"
        printf "User: ${key_users[$i]}\n"
        printf "Email: ${key_emails[$i]}\n"
    
    done
    printf "\n"
}