alias mc='source /usr/lib/mc/mc-wrapper.sh'
alias exp='explorer.exe .'

if command -v eza > /dev/null 2>&1; then
    alias ls='eza --icons'
    alias lt='ls -l --sort modified'
    alias l='ls -l'
fi

if [ -f ~/.bash_aliases_work ]; then
    . ~/.bash_aliases_work
fi

