# zsh docs: http://zsh.sourceforge.net/Doc/Release/zsh_toc.html#SEC_Contents

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local ret_status="%(?:%{$fg[green]%}:%{$fg[red]%})"
PROMPT='%{$fg[yellow]%}%~$(git_prompt_info)%{${ret_status}%} →%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" ["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"


