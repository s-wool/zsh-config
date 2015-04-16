autoload -U compinit
compinit

export LANG=ja_JP.UTF-8

autoload colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

PROMPT="%{[37m%}[%n@%m]%(!.#.$) %{[m%}"
PROMPT2="%{[37m%}%_%%%{[m%} "
SPROMPT="%{[37m%}%r is correct? [n,y,a,e]:%{[m%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
RPROMPT="%{[37m%}[%~]%{[m%}"

#ブランチ名表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"$RPROMPT

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#alias
alias gs='git status'
alias gdc='git diff --cached'

#ディレクトリスタック
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

ZSHHOME="${HOME}/.zsh"

if [ -f $ZSHHOME/os.zsh ]; then
  source $ZSHHOME/os.zsh
fi

if [ -f $ZSHHOME/local.zsh ]; then
  source $ZSHHOME/local.zsh
fi

case "${TERM}" in
# for emacs tramp setting
dumb | emacs)
  PROMPT="%n@%~%(!.#.$)"
  RPROMPT=""
  PS1='%(?..[%?])%!:%~%# '
# for tramp to not hang, need the following. cf:
# http://www.emacswiki.org/emacs/TrampMode
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  #unfunction preexec
  ;;
esac

setopt transient_rprompt
