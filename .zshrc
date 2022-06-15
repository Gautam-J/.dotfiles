# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    colored-man-pages
    zsh-syntax-highlighting  # must be the last plugin
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ---------------------------CUSTOM CONFIGURATION------------------------------

# custom function for cp
function ncp () {
    if [ -f "src/${1}.cpp" ]; then
        echo "${1}.cpp file exists!" 1>&2
        return 1
    else
        touch src/template.cpp
        cp src/template.cpp src/${1}.cpp
        nvim src/${1}.cpp
    fi
}

# Ctrl+e to edit command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Useful aliases
alias grep='grep --colour=auto'
alias diff='colordiff'

alias ls='ls -G'
alias ll="ls -lh"
alias la='ls -A'
alias lla='ll -A'
alias ld='ls -d .*'
alias lld='ll -d .*'

alias cp="cp -aiv"
alias cd..='cd ..'
alias mv="mv -iv"
alias rm="rm -riv"
alias mkdir="mkdir -pv"
alias df='df -h'
alias du="du -h"
alias dud="du -d 1"
alias ducd="du -s"
alias findd="find . -type d -name"
alias findf="find . -type f -name"
alias v='nvim'
alias py='python'
alias editvim="nvim ~/.config/nvim/init.vim"
alias editzsh="nvim ~/.zshrc"
alias listenvs="conda info --envs"
alias ports='netstat -tulanp'
alias wget='wget -c'
alias myip="curl http://ipecho.net/plain; echo"
alias localip="ipconfig getifaddr en0"
alias -g G='| grep'
alias watchfile='tail -f'
alias flash="sudo dd bs=4M status=progress oflag=sync"
alias jpnb="jupyter notebook"
alias caf="caffeinate -is &"

# Tmux
alias t='tmux'
alias tk='tmux kill-server'
alias tns='tmux new -s'
alias tks='tmux kill-session -t'
alias ta='tmux attach'
alias tas='tmux attach -t'
alias tls='tmux ls'
alias tnw='tmux neww -n'

# CP
alias nt="cat > testCases"
alias cr="find . -name '*.cpp' -exec awk 'NR==1&&/^$/{print FILENAME}' {} \;"
alias stc="rg -F 'O()'"

# Git
alias g="git"
alias glog="git glog"
alias gss="git status"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -v"
alias gp="git push"
alias gpl="git pull"
alias gcl='git clone'
alias gini="git init"
alias gdif="git diff --minimal"
alias gsw="git switch"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Add to path
export PATH="$PATH:/Users/gautam/Coding/flutter/bin"

# env variables
export FZF_DEFAULT_COMMAND="fd"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d ."

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gautam/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gautam/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/gautam/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gautam/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
