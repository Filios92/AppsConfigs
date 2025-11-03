source ~/.config/fzf-stuff/fzf-git.sh/fzf-git.sh

# FZF stuff
__fzf_tmux_conf="center,80%,50%"
__show_dir_preview="ls -1 {} | head -200"
__show_file_preview="head -200 {}"
__show_file_or_dir_preview="if [ -d {} ]; then $__show_dir_preview; else $__show_file_preview; fi"
export FZF_CTRL_T_OPTS="--tmux $__fzf_tmux_conf --preview '$__show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--tmux $__fzf_tmux_conf --preview '$__show_dir_preview'"


# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --tmux $__fzf_tmux_conf --preview "$__show_dir_preview" "$@" ;;
    export|unset) fzf --tmux $__fzf_tmux_conf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --tmux $__fzf_tmux_conf --preview 'dig {}'                   "$@" ;;
    *)            fzf --tmux $__fzf_tmux_conf --preview "$__show_file_or_dir_preview" "$@" ;;
  esac
}

