# Path to your oh-my-zsh installation.

#export ZSH=$HOME/.oh-my-zsh
export ZSH=/home/kausus/src/zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#default theme
#ZSH_THEME="robbyrussell"

function my_rand_theme() {
    length=$(ls $ZSH/themes/*theme | wc -l)
    rand=$(( 1 +  $RANDOM % $length))
    theme=$(ls --color=never $ZSH/themes/*theme |  sort | tad $rand)
    theme=${theme%%.zsh-theme}
    theme=$(basename $theme)
    echo $theme
}

#setopt 
setopt kshglob
setopt zle
setopt rcquotes
setopt csh_null_glob
setopt extendedglob

autoload -U zmv
alias mmv='noglob zmv -W'

#random theme
export ZSH_THEME="frisk"
#export ZSH_THEME=$(my_rand_theme)


# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#plugins
plugins=(git)
plugins=(archlinux)
plugins=(cabal)
plugins=(dircycle)

# funktioniert nicht
plugins=(colorize)
#plugins=(command-not-found)
#plugins=(compleat)

plugins=(cp)
plugins=(extract)


###TODO: finde möglichkeit beide zu benuten, einerseits mit dirhistory mit alt+pfeiltasten durch den cd stack zu springen, und anderseits, beim arbeiten bzw dem öffnen einer neuen shell, das diese den selben path hat wie die ursprüngliche
#plugins=(dirhistory)
#conflict with dirhistory plugin
plugins=(last-working-dir)

#TODO: noch nicht verstanden
#plugin=(per-directory-history)

#help for python interpreter
# finde alle möglichkeiten dieses plugins
plugin=(python)

#systemd aliase
plugin=(systemd)

#TODO: terminitor
#plugin=(terminitor)

#TODO: funktioniert nicht
#plugin=(urltools)

#TODO: funktioniert nicht
#plugin=(web-search)



# User configuration

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:.
export PROMPT_COMMAND='history -a'
export HISTCONTROL="ignorespace"
export EDITOR="emacs"
export TEXDOC=/usr/local/share/texmf/doc/latex
export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
export SRC='/home/kausus/src'
export BACKGROUNDS='/usr/share/backgrounds/xfce'

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=de_DE.UTF-8
export MAIL="julian.seipel@stud.uni-regensburg.de"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mv'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#alias -g xp=' | xargs '
alias -g X=' | xargs '
alias -g ~='/home'
alias -g →=' | '
#alias -g '::'='echo bla'

#alias -g alias='echo bla'
#alias -g '('='echo ba'

alias ls='ls --color'						   
alias cp='cp -aiv'						   
alias grep='grep --color=never'				   
alias tgz='tar -pczf'						   
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'   
#alias emacs='emacs -nw'						   
alias pacman='sudo pacman'
alias python='python3.5'
alias xterm='xterm -rv'
alias atril='atril -f'
alias ac='acpi'
alias jobs='jobs -l'
alias rm='rm -I'
alias cat='cat -v'
alias look='look -f'
alias df='df -h'
alias lc='clear ; ls'
alias  NN='> /dev/null'
alias td='texdoc'
alias æ='mupdf'
alias €='fbpdf'
alias ſ='systemctl poweroff'
alias ł='wget'
alias slitherlink='loopy'

alias sysreset="sudo systemctl daemon-reload ; sudo systemctl reset-failed"
#probleme da falls man mkdir L schreibt wird kein ordner mit dem namen
#L erstellt
alias -g L='| less'
#versuche lösung
#alias  less='| less'
#andere möglichkeit für eine pip bzw alias

alias ls1='ls -t | head -1'
alias stud='cd /home/kausus/documents/studium/'
alias bach='cd /home/kausus/documents/studium/bachelorarbeit/code'
#alias news='firefox www.heise.de/tp www.rivva.de www.blog.fefe.de'


###################################################################################

function mkcd () {
	 mkdir -p "$1" &&   cd "$1"								 
}									 
function an () {
    amixer sset Master unmute
}

function aus () {
    amixer sset Master mute
}

function netz () {
	 dig google.com
}	 

function filler () {
    echo "####################################################################################"
}

#TODO: verwende farben, siehe in den themes definitionen, bzw verwende fg_bold
function pacref () {
    echo "pacman reference"
    filler
    echo "pacin \tInstall specific package(s) from the repositoriesry\n
pacins\tInstall specific package not from the repositories but from a file\n
pacre\tRemove the specified package(s), retaining its configuration(s) and required dependencies\n
pacrem\tRemove the specified package(s), its configuration(s) and unneeded dependencies\n
pacrep\tDisplay information about a given package in the repositories\n
pacreps\tSearch for package(s) in the repositories\n
pacloc\tDisplay information about a given package in the local database\n
paclocs\tSearch for package(s) in the local database\n
pacupd\tUpdate and refresh the local package and ABS databases against repositories\n
pacupg\tUpdate the local database and upgrade packages\n
pacinsd\tInstall given package(s) as dependencies of another package\n
pacmir\tForce refresh of all package lists after updating /etc/pacman.d/mirrorlist\n" | less
}

function bunt () {
    echo "bunt"
}





# schreibe wie folgt ein array
# array=(a b c  adsjföka bla)


###code beispiel
#for dir in ${dirs_to_cleanup}; do
#  if [[ -d "${dir}/${ORACLE_SID}" ]]; then
#    log_date "Cleaning up old files in ${dir}/${ORACLE_SID}"
#    rm "${dir}/${ORACLE_SID}/"*
#    if [[ "$?" -ne 0 ]]; then
#      error_message
#    fi
#  else
#    mkdir -p "${dir}/${ORACLE_SID}"
#    if [[ "$?" -ne 0 ]]; then
#      error_message
#    fi
#  fi
#done

##TODO: verstehen was diese snippets tun
# typeset -Ag FX FG BG


# deklariere Array, und anderes zeugs
typeset -Ag Array
# Ausgabe verstehen
for i in {0..10}; do
   Array[$i]=$i
done

#TODO: was bedeutet der inhalt der variable ZSH_SPECTRUM_TEXT
#src/zsh/oh-my-zsh/lib/spectrum.zsh

#TODO: suche emacs highlighting für zsh skripte



export HS_PARSEC=/home/kausus/documents/haskellref/parsec-3.1.8/
export BIN="/usr/local/sbin/"
export SNIPPETS="$HOME/src/zsh/oh-my-zsh/snippets.zsh"
# second prompt
export PS2="$fg[blue]#  "
#in einer konsole alt+x drücken, was macht der execute ausdruck

#benutzung von xclip
#xclip -sel clip < file
alias -s tex=gedit
alias -s .size=withoutPoint

withoutPoint () {
    foo=$(withoutPoint.py $1)
    du -s $foo
    }

#
pid2 () {
    local i
    for i in /proc/<->/stat
    do
	[[ "$(< $i)" = *\((${(j:|:)~@})\)* ]] && echo $i:h:t
    done
}


# printet die gesamte breite eines terminals mit # zeichen voll
komm () {
    #for i in {1..$COLUMNS} ; do echo '#' ; done | tr -d "\n"
    # besser
    echo ${(l:$COLUMNS::#:)}
    # oder auch durch haskell programm
}

function makels() {
    lc
}




bindkey "^u" backward-kill-line
zle -N makels
bindkey "^f" makels

#try , echo !!<space>
bindkey ' ' magic-space

x-copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | xsel -i
}
zle -N x-copy-region-as-kill
x-kill-region () {
  zle kill-region
  print -rn $CUTBUFFER | xsel -i
}
zle -N x-kill-region
x-yank () {
  CUTBUFFER=$(xsel -o -p </dev/null)
  zle yank
}
zle -N x-yank
bindkey -e '\eW' x-copy-region-as-kill
bindkey -e '^W' x-kill-region
bindkey -e '^Y' x-yank


unset TMUX

#x-read () {
#    pdf=$(xsel -o -p </dev/null)
#    cd /tmp ; wget $pdf
#}
#zle -N x-read
#bindkey -e '^A' x-read



#######
################:(){ :|: & };: 
########
