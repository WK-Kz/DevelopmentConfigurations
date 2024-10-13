[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export EDITOR=vim

HISTSIZE=10000
SAVEHIST=10000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Specific bind
vzf() {
  vim $(fzf --preview='cat {}')
}

export FZF_DEFAULT_OPTS="--height=80% --layout=reverse --info=inline --border --margin=1 --padding=1"
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"
export BAT_THEME="gruvbox-dark"
# 1. Search for text in files using Ripgrep
# 2. Interactively restart Ripgrep with reload action
# 3. Open the file in Vim
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "

rgfzf() {
  INITIAL_QUERY="${*:-}"
  fzf --ansi --disabled --query "$INITIAL_QUERY" \
    --bind "start:reload:$RG_PREFIX {q}" \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
    --delimiter : \
    --preview 'bat --color=always {1} --highlight-line {2}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --bind 'enter:become(vim {1} +{2})'
}
