if [[ $- =~ i ]]; then

# Author: Brian Beffa <brbsix@gmail.com>
# Original source: https://brbsix.github.io/2015/11/29/accessing-tab-completion-programmatically-in-bash/
__get_completions() {
  local completion COMP_CWORD COMP_LINE COMP_POINT COMP_WORDS COMPREPLY=()

  declare -F _completion_loader &>/dev/null || {
    source /usr/share/bash-completion/bash_completion
  }

  COMP_LINE=$*
  COMP_POINT=${#COMP_LINE}

  eval set -- "$@"

  COMP_WORDS=("$@")

  [[ ${COMP_LINE[@]: -1} = ' ' ]] && COMP_WORDS+=('')

  COMP_CWORD=$(( ${#COMP_WORDS[@]} - 1 ))

  completion=$(complete -p "$1" 2>/dev/null | awk '{print $(NF-1)}')

  [[ -n $completion ]] || {
    _completion_loader "$1"
    completion=$(complete -p "$1" 2>/dev/null | awk '{print $(NF-1)}')
  }

  [[ -n $completion ]] || return 1

  "$completion"

  printf '%s\n' "${COMPREPLY[@]}" | LC_ALL=C sort
}

__fzf_magic_completion__() {
  current="${READLINE_LINE}"
  local cmd="${FZF_CTRL_T_COMMAND:-"__get_completions $current \\\ "}"
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
    printf '%q ' "$item"
  done
  echo
}

fzf_magic_completion-widget() {
  local selected="$(__fzf_magic_completion__)"
  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
  READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

  if [ $BASH_VERSINFO -gt 3 ]; then
    bind -x '"\C-l": "fzf_magic_completion-widget"'
  else
    bind '"\C-l": "\C-x\C-a$a \C-x\C-addi`__fzf_magic_completion__`\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'
  fi
fi
