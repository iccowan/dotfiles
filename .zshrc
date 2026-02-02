# Custom Aliases
function masterize() {
    git fetch origin main &&
        git rebase main
}

function gitclean() {
    git fetch --prune &&
        git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads |
        awk '$2 == "[gone]" {print $1}' |
        xargs git branch -D &
    git gc
}

function copyfile() {
    cat $1 | xclip -selection clipboard
}

# Enable reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward

# History
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Automatically update JAVA_HOME from asdf
# function update_java_home_asdf {
#     asdf current java 2>&1 > /dev/null
#     if [[ "$?" -eq 0 ]]
#     then
#         export JAVA_HOME=$(asdf where java)
#     fi
# }

# precmd() { update_java_home_asdf; }

# Set default editor to nvim
export VISUAL="nvim"

# GPG Signing Key
export GPG_TTY=$(tty)

# Add ASDF to PATH
export PATH="$PATH:/var/home/ian/.asdf/bin"
export PATH="$PATH:/var/home/ian/.asdf/shims"

# Prepare distrobox for prompt
HOST_NAME="%m"
ICON=""

if [[ -v CONTAINER_ID ]]; then
    HOST_NAME="$CONTAINER_ID"
    ICON="📦"
fi

# Add autocompletion
autoload -U compinit; compinit

# Add git info to prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true

zstyle ':vcs_info:git:*' formats ' (%b%c%u%m)'
zstyle ':vcs_info:git:*' actionformats ' (%b%c%u%m)'

precmd() {
  vcs_info
}

setopt prompt_subst

PROMPT='${ICON}[%n@${HOST_NAME}${vcs_info_msg_0_}]%~%# '
