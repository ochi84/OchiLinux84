#
#
#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' # original bash prompt
	#PS1=' \[\033[0;35m\]\w \[\033[0;34m\]\$ \[\033[0;32m\]> '

# Check for and source the git-prompt script to enable __git_ps1
if [ -f "/usr/share/git/git-prompt.sh" ]; then
    . "/usr/share/git/git-prompt.sh"
elif [ -f "/etc/bash_completion.d/git-prompt" ]; then
    . "/etc/bash_completion.d/git-prompt"
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")';  PS1=' \[\033[0;35m\]\w \[\033[0;32m\]\$\[\e[91m\]${PS1_CMD1} \[\033[0;37m\]> '
	
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'

    alias grep='grep -in --color=auto'
    alias fgrep='fgrep -in --color=auto'
    alias egrep='egrep -in --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

### EXA_COLORS ###

export EXA_COLORS="uu=34:gu=34:da=34:sn=34:sb=34"

# EXA_COLORS EXAMPLES
#        EXA_COLORS="uu=0:gu=0"
#               Disable the “current user” highlighting
# 
#        EXA_COLORS="da=32"
#               Turn the date column green
# 
#        EXA_COLORS="Vagrantfile=1;4;33"
#               Highlight Vagrantfiles
# 
#        EXA_COLORS="*.zip=38;5;125"
#               Override the existing zip colour
# 
#        EXA_COLORS="*.md=38;5;121:*.log=38;5;248"
#               Markdown files a shade of green, log files a shade of grey
# 
# EXA_COLORS LIST OF CODES
# LS_COLORS can use these ten codes:
# di  directories
# ex  executable files
# fi  regular files
# pi  named pipes
# so  sockets
# bd  block devices
# cd  character devices
# ln  symlinks
# or  symlinks with no target
# EXA_COLORS can use many more:
# ur  the user-read permission bit
# uw  the user-write permission bit
# ux  the user-execute permission bit for regular files
# ue  the user-execute for other file kinds
# gr  the group-read permission bit
# gw  the group-write permission bit
# gx  the group-execute permission bit
# tr  the others-read permission bit
# tw  the others-write permission bit
# tx  the others-execute permission bit
# su  setuid, setgid, and sticky permission bits for files
# sf  setuid, setgid, and sticky for other file kinds
# xa  the extended attribute indicator
# sn  the numbers of a file’s size (sets nb, nk, nm, ng and nh)
# nb  the numbers of a file’s size if it is lower than 1 KB/Kib
# nk  the numbers of a file’s size if it is between 1 KB/KiB and 1 MB/MiB
# nm  the numbers of a file’s size if it is between 1 MB/MiB and 1 GB/GiB
# ng  the numbers of a file’s size if it is between 1 GB/GiB and 1 TB/TiB
# nt  the numbers of a file’s size if it is 1 TB/TiB or higher
# sb  the units of a file’s size (sets ub, uk, um, ug and uh)
# ub  the units of a file’s size if it is lower than 1 KB/Kib
# uk  the units of a file’s size if it is between 1 KB/KiB and 1 MB/MiB
# um  the units of a file’s size if it is between 1 MB/MiB and 1 GB/GiB
# ug  the units of a file’s size if it is between 1 GB/GiB and 1 TB/TiB
# ut  the units of a file’s size if it is 1 TB/TiB or higher
# df  a device’s major ID
# ds  a device’s minor ID
# uu  a user that’s you
# un  a user that’s someone else
# gu  a group that you belong to
# gn  a group you aren’t a member of
# lc  a number of hard links
# lm  a number of hard links for a regular file with at least two
# ga  a new flag in Git
# gm  a modified flag in Git
# gd  a deleted flag in Git
# gv  a renamed flag in Git
# gt  a modified metadata flag in Git
# xx  “punctuation”, including many background UI elements
# da  a file’s date
# in  a file’s inode number
# bl  a file’s number of blocks
# hd  the header row of a table
# lp  the path of a symlink
# cc  an escaped character in a filename
# bO  the overlay style for broken symlink paths
# Values in EXA_COLORS override those given in LS_COLORS, so you don’t need to re-write an existing LS_COLORS variable with proprietary extensions.
#
# LIST OF STYLES
# Unlike some versions of ls, the given ANSI values must be valid colour codes: exa won’t just print out whichever characters are given.
# The codes accepted by exa are:
# 1   for bold
# 4   for underline
# 31  for red text
# 32  for green text
# 33  for yellow text
# 34  for blue text
# 35  for purple text
# 36  for cyan text
# 37  for white text
# 
# 38;5;nnn for a colour from 0 to 255 (replace the nnn part)

### ALIASES ###

# lsaliases
# alias ll='ls -gh'
# alias la='ls -gAh'
# alias l.='ls -A | grep "^\."'
alias ll='exa -l --color=always --group-directories-first' 
alias la='exa -al --color=always --group-directories-first'
alias lt='exa -T --color=always --group-directories-first'
alias l.='exa -a | grep "^\."'

# cdaliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdl='cd && clear'

# programaliases
alias btop='bpytop -lc'
alias m='micro'
alias web='w3m'
alias x='cmatrix -b -u8'
alias rg='ranger'
alias nf='neofetch'

# commandaliases
alias yep='sudo apt install $1'
alias nop='sudo apt remove $1'
alias bye='shutdown -P now'
alias fz='fzf --preview="cat {}"'
alias vfz='vim $(fzf --preview="cat {}")'
alias fz.='find . | fzf --preview="cat {}"'
alias vfz.='vim $(find . | fzf --preview="cat {}")'
alias cl='clear'

# gitaliases
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -m'
alias gd='git done'
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'        # git checkout <vorhandener branch>
alias gcob='git chceckout -b'   # git checkout -b <neuer branch>
alias gm='git merge'            # 1. git checkout main 2. git merge <neuer branch> 3. git push origin main
alias gpo='git push origin'
alias gpom='git push origin main'
alias gr='git restore'

# change awesome background wallpaper
alias awbg='sudo cp background.png /usr/share/awesome/themes/default/ && cp background.png ~/.config/awesome/themes/default/'

#alias rm='rm -i'
#alias mv='mv -i'
#alias cp='cp -i'

# set -o vi	# set vi mode in bash shell

bind "set completion-ignore-case on" # ignore upper and lower case when TAB completion

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar -xjf $1	;;
			*.tar.gz)	tar -xzf $1	;;
			*.bz2)		bunzip2 $1	;;
			*.rar)		unrar -x $1	;;
			*.gz)		gunzip $1	;;
			*.tar)		tar -xf $1	;;
			*.tbz2)		tar -xjf $1	;;
			*.tgz)		tar -xzf $1	;;
			*.zip)		unzip $1	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z -x $1	;;
			*.deb)		ar -x $1	;;
			*.tar.xz)	tar -xf $1	;;
			*.tar.zst)	unzstd $1	;;
			*)		echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

### NAVIGATION
# usage: up <1,2,3,..9
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
