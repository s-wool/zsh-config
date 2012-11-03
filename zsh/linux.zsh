case "${OSTYPE}" in
  linux*)
    #color
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

    #alias
    alias ls='ls --color'
    alias ls='ls lah --color'
    ;;
  *)
esac
