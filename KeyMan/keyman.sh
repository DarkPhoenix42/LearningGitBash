#!/bin/bash
source utils.sh

main(){
    flags="--list-secret-keys --keyid-format=long"
    print_banner

    while true;
    do

    print_menu
    read -p "Choose any option: " choice 

    if [[ !($choice =~ ^[-+]?[0-9]+$) ]]
    then
        printf "Please enter an integer!\n"
        continue
    fi 

    clear

    if [ $choice -eq 1 ]
    then
        list_keys
    
    elif [ $choice -eq 2 ]
    then
        printf "Creating a new key..\n"
        gpg --full-generate-key

    elif [ $choice -eq 3 ]
    then
        
        list_keys

        printf  "Which key do you want to use: "
        read idx
        if [[ !($idx =~ ^-?[0-9]+$) ]]
        then
            printf "Invalid index!\n"
            continue
        fi
        
        n_keys=$(gpg $flags | grep "sec" | wc -l)

        if (( idx > n_keys || idx < 1 ));
        then
            printf "Invalid key!\n"
            continue
        fi
        
        key_id=$(gpg $flags | awk '$1 ~ /sec/ {print $2}' | awk -F "/" '{print $2}' | sed -n "${idx}p")
        git config --global user.signingkey $key_id
        git config --global commit.gpgsign true
        printf "\nKey set to $key_id!\n" 
        printf "Associated public key is:\n";
        gpg --armor --export $key_id;
    
    elif [ $choice -eq 4 ]
    then
        
        list_keys

        printf "Which key do you want to remove: "
        read idx
        
        if [[ !($idx =~ ^-?[0-9]+$) ]]
        then
            printf "Invalid index!\n"
            continue
        fi

        n_keys=$(gpg $flags | grep "sec" | wc -l)

        if (( idx > n_keys || idx < 1 ));
        then
            printf "Invalid key!\n"
            continue
        fi
        
        key_id=$(gpg $flags | awk '$1 ~ /sec/ {print $2}' | awk -F "/" '{print $2}' | sed -n "${idx}p")
        gpg --delete-secret-key $key_id
        gpg --delete-key $key_id

        printf "\nDeleted key $key_id!\n"
    
    elif [ $choice -eq 5 ]
    then
        printf "Thanks for using KeyMan! Goodbye!\n" 
        exit
        
    else
        printf "Invalid option!\n"
    fi
    done
}

main