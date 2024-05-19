# OchiLinux84's Configuration Files and Scripts

This repository contains personal configuration files and scripts for backup, restoration and easy synchronization across different machines (see how to install and screenshots of my configuration below).

## Contents

Here are some of the key files included in this repository:

-  **.bashrc**  : Bash configuration file for shell settings.
-  **.vimrc**   : Configuration for the VIM text editor.
-  **rc.lua**   : My Awesome WM config file.

## Scripts

Included in this repository are several utility scripts to aid in managing and deploying configurations:

-  **backup**    : Performs backups of essential configuration files, storing them in a predefined backup directory and external drive. Useful for keeping a snapshot of current settings.

-  **dispatch**  : Manages the distribution of dot-, config-files and scripts from a central repository to their designated locations on your system. This ensures your configurations are consistently updated according to the latest changes in the repository.

-  **gitupd**    : A utility script designed to automate the process of updating local git repositories and pushing changes back to remote repositories, simplifying version control operations.

-  **snapcrash** : Addresses and resolves common issues with the Snap Store on Ubuntu systems by refreshing and reinstalling the Snap Store application.

-  **startup**   : Initializes a system with essential software installations and configures it by deploying dot-files and other configurations using the "dispatch" script. Ideal for setting up new machines or restoring settings on existing ones.

-  **update**    : Combines system update and cleanup tasks into a single script, which updates installed packages, removes obsolete files, and cleans up system logs to ensure optimal performance.

-  **mountman**  : A script to mount and unmount external hard drives and USB sticks. At the beginning, you can select from a list of available drives. The default mount path is /media/$USER/, and the mount point will use the name of the external drive or USB stick.

-  **sc.conf**   : Configuration file for scripts to set colors, directories, files, necessary programs etc.

## How to Install

To install the configurations and utility scripts, follow these steps:

1. Run the following command to clone the repository:

  `git clone https://github.com/ochi84/ochilinux84.git`

3. Run the startup script by executing the following commands:

  ```bash
  cd ochilinux84
  ./startup  # requires root privileges
  ```

### This script will:

-  Prompt for your username to set the HOME directory.
-  Clone the OchiLinux84 repository if it doesn't exist.
-  Install the "dispatch" script and run it to apply configurations.
-  Load the "sc.conf" file for additional settings.
-  Install selected packages based on the chosen installation type (see below).

### Installation Options

The script offers different levels of installation:

-  **Minimal Install:** Basic utilities like mc, vim, micro, ranger.
-  **Minimal Plus Install:** Adds more advanced VIM plugins and tools.
-  **Expand Install:** Includes all packages from Minimal Plus and additional tools like git, fzf, exa.
-  **Full Install:** The most comprehensive installation, including window managers and advanced applications.

Details can be found in "sc.conf"

## Risk Advisory

**Please note:** Running scripts can significantly alter the behavior of your system. It is highly advised to review each script to understand what changes will be made to your system. For safety, test the scripts in a controlled, virtual environment before applying them on your primary machine. This helps prevent unintended system behavior or data loss.

## Tested Environments

This repository's scripts and configurations have been tested on the following environments:

- With **Ubuntu 22.04** on "HP ProDesk 400 G6 Desktop Mini PC"
- With **Linux Mint 21.3 Xfce** on "33588BBG ThinkPad Edge E130"

## Contribution

This repository is primarily for personal backup. However, if you have suggestions for improvements, I welcome issues or pull requests.

## License

This repository is released under the MIT License.

## Screenshots of my Awesome-WM configuration

![image](https://github.com/ochi84/github/assets/168211337/18199c3a-3833-4363-8f97-92efea49b6ce)

![neofetch](https://github.com/ochi84/github/assets/168211337/a08bb1ab-34ef-4ef5-a57b-9b1d7aecae57)

![Bildschirmfoto vom 2024-05-11 10-48-44](https://github.com/ochi84/github/assets/168211337/67025829-6154-4ac9-94d8-b9801aca98fc)

![Bildschirmfoto vom 2024-05-11 14-41-23](https://github.com/ochi84/github/assets/168211337/a6ad592d-1fa2-4afa-89bb-59bc89cbaaef)
