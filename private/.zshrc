# Path to your oh-my-zsh installation.
export ZSH=/Users/tommy/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval $(thefuck --alias)

# alias
alias s28='ssh root@172.16.0.28'
alias s104='ssh root@172.16.5.104'
alias s246='ssh root@120.132.67.246 -p3322'
alias s35='ssh root@172.16.0.35'
alias s212='ssh root@172.16.4.212'
alias s216='ssh root@172.16.0.216'
alias s217='ssh root@172.16.0.217'
alias sali='ssh root@121.43.189.67'
alias s204='ssh root@172.16.0.204'
alias gvf='gvf() {govendor fetch -tree -insecure $1::syncsvn.example.co/platform/$1@$2};gvf $@'
alias gvl='govendor list'
alias gorun='gorun() {go run main.go -conf=/Users/tommy/work/src/$1/$1-test.toml};gorun'

#autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

#gradle
export GRADLE_HOME=/usr/local/gradle
export PATH=${GRADLE_HOME}/bin:$PATH

export PATH=/usr/local/zookeeper/bin:$PATH

export M2_HOME=/usr/local/maven
export PATH=${M2_HOME}/bin:$PATH

export GO_HOME=/usr/local/go
export PATH=${GO_HOME}/bin:$PATH

export GOPATH=${HOME}/work
export PATH=${GOPATH}/bin:$PATH

export PATH=/usr/local/scala/bin:$PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/homebrew/php/php70/bin:$PATH"

