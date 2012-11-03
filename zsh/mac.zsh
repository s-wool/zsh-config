case "${OSTYPE}" in
  darwin*)
    #color
    export LSCOLORS=gxfxcxdxbxegedabagacad

    #alias
    alias ls='ls -G'
    alias l='ls -lahG'
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

    #python
    [[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

    VIRTUALENVWRAPPER_PYTHON=$HOME/.pythonbrew/pythons/Python-2.7.3/bin/python
    source $HOME/.pythonbrew/pythons/Python-2.7.3/bin/virtualenvwrapper.sh

    #path
    PATH=/opt/local/bin:$PATH
    MANPATH=/opt/local/share/man:$MANPATH
    ;;
  *)
esac