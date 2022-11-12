export ZSH="$HOME/.oh-my-zsh"
# export ZSH="$HOME/Repos/ohmyzsh"
ZSH_THEME="bira"
plugins=(git asdf direnv safe-paste ubuntu)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias stpg="sudo systemctl start postgresql"
alias sppg="sudo systemctl stop postgresql"
alias linux-to="/home/ian/.scripts/linuxGetMaintainersToCC.sh"
alias grind="/home/ian/.scripts/valgrindCheck.sh"
alias minecraft="/home/ian/Games/minecraft/minecraft-launcher"
alias gcma="git commit --amend -m"
alias masterize="git fetch origin master && git rebase master"
alias forceup="git push --no-verify --force"

# Automatically update JAVA_HOME from asdf
function update_java_home_asdf {
    asdf current java 2>&1 > /dev/null
    if [[ "$?" -eq 0 ]]
    then
        export JAVA_HOME=$(asdf where java)
    fi
}

precmd() { update_java_home_asdf; }

# Set default editor to nvim
export VISUAL="nvim"

# GPG Signing Key
export GPG_TTY=$(tty)

