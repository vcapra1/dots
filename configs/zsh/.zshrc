########################################################################
############################# Powerlevel10k ############################
########################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

########################################################################
############################### ZSH setup ##############################
########################################################################

autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search
compinit
promptinit

if [[ $(tty) =~ "/dev/tty*" ]]; then
    # TTY
    prompt adam2
else
    # X Terminal
    export TERM="xterm-256color"

    # Enable Powerlevel10k
    export LANG=en_US.utf-8
    source ~/powerlevel10k/powerlevel10k.zsh-theme
    source /home/vinnie/.fonts/*.sh
fi

# Enable Powerline
#powerline-daemon -q
#. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
#

# Remove space from right side of right prompt so it is flush with right side of terminal
export ZLE_RPROMPT_INDENT=0

# Enable spell check
set spell

########################################################################
########################## Directory History ###########################
########################################################################

DIRSTACKSIZE=20
setopt autopushd pushdminus pushdsilent pushdtohome

########################################################################
############################ Autocompletion ############################
########################################################################

# Use arrow keys to control autocompletion
zstyle ':completion:*' menu select

# Allow autocompletion with sudo
zstyle ':completion::complete:*' gain-privileges 1

# Let aliases be autocompleted as well
setopt COMPLETE_ALIASES

# Enable autocorrection
#setopt correct_all

# ZSH-Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=("history" "completion")
export ZSH_AUTOSUGGEST_USE_ASYNC="true"

########################################################################
############################## Keybindings #############################
########################################################################

# Clear any existing keybindings
bindkey -e

bindkey "^[[H" beginning-of-line # Home
bindkey "^[[F" end-of-line # End
bindkey "^[[1;5C" forward-word # Ctrl+right
bindkey "^[[1;5D" backward-word # Ctrl+left
bindkey "^[[3~" delete-char # Delete

########################################################################
############################ Command History ###########################
########################################################################

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

export HISTFILE="$HOME/.config/zsh/.zsh_history"
export SAVEHIST=10000000
export HISTSIZE=10000000
setopt HIST_IGNORE_SPACE

########################################################################
######################### Command-Line Aliases #########################
########################################################################

alias plz='sudo $(fc -ln -1)'
#alias ls="[ $(pwd) = \"/home/vinnie\" ] && exa -aalg --color=auto || exa -aalg --color=auto --git"
alias ls="exa -aalg --color=auto --git"
alias l="ls"
alias o="rifle"
alias dh='dirs -v'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias tree="exa -alg --color=auto --git --tree"
alias copy='xclip -i -selection clipboard'
alias grep="grep --color=auto"
alias gdb="gdb -q"
alias mongo="mongo --quiet"
alias objdump='objdump -Mintel'
alias cal="cal -m"
alias top="htop"
alias pstree="pstree -U"
alias shutdown="shutdown now"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias vim="nvim"
alias vi="nvim"
alias nvcc="nvcc --dont-use-profile -ldir /opt/cuda/nvvm/libdevice -I/opt/cuda/include -L/opt/cuda/lib64 --compiler-bindir /opt/cuda/bin"
alias r2d="r2 -e dbg.profile=dbg.rr2 -d "
alias ncdu="ncdu --color dark"
alias gradlew="./gradlew"
#alias grep="rg"
#alias msfconsole="msfconsole -x \"db_connect ${USER}@msf\""
alias diff='diff --color=auto'
alias redshift='redshift -PO 6500'
alias cvsbad='rm .*/CVS -rf **/CVS'
alias arduino='arduino-cli'
alias arduion='arduino'
alias github='x=$(git remote get-url origin) && chromium $x > /dev/null 2> /dev/null &!'
alias fd="fd --no-ignore-vcs"
alias lscan="python2 /home/vinnie/lscan/lscan.py"
alias new="terminator"
alias column="$HOME/Projects/column-rs/target/release/column-rs"
alias urldecode='sed "s@+@ @g;s@%@\\\\x@g" | xargs -0 printf "%b"'
alias exiftool='exiftool -c "%.6f"'

# Because I can never remember this command
alias fixbt="echo \"pacmd set-card-profile card_number a2dp_sink\""

# Shortcuts to class folders
source $HOME/.config/zsh/classes

########################################################################
########################## Colorize Man Pages ##########################
########################################################################

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

########################################################################
############################# Miscellaneous ############################
########################################################################

source $HOME/.profile

# JUnit
export JUNIT_HOME="/etc/junit/"

# Opam
test -r /home/vinnie/.opam/opam-init/init.zsh && . /home/vinnie/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# NVM
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# SDKMAN!
export SDKMAN_DIR="/home/vinnie/.sdkman"
[[ -s "/home/vinnie/.sdkman/bin/sdkman-init.sh" ]] && source "/home/vinnie/.sdkman/bin/sdkman-init.sh"

# Rbenv
eval "$(rbenv init -)"

# Set bat theme
export BAT_THEME="OneDark"

# TeX Live
export MANPATH="$MANPATH:/usr/local/texlive/2019/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2019/texmf-dist/doc/info"

# GitHub GPG Key
export GPG_TTY=$(tty)

# To customize prompt, run `p10k configure` or edit ~/.config/zsh//.p10k.zsh.
[[ ! -f ~/.config/zsh//.p10k.zsh ]] || source ~/.config/zsh//.p10k.zsh
