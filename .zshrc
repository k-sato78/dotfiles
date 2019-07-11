# INTERNAL UTILITY FUNCTIONS {{{1

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# Returns whether the given statement executed cleanly. Try to avoid this
# because this slows down shell loading.
_try() {
  return $( eval $* >/dev/null 2>&1 )
}

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() {
  return $( [ "$HOSTTYPE" = "$1" ] )
}

# Returns whether out terminal supports color.
_color() {
  return $( [ -z "$INSIDE_EMACS" ] )
}
# PATH MODIFICATIONS {{{1

# Functions which modify the path given a directory, but only if the directory
# exists and is not already in the path. (Super useful in ~/.zshlocal)

_prepend_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}

_append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($path $1);
  fi
}

_force_prepend_to_path() {
  path=($1 ${(@)path:#$1})
}

#OS
case ${OSTYPE} in
    darwin*)
        #ここにMac向けの設定
	# zplug settings
	# export ZPLUG_HOME=/usr/local/opt/zplug
	# source $ZPLUG_HOME/init.zsh
	#PATH
  export PATH=~/ShellScript:$PATH
  export PATH=~/ShellScript/zos:$PATH
  export PATH=~/ShellScript/tcaz:$PATH
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export PYTHONPATH=python3:pip3
  export PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
	export PATH=~/go/bin:$PATH
  export PATH=/usr/local/Cellar/git/2.19.1/bin/:$PATH
  export PATH=~/git/toolsmac/:$PATH
	export HOMEBREW_PREFIX='/usr/local'
	#tmuximum

# zplug "arks22/tmuximum", as:command

	;;
    linux*)
# zplug settings
# export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
# source $ZPLUG_HOME/init.zsh
 export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
 export MANPATH="$MANPATH:/home/linuxbrew/.linuxbrew/share/man"
 export INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info"
 export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
 export HOMEBREW_PREFIX="${HOME}/.linuxbrew"
 ;;
esac
#stty バックスペース有効化
stty erase "^?"
#PATH
  export PATH=~/dotfiles/shell:$PATH
  # export PATH=/Users/k.sato/git/toolsmac:$PATH
  export XDG_CONFIG_HOME=~/.config
  export XDG_CONFIG_HOME=~/.config
  export XDG_CACHE_HOME=~/.cache
# fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_ALT_C_OPTS="--select-1 --exit-0"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--bind=tab:down,shift-tab:up"
export EDITOR=nvim
# FZF {{{1

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

if _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
fi

# SOURCE LOCAL CONFIG {{{1

if [ -e ~/.zshlocal ]; then
  . ~/.zshlocal
fi

# }}} Done.
zmodload zsh/zpty
# zplugin をロードします。
autoload -Uz compinit -C
. "${HOME}/.zplugin/bin/zplugin.zsh"
# zplugin のコマンド補完をロードします。
autoload -Uz _zplugin

# プラグインが使うコマンドをこのタイミングで autoload しておきます。
autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz chpwd_recent_dirs

if [[ "${+_comps}" == 1 ]]
then
  _comps[zplugin]=_zplugin
fi
# zplugin: Utilities {{{
# OS間のクリップボードの差異を吸収するコマンドを定義する oh-my-zsh のスニペットをロードします。
zplugin snippet 'OMZ::lib/clipboard.zsh'
# zplugin snippet "${HOME}/.zsh/rc/10_utilities.zsh"
# fzf を利用した補完のキーバインドを設定するスニペットをロードします。
# Homebrew で fzf がインストールされている、かつ HOMEBREW_PREFIX に Homebrew のプリフィックスが格納されていることが前提です。
zplugin snippet "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"
# zplugin: Plugins {{{

# djui/alias-tips {{{
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='alias-tips: '
# }}}

# fzf で絵文字を検索&入力ためのプラグインです。
zplugin light 'b4b4r07/emoji-cli'
# 利用可能なエイリアスを使わずにコマンドを実行した際に通知するプラグインです。
zplugin light 'djui/alias-tips'
# fzf を使ったウィジェットが複数バンドルされたプラグインです。
zplugin light 'mollifier/anyframe'
# 作業中のGitのルートディレクトリまでジャンプするコマンドを定義するプラグインです。
# cd-gitroot コマンドをエイリアスで U に割り当てています。
zplugin light 'mollifier/cd-gitroot'
# tmux のウィンドウを作業中のGitレポジトリ名に応じて自動的にリネームしてくれるプラグインです。(自分で作った)
zplugin light 'sei40kr/zsh-tmux-rename'
# ls よりも使いやすく見やすいディレクトリの一覧表示のコマンドを定義するプラグインです。
zplugin ice pick'k.sh'
zplugin light 'supercrabtree/k'

