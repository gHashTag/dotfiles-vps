#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
DEFAULT_USER="$USER"
bindkey -v
bindkey jj vi-cmd-mode

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export KEYTIMEOUT=15
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# sets up vimmish text-objects in zsh
autoload -U is-at-least
if is-at-least 5.0.8; then
    autoload -U select-quoted; zle -N select-quoted
    for m in visual viopp; do
        for c in {a,i}{\',\",\`}; do
            bindkey -M $m $c select-quoted
        done
    done
    autoload -U select-bracketed; zle -N select-bracketed
    for m in visual viopp; do
        for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
            bindkey -M $m $c select-bracketed
        done
    done
  fi

#source /usr/local/share/antigen/antigen.zsh

#antigen use oh-my-zsh
#antigen use hlissner/zsh-autopair

#antigen apply

alias n="nvim"
alias up="docker-compose up -d"
alias rnm="rm -rf node_modules && npm install"
alias es6="yarn add -D babel-cli babel-plugin-transform-object-rest-spread babel-preset-env"

plugins=(zsh-autopair react-native vi-mode git npm node heroku yarn)

alias reduxinit="npm i -S redux react-redux redux-thunk eslint-plugin-react firebase lodash prop-types react-native-fetch-blob react-native-image-picker redux-devtools-extension babel-jest babel-preset-react-native react-native-svg react-navigation react-test-renderer axios qs"
alias rni="react-native init"
alias ios="react-native run-ios --simulator='iPhone SE'"
alias and="react-native run-android"
alias s="npm start -- --reset-cache"
#alias ios="react-native run-ios --simulator='iPhone X'"
alias nvimrc='vim ~/dotfiles/.nvimrc'
alias vimrc='nvim ~/dotfiles/.vimrc'
alias zshrc='nvim ~/dotfiles/.zshrc'
alias ctags='nvim ~/dotfiles/.ctags'
alias tg='cd && cd Applications/tg && bin/telegram-cli -W'
alias ..='cd ..'
alias rdir='mkdir -p src/{components,actions,screens,helpers,reducers}'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="dogenpunk"
#ZSH_THEME="powerlevel9k/powerlevel9k"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

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

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/[NORMAL]}/(main|viins)/[INSERT]}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
