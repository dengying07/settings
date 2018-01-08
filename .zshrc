source "${HOME}/.zplug/init.zsh"

zplug 'b4b4r07/enhancd', use:'init.sh'

zplug 'junegunn/fzf', use:'shell/*.zsh'
zplug 'junegunn/fzf-bin', from:'gh-r', as:'command', rename-to:'fzf'

zplug 'mafredri/zsh-async'

zplug 'sindresorhus/pure', on:'mafredri/zsh-async'
PURE_PROMPT_SYMBOL='$'
PURE_GIT_DOWN_ARROW='↑'
PURE_GIT_UP_ARROW='↓'

zplug 'so-fancy/diff-so-fancy', as:command

zplug 'zsh-users/zsh-autosuggestions', defer:3
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug load


bindkey -e

bindkey "${terminfo[kdch1]}" delete-char
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() {
        echoti smkx
    }
    function zle-line-finish() {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

setopt INTERACTIVE_COMMENTS NOMATCH NOTIFY

alias ..='\cd ..'
alias ...='\cd ../..'
alias ....='\cd ../../..'
alias .....='\cd ../../../..'

alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'
alias cl='clear'
alias fg='fg %'
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias l='ls -1A'
alias ll='ls -lh'
alias la='ll -a'

alias ee='emacs -nw'
alias arc='/home/phab/bin/arc'
alias cppcheck='/opt/swt/bin/cppcheck'
alias collect='/opt/SUNWspro12/bin/collect'

# training
alias make='~hcaine1/bin/colourmake'
#alias lof='~hcaine1/bin/lof'
#alias llof='~hcaine1/bin/llof'
#alias tlof='~hcaine1/bin/tlof'
#alias colourbal='~hcaine1/bin/colourbael'
alias plink='~hcaine1/bin/colourplink'
#alias colourrc='~hcaine1/bin/colourrc'
#alias cdiff='~hcaine1/bin/cdiff'

# bb specific
alias hist='ls -l /proc/self/fd' # see last 3 command run history
alias usage='fsusage'
alias renew='kinit'

export EDITOR="emacs -nw"

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY_TIME

for dir (~ ~/$(uname)/*(/N)); do
    if [[ ${PATH} != *${dir}/bin* ]]; then
        [[ -d ${dir}/bin ]] && export PATH=${dir}/bin:${PATH}
        [[ -d ${dir}/share/man ]] && export MANPATH=${dir}/share/man:${MANPATH}
    fi
done

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

alias dsf='git dsf --no-index'

# jump around directories https://github.com/rupa/z
# source ~/fun/z_dir/z.sh
