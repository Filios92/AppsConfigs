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

if command -v yazi > /dev/null 2>&1; then
function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}
fi

function install-local() {
    if test -f "$1"; then
        local p=$(readlink -f "$1")
        local b="${2:-$(basename $p)}"
        ln -sf "$p" "$HOME/.local/bin/$b"
        echo "Symlinked $p in ~/.local/bin/$b"
    else
        echo "Bad path $1"
        exit 1
    fi
}

