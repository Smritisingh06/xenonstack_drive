#!/bin/bash
display_manual_page() {
    cat << EOF
internsctl(1)                  User Commands                  internsctl(1)

NAME
    internsctl - Custom Linux command for various operations

SYNOPSIS
    internsctl [OPTIONS]

DESCRIPTION
    internsctl is a custom Linux command that provides various functionalities based on different options.

OPTIONS
    --help          Display usage examples and guidelines.
    --version       Display the version of the command.
    cpu getinfo     Get CPU information
    memory getinfo  Get Memory information
    user create <username>  Create a new user
    user list               List regular users
    user list --sudo-only   List users with sudo permissions
    file getinfo [options] <file-name>  Get file information

EXAMPLES
    To display help:
        internsctl --help

    To check the version:
        internsctl --version

SEE ALSO
    Additional information and options can be found in the command documentation.
EOF
}

display_help() {
    cat << EOF
Usage: internsctl [OPTIONS]

Options:
    --help          Display usage examples and guidelines.
    --version       Display the version of the command.
    cpu getinfo     Get CPU information
    memory getinfo  Get Memory information
    user create <username>  Create a new user
    user list               List regular users
    user list --sudo-only   List users with sudo permissions
    file getinfo [options] <file-name>  Get file information
EOF
}

display_version() {
    echo "internsctl v0.1.0"
}

get_cpu_info() {
    lscpu
}

get_memory_info() {
    free
}

create_user() {
    local username="$3"
    if [[ -n "$username" ]]; then
        sudo useradd -m "$username"
        echo "User '$username' created successfully."
    else
        echo "Error: Missing username. Usage. interstl user create <username>"
    fi
}

list_regular_users() {
    cut -d: -f1 /etc/passwd
}

list_sudo_users() {
    grep -Po '^sudo.+:\K.*$' /etc/group | tr ',' '\n'
}

get_file_info() {
    local filename="$1"

    if [[ -n "$filename" ]]; then
        if [[ -e "$filename" ]]; then    
            echo "File:     $filename"
            echo "Access:   $(ls -l "$filename" | cut -d' ' -f1)"
            echo "Size(B):  $(stat -c%s "$filename")"
            echo "Owner:    $(stat -c%U "$filename")"
            echo "Modify:   $(stat -c%y "$filename")"
        else
            echo "Error: Missing File '$filename' does not exist."
        fi
    else
        echo "Error: Missing filename. Usage: internsctl file getinfo [options] <filename>"
    fi
}

file_info_options(){
    local option="$1"
    local filename="$2"

    if [[ -n "$option" && -n "$filename" ]]; then
        case "$option" in
            "--size" | "-s")
                echo "$(stat -c%s "$filename")"
                ;;
            "--permission" | "-p")
                echo "$(ls -l "$filename" | cut -d' ' -f1)"
                ;;
            "--owner" | "-o" | "o")
                echo "$(stat -c%U "$filename")"
                ;;
            "--last-modified" | "-m" | "m" )
                echo "$(stat -c%y "$filename")"
                ;;
            *)
                echo "Error: Invalid option"
                ;;
        esac
    else
        echo "Error: Missing option or filename."
        echo "Usage: internsctl file getinfo [options] <filename>"
    fi
}


case "$1" in

    "--help")
        display_help
        ;;

    "--version")
        display_version
        ;;

    "cpu")
        if [[ "$2" == "getinfo" ]];then
                get_cpu_info
        else
            display_manual_page
        fi
        ;;


    "memory")
        if [[ "$2" == "getinfo" ]]; then
            get_memory_info
        
        else
            display_manual_page
        fi
        ;;

    "user")
        case "$2" in
            "create")
                if [[ -n "$3" ]]; then
                    create_user "$@"
                else
                    echo "Error"
                fi
            ;;

            "list")
                if [[ "$3" == "--sudo-only" ]]; then
                    list_sudo_users
                else
                    list_regular_users
                fi
                ;;
            *)
                display_manual_page
                ;;
        esac

        ;;

    "file")
        if [[ "$2" == "getinfo" ]]; then
            if [[ -n "$3" ]]; then
                if [[ "$3" == "--size" || "$3" == "-s" || "$3" == "--permission" || "$3" == "-p" || "$3" == "--owner" || "$3" == "-o" || "$3" == "o" || "$3" == "--last-modified" || "$3" == "-m" || "$3" == "m" ]]; then
                    if [[ -n "$4" ]]; then
                        file_info_options "$3" "$4"
                    else
                        echo "Error: Missing filename"
                    fi
                else
                    get_file_info "$3"
                fi
            else
                display_manual_page
            fi
        else
            display_manual_page
        fi
        ;;

    *)
        display_manual_page
        ;;
esac