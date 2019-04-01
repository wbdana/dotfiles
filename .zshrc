# AUR-Update to $PATH
export PATH=$HOME/.aur-update:$PATH
# Node Version Manager
source /usr/share/nvm/init-nvm.sh

# AUR-Update to $PATH
export PATH=$HOME/.aur-update:$PATH

# Start intel-virtual-output
alias iii="intel-virtual-output"

# Restart bluetooth
alias blu="sudo systemctl restart bluetooth.service"

# ADB Toggle Inspector
alias tins="/home/wbdana/.nvm/versions/node/v9.4.0/lib/node_modules/expo-cli/node_modules/xdl/binaries/linux/adb/adb shell input keyevent 82"

# Android Studio
export ANDROID_SDK_ROOT=/opt/android-sdk/

# npm
#export PATH=/usr/lib/node_modules/npm/bin:$PATH

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/wbdana/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# example:
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
export DEFAULT_USER=whoami

#####################################################
# CARRIED OVER FROM ~/.bash_profile and ~/.bashrc   #
#####################################################

# Start SSH agent automatically; make sure only one process runs at a time
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# PATH stuff
# Don't remember why I added this one:
export PATH="$PATH:/home/wbdana/.local/bin"

#####################################################
# END CARRY OVER FROM ~/.bash_profile and ~/.bashrc #
#####################################################

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Removed rails because of an error
plugins=(
  git ruby python archlinux rvm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wbdana/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Alias thefuck
#eval $(thefuck --alias)

# Run neofetch on start
clear
neofetch

export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Make sure rvm is loaded into the shell as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


# So here's the deal with Bumblebee, BBSwitch, and TLP
# Bumblebee requires BBSwitch to work
# BBSwitch, if loaded, will not let you boot up the graphical interface on system boot
# So what to do?
# Install bumblebee, bbswitch: sudo pacman -Syu bumblebee bbswitch
# Make sure the bumblebee service is disabled: sudo systemctl disable bumblebeed.service
# Do nothing with respect to bbswitch
# Also make sure you're using the nvidia drivers
# After a reboot, start the bumblebee service: sudo systemctl start bumblebeed.service
# Or use the convenient alias:
alias startup="sudo systemctl start bumblebeed.service && echo Bumblebee service started!"
# As for TLP, install it: sudo pacman -Syu tlp
# Enable it: sudo systemctl enable tlp.service
# Get the output of: lspci | grep "NVIDIA" | cut -b -8
# Which will be something like "01:00.0"
# Edit /etc/default/tlp to add the above output to the line:
# RUNTIME_PM_BLACKLIST="01:00.0"
# Don't forget the quotes!

# Reminder to run startup if bumblebee is not running
systemctl is-active --quiet bumblebeed.service || echo Bumblebee is not running! Run \`startup\` now to start it.

