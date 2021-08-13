# load functions
autoload -Uz colors; colors
autoload -Uz compinit; compinit  # tab completion for git
autoload -Uz vcs_info  # state check for git

# define function used for git in zsh
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# : prompt
PROMPT="%F{245}[%n] %B%#%b%f "
RPROMPT='${vcs_info_msg_0_} %F{075}[%~] %f'
zstyle ':vcs_info:git:*' formats "%F{009}%c%u(%b)%f at"
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "+"
zstyle ":vcs_info:git:*" unstagedstr "!"

# : git
git config --global color.ui auto

# : pyenv
# add .pyenv/shims to environment variable to load appropriate python versions defined by, 'pyenv local' or 'pyenv global'.
# if you want to know how fllowing line work, please execute, 'echo "$(pyenv init -)"'.
eval "$(pyenv init -)"

# : alias
# ls
alias ll='ls -alF'
alias la='ls -A'