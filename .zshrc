# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="custom"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gh git-auto-fetch docker docker-compose nmap)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

export FZF_DEFAULT_COMMAND="fdfind . $HOME"
export JAVA_HOME=/usr/lib/jvm/jdk-25
export PATH=$JAVA_HOME/bin:$PATH

# cuda
export PATH=$PATH:/usr/local/cuda/bin

# Increase cursor speed
xset r rate 300 30

# Custom aliases
alias cl="clear"
alias docker-slim="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock dslim/slim:latest"

# Apt aliases
alias apt="apt-fast"
alias apt-remove="sudo apt-fast autoremove --purge"
alias apt-install="sudo apt-fast install"
alias apt-upgrade="sudo apt-fast update && sudo apt-fast upgrade"
alias apt-clean="sudo apt-fast autoclean"

# Git aliases
alias gs="git status --short"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gds="git diff --staged --output-indicator-new=' ' --output-indicator-old=' '"
alias ga="git add"

# Git short-cuts.
function gc() {
  args=$@
  git commit -m "$args"
}

function gca() {
  args=$@
  git commit --amend -m "$args"
}

alias gp="git push"
alias gu="git pull"
alias gf='git fetch'
alias gr='git restore'
alias gb='git branch' # Add -D for deletion
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"

alias l='ls -laF --color'
alias lh='ls -lahF --color'
alias ls='ls -aF --color'
alias s='sudo'
#Add extra protection against mistakes
alias rm='rm -I'
alias untarz='tar -xvf'
alias tarz='tar -cavf'
alias myip='curl https://icanhazip.com'
alias stripmetadata='exiftool -r -All='
alias upgrade-discord="sudo wget -O /tmp/discord.deb 'https://discord.com/api/download?platform=linux&format=deb' && sudo apt install -y /tmp/discord.deb && sudo rm /tmp/discord.deb"
