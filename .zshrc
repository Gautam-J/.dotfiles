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

# creates ./src/${1}.cpp file, with ./src/template.cpp as template
function ncp () {
    if [ -f "src/${1}.cpp" ]; then
        echo "${1}.cpp file exists!" 1>&2
        return 1
    else
        cp src/template.cpp src/${1}.cpp
        nvim src/${1}.cpp
    fi
}

# create directory and cd into it
function mkcd () {
    mkdir ${1} && cd ${1};
    echo "Current Directory: $(pwd)"
}

# Show color output
alias grep='grep --colour=auto'
alias diff='colordiff'

# listing files, long format, (only) hidden files
alias ls='ls -G'
alias ll="ls -lh"
alias la='ll -A'
alias ld='ll -d .*'

# preserve structure, prompt for confirmation, verbose
alias cp="cp -Riv"
alias mv="mv -iv"
alias rm="rm -riv"
alias mkdir="mkdir -pv"

# human readable form
alias df='df -h'
alias du="du -h"

alias dud="du -d 1"  # display only directory disk usage
alias ducd="du -s"  # display disk usage of working directory

# fd is much faster than find, thanks to rust
alias findd="fd -td -H"  # find directory, including hidden
alias findf="fd -tf -H"  # find file, including hidden

# quick edits
alias ev="nvim ~/.config/nvim/init.vim"
alias ez="nvim ~/.zshrc"
alias et="nvim ~/.config/tmux/tmux.conf"

# shortforms
alias cd..='cd ..'
alias v='nvim'
alias py='python'
alias jpnb="jupyter notebook"
alias caf="caffeinate -is &"
alias -g G='| rg'  # grep

# useful aliases
alias wget='wget -c'  # continue previous download
alias watchfile='tail -f'  # continuous update of file, eg. log files
alias cenv="conda info --envs"
alias ports='netstat -tulanp'  # open ports
alias myip="curl http://ipecho.net/plain; echo"  # public IP
alias localip="ipconfig getifaddr en0"  # local IP
alias flash="sudo dd bs=4M status=progress oflag=sync"
alias time="/usr/bin/time -p"  # print in separate line

# CP
alias nt="cat > testCases"
# files without source/rank
alias cr="fd -tf -e .cpp -x awk 'NR==1&&/^$/{print FILENAME}' {} \;"
# files without complexities mentioned
alias stc="rg -F 'O()'"

# Tmux
alias t='tmux'
alias tk='tmux kill-server'
alias tns='tmux new -s'
alias tks='tmux kill-session'
alias ta='tmux attach'
alias tas='tmux attach -t'
alias tls='tmux ls'
alias tnw='tmux neww -n'

# Git
alias g="git"
alias gl="git glog"
alias gst="git status"
alias ga="git add"
alias gaa="git add -A"
alias gci="git commit -v"
alias gp="git push"
alias gpl="git pull"
alias gcl='git clone'
alias gini="git init"
alias gdif="git diff --minimal"
alias gsw="git switch"
alias gco="git checkout"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Add to path
export PATH="$PATH:/Users/gautam/Coding/flutter/bin"

# environment variables
export FZF_DEFAULT_COMMAND="fd -a --base-directory=$HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -td -a . --base-directory=$HOME"

# Ctrl+e to edit command in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Ctrl-f for tmux-sessionizer
bindkey -s ^f "~/Scripts/tmux-sessionizer.sh\n"

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
