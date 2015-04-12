case "${OSTYPE}" in
  linux*)
    #color
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

    #alias
    alias ls='ls --color'
    alias l='ls -lah --color'
    ;;
  cygwin*)
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color'
    alias lah='ls -lah --color'
    ;;
  darwin*)
    #color
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export TERM='xterm-256color'

    #alias
    alias ls='ls -G'
    alias ll='ls -lG'
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

    #path
    PATH=/opt/local/bin:$PATH
    MANPATH=/opt/local/share/man:$MANPATH
    ;;
  *)
esac
