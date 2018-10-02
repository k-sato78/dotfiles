#OS
case ${OSTYPE} in
    darwin*)
        #ここにMac向けの設定
	# zplug settings
	export ZPLUG_HOME=/usr/local/opt/zplug
	source $ZPLUG_HOME/init.zsh
#PATH
  export PATH=~/ShellScript:$PATH
  export PATH=:~/ShellScript/zos:$PATH
  export PATH=$HOME/.nodebrew/current/bin:$PATH
				;;
    linux*)
# zplug settings
export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export MANPATH="$MANPATH:/home/linuxbrew/.linuxbrew/share/man"
export INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/linuxbrew/.linuxbrew/lib"
        ;;
esac


#PATH
  export PATH=~/dotfiles/shell:$PATH
  export XDG_CONFIG_HOME=~/.config
  export XDG_CACHE_HOME=~/.cache
# fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_ALT_C_OPTS="--select-1 --exit-0"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--bind=tab:down,shift-tab:up"

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# plugins
zplug "plugins/git", from:oh-my-zsh, lazy:true
zplug "zsh-users/zsh-autosuggestions", lazy:true
#zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
# zplug "powerline/powerline"
zplug "agnoster/agnoster-zsh-theme", from:github, as:theme
#zplug "yous/lime"
zplug 'zsh-users/zsh-completions', use:'src/_*', lazy:true
#tmuximum
zplug "arks22/tmuximum", as:command
# Theme
#if:"source ~/.powerlevel9k"
# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

# Then, source plugins and add commands to $PATH

zplug check --verbose || zplug install
zplug load
#history{{{
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=500000
# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
# }}}


#keybind load
source ~/dotfiles/20_key-bindings.zsh
#alias load
source ~/dotfiles/30_aliases.zsh
#option load
source ~/dotfiles/50_options.zsh
#option load
# Zshの拡張ライブラリのPATH設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完機能を有効にする
# autoload -Uz compinit && compinit -u
# 大文字小文字区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
### 補完
autoload -U compinit; compinit -C
# 補完メニューをカーソルで選択可能にする
# zstyle ':completion:*:default' menu select=1
### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
### 補完候補に色を付ける。
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both

### 補完候補
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
#zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' completer _complete _ignored

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
## 詳細な情報を使わない
zstyle ':completion:*' verbose no
# LS_COLORS
eval $(gdircolors ~/dotfiles/.dircolors/dircolors.256dark)

export LS_COLORS
# remove file mark
unsetopt list_types
#補完でカラーを使用する
autoload colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

#コマンドにsudoを付けても補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
#解凍
function extract() {
    case $1 in
        *.tar.gz|*.tgz) tar xzvf $1 ;;
        *.tar.xz) tar Jxvf $1 ;;
        *.zip) unzip $1 ;;
        *.lzh) lha e $1 ;;
        *.tar.bz2|*.tbz) tar xjvf $1 ;;
        *.tar.Z) tar zxvf $1 ;;
        *.gz) gzip -dc $1 ;;
        *.bz2) bzip2 -dc $1 ;;
        *.Z) uncompress $1 ;;
        *.tar) tar xvf $1 ;;
        *.arj) unarj $1 ;;
    esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

#cdls
#cd ()
#{
#    builtin cd "$@" && ls
#}



# 環境変数
#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8

#rename機能
autoload -U zmv

# PECO {{{
# peco
# function peco-history-selection() {
#     BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
#     CURSOR=$#BUFFER
#     zle reset-prompt
# }
#
# zle -N peco-history-selection
# bindkey '^R' peco-history-selection
#
#
# function peco-cdr () {
# 	    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
# 			    if [ -n "$selected_dir" ]; then
# 						        BUFFER="cd ${selected_dir}"
# 										        zle accept-line
# 					fi
# 											}
# 	zle -N peco-cdr
# bindkey '^E' peco-cdr
# # }}}
#always tmux
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
#tmux-pane-border
function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
		  else
    dir="%F{cyan}%K{black} %~ %k%f"
    if git_status=$(git status 2>/dev/null ); then
      git_branch="$(echo $git_status| awk 'NR==1 {print $3}')"
       case $git_status in
        *Changes\ not\ staged* ) state=$'%{\e[30;48;5;013m%}%F{black} ± %f%k' ;;
        *Changes\ to\ be\ committed* ) state="%K{blue}%F{black} + %k%f" ;;
        * ) state="%K{green}%F{black} ✔ %f%k" ;;
      esac
      if [[ $git_branch = "master" ]]; then
        git_info="%K{black}%F{blue}⭠ ${git_branch}%f%k ${state}"
      else
        git_info="%K{black}⭠ ${git_branch}%f ${state}"
      fi
    else
      git_info=""
    fi
  fi
}
autoload -U promptinit; promptinit
# プロンプトを変更
prompt pure
