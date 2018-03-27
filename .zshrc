# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# 主题选择
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# 自己设定一个主题随机切换组
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# cae-sensitive 区分大小写
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# 使用字符不敏感
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# 取消每周自动升级
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# 自动升级间隔天数设置
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# 取消ls颜色
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# 取消自动设置的终端标题
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# 打开自动纠错
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# 在等待完成时显示红点
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# 
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# 在终端输出显示时间
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# 使用其他自定义主题
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# 插件
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# 加载ros
source /opt/ros/kinetic/setup.zsh 

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

# 设置命令别称
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cao="fuck"

# 配置thefuck
eval $(thefuck --alias)

# 配置ros教学包
source ~/code/ros/catkin_ws/devel/setup.zsh
# 配置Dashgo包
source ~/code/ros/dashgo_ws/devel/setup.zsh
