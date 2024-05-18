# Dot-Files and Configuration Files

This repository contains personal configuration files and dot-files for backup, restoration and easy synchronization across different machines.

## Contents

Here are some of the key files included in this repository:

- `.bashrc`: Bash configuration file for shell settings.
- `.vimrc`: Configuration for the VIM text editor.
- `rc.lua`: My Awesome WM config file.

## Scripts

Included in this repository are several utility scripts to aid in managing and deploying configurations:

- `backup`: Performs backups of essential configuration files, storing them in a predefined backup directory. Useful for keeping a snapshot of current settings.
  
- `dispatch`: Manages the distribution of dot-, config-files and scripts from a central repository to their designated locations on your system. This ensures your configurations are consistently updated according to the latest changes in the repository.
  
- `gitupd`: A utility script designed to automate the process of updating local git repositories and pushing changes back to remote repositories, simplifying version control operations.
  
- `snapcrash`: Addresses and resolves common issues with the Snap Store on Ubuntu systems by refreshing and reinstalling the Snap Store application.
  
- `startup`: Initializes a system with essential software installations and configures it by deploying dot-files and other configurations using the `dispatch` script. Ideal for setting up new machines or restoring settings on existing ones.
  
- `update`: Combines system update and cleanup tasks into a single script, which updates installed packages, removes obsolete files, and cleans up system logs to ensure optimal performance.

- `mountman`:  A script to mount and unmount external hard drives and USB sticks. At the beginning, you can select from a list of available drives. The default mount path is /media/$USER/, and the mount point will use the name of the external drive or USB stick.

- `sc.conf`: Configuration file for scripts to set colors, directories, files, necessary programs etc.

## Usage

To use these configurations, clone the repository and copy the desired files to your home directory:

```bash
git clone https://github.com/ochi84/github.git
cp dot.bashrc ~/.bashrc
cp dot.vimrc ~/.vimrc
```

## Caution

**Important:** Before copying over the .bashrc or .vimrc files, make sure to backup your existing configurations. This prevents any personal customizations from being overwritten unintentionally. You can do this by running:

```bash
cp ~/.bashrc ~/.bashrc_backup
cp ~/.vimrc ~/.vimrc_backup
```

## Risk Advisory

**Please note:** Running scripts can significantly alter the behavior of your system. It is highly advised to review each script to understand what changes will be made to your system. For safety, test the scripts in a controlled, virtual environment before applying them on your primary machine. This helps prevent unintended system behavior or data loss.

## Contribution

This repository is primarily for personal backup. However, if you have suggestions for improvements, I welcome issues or pull requests.

## License

This repository is released under the MIT License.

## Screenshots of my Awesome-WM configuration

![image](https://github.com/ochi84/github/assets/168211337/18199c3a-3833-4363-8f97-92efea49b6ce)

![neofetch](https://github.com/ochi84/github/assets/168211337/a08bb1ab-34ef-4ef5-a57b-9b1d7aecae57)

![Bildschirmfoto vom 2024-05-11 10-48-44](https://github.com/ochi84/github/assets/168211337/67025829-6154-4ac9-94d8-b9801aca98fc)

![Bildschirmfoto vom 2024-05-11 14-41-23](https://github.com/ochi84/github/assets/168211337/a6ad592d-1fa2-4afa-89bb-59bc89cbaaef)
