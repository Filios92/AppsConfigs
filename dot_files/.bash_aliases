alias mc='source /usr/lib/mc/mc-wrapper.sh'
alias exp='explorer.exe .'
alias hgrep='history | grep'
alias glolf="git log --oneline --all --color=always | fzf --style=full --ansi -m --no-sort --preview='git show --color=always {1}' | awk '{print \$1}'"

if command -v eza > /dev/null 2>&1; then
    alias ls='eza --icons'
    alias lt='ls -l --sort modified'
    alias l='ls -l'
fi

if command -v nvim > /dev/null 2>&1; then
    alias vimdiff='nvim -d'
fi

if command -v batcat > /dev/null 2>&1; then
    alias bat='batcat'
fi

if [ -f ~/.bash_aliases_work ]; then
    . ~/.bash_aliases_work
fi

cdd() {
  mkdir "$1" && cd "$1";
}

