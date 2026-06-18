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

# Initialize zsh autocomplete
autoload -Uz compinit
compinit
autoload -U colors

# If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word.
setopt always_to_end

# Change dir without typing cd, just type the dir
setopt auto_cd

# Hitting tab now instead gives the first match instead of choosing with another tab. Hitting more tab cycles thorugh the list.
setopt menu_complete

# Fewer distractions. 
# Beep disables error bell sound. 
# nomatch turns off error from matching (e.g. ls *.txt) to instead use the literal string. 
# notify prevents from interrupting mid command and waits until next prompt to notify.
unsetopt beep nomatch notify

# History settings
HISTSIZE=100000
SAVEHIST=100000
# Handle commands in history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_reduce_blanks

# Share history accross terminals
setopt share_history

# Append to history instead of overwriting
setopt append_history

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

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

# Custom aliases
alias cl="clear"
alias l='ls -laF --color'
alias lh='ls -lahF --color'
alias ls='ls -F --color'
alias s='sudo'
#Add extra protection against mistakes
alias rm='rm -I'
alias untarz='tar -xvf'
alias tarz='tar -cavf'
alias docker-slim="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock dslim/slim:latest"
alias myip='curl https://icanhazip.com'
alias strip-metadata='exiftool -r -All='

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



# Update functions
update-discord() {
    local f
    f=$(mktemp --suffix=.deb) || { echo "Failed to create temporary file."; return 1; }

    curl -sL -o "$f" 'https://discord.com/api/download?platform=linux&format=deb' && \
    sudo apt install -y "$f" && echo "Updated Discord"
    rm "$f" 
}

update-fzf() {
    local d
    d=$(mktemp -d) || { echo "Failed to create temporary directory."; return 1; }
    cd "$d" || return 1

    # Download both the binary and checksums file in a single pipeline
    curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | \
            jq -r '.assets[] | select((.name | endswith("checksums.txt")) or (.name | endswith("linux_amd64.tar.gz"))) | .browser_download_url' | \
        xargs -n 1 curl -sLO

    # Verify checksum and install
    if grep "linux_amd64.tar.gz" *checksums.txt | sha256sum --check --status; then
        sudo tar -xzf fzf-*-linux_amd64.tar.gz -C /usr/local/bin fzf && fzf --version
        echo "Updated fzf"
    else
        echo "Checksum verification failed! Skipping update"
    fi

    # Cleanup
    cd - > /dev/null && rm -rf "$d"
}