# 作業ディレクトリに .env ファイルがあった場合に自動的にロードしてくれます。
zplugin snippet 'OMZ::plugins/dotenv/dotenv.plugin.zsh'
# コマンド入力待ち状態から control-Z で suspend したプロセスに復帰するキーバインドを設定するプラグインです。
zplugin snippet 'OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh'
# Gitの補完と大量のエイリアスを定義するプラグインです。
# エイリアスは重宝するものが多く、Gitを使うユーザーには必ずオススメしたいプラグインです。
zplugin snippet 'OMZ::plugins/git/git.plugin.zsh'
# GitHub のレポジトリを管理するためのコマンドを定義するプラグインです。
zplugin snippet 'OMZ::plugins/github/github.plugin.zsh'
# 非GNU系OSにインストールしたGNU系ツールをプリフィックスなしで使えるようにするプラグインです。
zplugin snippet 'OMZ::plugins/gnu-utils/gnu-utils.plugin.zsh'
# .zshrc を zcompile してロードしてくれる src コマンドを定義するプラグインです。
zplugin snippet 'OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh'
# }}}

# zplugin: Commands {{{
# Go で書かれたツール群を並列ダウンロード&ビルド&インストールしてくれます。
zplugin ice from'gh-r' as'command' mv'gotcha_* -> gotcha'
zplugin light 'b4b4r07/gotcha'

# (省略)

# mosh や ssh でリモートのシェルに自分の rc ファイルをロードします。
zplugin snippet --command \
    'https://raw.githubusercontent.com/Russell91/sshrc/master/moshrc'
zplugin snippet --command \
    'https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc'
# git diif や tig の可読性をより良くします。(要設定)
# Homebrew で git をインストールしていること、 `HOMEBREW_PREFIX` に Homebrew のプリフィックスが格納されている前提です。
# zplugin snippet --command \
    # "${HOMEBREW_PREFIX}/share/git-core/contrib/diff-highlight/diff-highlight"
# }}}

# zplugin: Completions {{{
# プラグインの中に含まれているコマンド補完のみを zplugin で管理します。
# 想定された zplugin の使い方ではないかもしれません。
zplugin ice pick''
zplugin light 'jsforce/jsforce-zsh-completions'
zplugin ice pick''
zplugin light 'zsh-users/zsh-completions'
# }}}

compinit
zplugin cdreplay -q

# zplugin: Plugins loaded after compinit {{{
# コマンドをハイライトするプラグインを遅延ロードします。
zplugin ice wait'1' atload'_zsh_highlight'
zplugin light 'zdharma/fast-syntax-highlighting'
# コマンドをサジェストするプラグインを遅延ロードします。
zplugin ice wait'1' atload'_zsh_autosuggest_start'
zplugin light 'zsh-users/zsh-autosuggestions'

# プロンプトのテーマを遅延ロードします。このプラグインのみロード完了後にプロンプトを再描画しています。
zplugin ice pick'spaceship.zsh' wait'!0'
zplugin light 'denysdovhan/spaceship-zsh-theme'
# }}}

# zplugin: Plugins loaded after compinit {{{
# コマンドをハイライトするプラグインを遅延ロードします。
zplugin ice wait'1' atload'_zsh_highlight'
zplugin light 'zdharma/fast-syntax-highlighting'
# コマンドをサジェストするプラグインを遅延ロードします。
zplugin ice wait'1' atload'_zsh_autosuggest_start'
zplugin light 'zsh-users/zsh-autosuggestions'
# プロンプトのテーマを遅延ロードします。このプラグインのみロード完了後にプロンプトを再描画しています。
zplugin ice pick'spaceship.zsh' wait'!0'
zplugin light 'agnoster/agnoster-zsh-theme'
# }}}

# Then, source plugins and add commands to $PATH
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
# autoload -U compinit; compinit -C
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

bindkey -e

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
        *.ZIP) unzip $1 ;;
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
case ${OSTYPE} in
    darwin*)

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
        ;;
esac
autoload -U promptinit; promptinit
# プロンプトを変更
prompt pure
#{{{cdr &peco
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
function peco-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^Z' peco-cdr
#}}}
#
#{{{ hub
 eval "$(hub alias -s)"
fpath=(~/.zsh/completions $fpath)
# autoload -U compinit && compinit
#}}}
#{{{
# zplugなどでzをインストールしとく

fzf-z-search() {
    local res=$(z | sort -rn | cut -c 12- | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}

zle -N fzf-z-search
bindkey '^f' fzf-z-search
#}}}
#{{{
#ls同時
function chpwd() { ls }
#}}}

### Added by Zplugin's installer
source '/Users/k.sato/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
