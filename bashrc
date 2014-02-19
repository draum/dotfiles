C_DEFAULT="\[\033[m\]"
C_BLACK="\[\033[30m\]"                        # base02
C_RED="\[\033[31m\]"                        # red
C_GREEN="\[\033[32m\]"                        # green
C_YELLOW="\[\033[33m\]"                        # yellow
C_BLUE="\[\033[34m\]"                        # blue
C_MAGENTA="\[\033[35m\]"                # magenta
C_CYAN="\[\033[36m\]"                        # cyan
C_WHITE="\[\033[37m\]"                        # base2
C_BRBLACK="\[\033[1;30m\]"                # base03
C_BRRED="\[\033[1;31m\]"                # orange
C_BRGREEN="\[\033[1;32m\]"                # base01
C_BRYELLOW="\[\033[1;33m\]"                # base00
C_BRBLUE="\[\033[1;34m\]"                # base0
C_BRMAGENTA="\[\033[1;35m\]"        # violet
C_BRCYAN="\[\033[1;36m\]"                # base1
C_BRWHITE="\[\033[1;37m\]"                # base3
# Background colors (No bright versions, not supported :()
C_BG_BLACK="\[\033[40m\]"                # base02
C_BG_RED="\[\033[41m\]"                        # red
C_BG_GREEN="\[\033[42m\]"                # green
C_BG_YELLOW="\[\033[43m\]"                # yellow
C_BG_BLUE="\[\033[44m\]"                # blue
C_BG_MAGENTA="\[\033[45m\]"                # magenta
C_BG_CYAN="\[\033[46m\]"                # cyan
C_BG_WHITE="\[\033[47m\]"                # base2
_path_add() {
    # Adds a directory to $PATH, but only if it isn't already present.
    # http://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there/39995#39995
    if [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}
_dir_chomp () {
    # Shortens the working directory.
    # First param is pwd, second param is the soft limit.
    # From http://stackoverflow.com/questions/3497885/code-challenge-bash-prompt-path-shortener/3499237#3499237
    # which asks for the shortest solution in characters, explaining the complete lack of readability or clarity.
    local IFS=/ c=1 n d
    local p=(${1/#$HOME/\~}) r=${p[*]}
    local s=${#r}
    while ((s>$2&&c<${#p[*]}-1))
    do
        d=${p[c]}
        n=1;[[ $d = .* ]]&&n=2
        ((s-=${#d}-n))
        p[c++]=${d:0:n}
    done
    echo "${p[*]}"
}
_command_exists() {
    type "$1" &> /dev/null ;
}
_set_exit_color() {
    if [[ $? != "0" ]]; then EXITCOLOR=$C_RED; else EXITCOLOR=$C_GREEN; fi
}
_set_title() {
        echo -ne "\033]2;$1\007"
}

# If this is a non-interactive shell, return
if [[ $- != *i* ]]
then
  return
fi

# Environment variables for interactive shells
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export GIT_PS1_SHOWUPSTREAM="verbose"

# Make sure we have a UTF-8 locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Turn off ctrl+s
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef


# Show the fortune while we set up other things
if _command_exists fortune && [ "$TERM_PROGRAM" != "DTerm" ]; then
        fortune
        echo
fi

if _command_exists dircolors; then
    eval `dircolors --bourne-shell ~/.dircolors`
fi
if _command_exists rbenv; then
        eval "$(rbenv init -)"
fi