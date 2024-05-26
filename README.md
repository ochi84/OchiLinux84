![logo_ochi84_small](https://github.com/ochi84/OchiLinux84/assets/168211337/9a17e828-ced2-46db-8dfe-5d637bbe8f77)

# Configuration Files and Scripts
This repository contains personal configuration files and scripts for my needs with Ubuntu and Awesome-WM as a backup.

If anyone likes it, I would be happy if my repository helps you set up your personal Awesome-WM configuration.

**See how to install these settings quickly and some screenshots of my configuration below:**

## Contents
Here are some of the key files included in this repository:

-  **.bashrc**  : Bash configuration file for shell settings.
-  **.vimrc**   : Configuration for the VIM text editor.
-  **rc.lua**   : My Awesome WM config file.
-  **sc.conf**   : Configuration file for the scripts below.

## Scripts
Included in this repository are several utility scripts to aid in managing and deploying configurations:

-  **backup**    : Performs backups of essential configuration files, storing them in a predefined backup directory and external drive. Useful for keeping a snapshot of current settings.

-  **dispatch**  : Manages the distribution of dot-, config-files and scripts from a central repository to their designated locations on your system. This ensures your configurations are consistently updated according to the latest changes in the repository.

-  **gitupd**    : A utility script designed to automate the process of updating local git repositories and pushing changes back to remote repositories, simplifying version control operations.

-  **snapcrash** : Addresses and resolves common issues with the Snap Store on Ubuntu systems by refreshing and reinstalling the Snap Store application.

-  **startup**   : Initializes a system with essential software installations and configures it by deploying dot-files and other configurations using the "dispatch" script. Ideal for setting up new machines or restoring settings on existing ones.

-  **update**    : Combines system update and cleanup tasks into a single script, which updates installed packages, removes obsolete files, and cleans up system logs to ensure optimal performance.

-  **mountman**  : A script to mount and unmount external hard drives and USB sticks. At the beginning, you can select from a list of available drives. The default mount path is /media/$USER/, and the mount point will use the name of the external drive or USB stick.

## How to Install
To install the configurations and utility scripts, follow these steps:

1. Run the following command to clone the repository:

    `git clone https://github.com/ochi84/ochilinux84.git`

2. Run the startup script by executing the following commands:

    ```bash
    cd ochilinux84
    sudo ./startup
    ```

### This script will:
-  Prompt for your username to set the HOME directory.
-  Clone the OchiLinux84 repository if it doesn't exist.
-  Load the "sc.conf" file for additional settings.
-  Install selected packages based on the chosen installation type (see below).
-  Install the "dispatch" script and run it to apply configurations.
-  Further install some required nerdfonts and a lot of tilix schemes from https://github.com/storm119/Tilix-Themes.git *(I like the "Pnevma" scheme it can be seen in the last picture above)*

### Installation Options
The script offers different levels of installation:

-  **Minimal Install:** Basic utilities like mc, vim, micro, ranger.
-  **Minimal Plus Install:** Adds more advanced VIM plugins and tools.
-  **Expand Install:** Includes all packages from Minimal Plus and additional tools like git, fzf, exa.
-  **Full Install:** The most comprehensive installation, including window managers and advanced applications *(see the last picture above)*.

*Details can be found in "sc.conf"*

## Risk Advisory
**Please note:** Running scripts can significantly alter the behavior of your system. It is highly advised to review each script to understand what changes will be made to your system. For safety, test the scripts in a controlled, virtual environment before applying them on your primary machine. This helps prevent unintended system behavior or data loss.

## Tested Environments
This repository's scripts and configurations have been tested on the following environments:

- **Ubuntu 22.04.4 LTS** on "HP ProDesk 400 G6 Desktop Mini PC"
- **Ubuntu 22.04.4 LTS (WSL) Windows 10 x86_64** on "HP Z240 Tower Workstation" *( partially! )*
- **Linux Mint 21.3 Xfce** on "33588BBG ThasdfinkPad Edge E130"
- **Linux Mint 21.3 Xfce** on "Acer Aspire E11 (ES1-111-C827)"

## Contribution
This repository is primarily for personal backup. However, if you have suggestions for improvements, I welcome issues or pull requests.

## License
This repository is released under the MIT License.

## Screenshots of my Awesome-WM configuration
##### minimalistic
![Bildschirmfoto vom 2024-05-25 23-38-34](https://github.com/ochi84/OchiLinux84/assets/168211337/9351e8f8-ab55-4eff-a5a0-24f3e2ff76d4)

![Bildschirmfoto vom 2024-05-25 23-40-29](https://github.com/ochi84/OchiLinux84/assets/168211337/75a004d5-eea4-43c6-94d2-b2292a1102f7)

![Bildschirmfoto vom 2024-05-25 23-39-46](https://github.com/ochi84/OchiLinux84/assets/168211337/0e1655e1-068c-421d-a9ee-fee08df0d184)
##### scripting and streaming
![Bildschirmfoto vom 2024-05-25 23-37-43](https://github.com/ochi84/OchiLinux84/assets/168211337/354ec8a6-4f9e-45ec-b274-2b32b9879859)
