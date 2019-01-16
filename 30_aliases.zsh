alias ks='ls'
alias tg='git browse tcazlabo/RESULTS'
alias mn='memo n'
alias m='memo'
alias me='memo e'
alias md='memo d'
alias ml='memo l'
alias mg='memo d'
alias sz='source ~/.zshrc'
alias c3270="TERM=xterm c3270 -defaultfgbg"
alias sed='gsed'
alias soz='source ~/.zshrc'
alias pwdc='pwd|pbcopy;pwd'
# alias pwd='pwd |pbcopy'
alias bfs='sh ~/ShellScript/BFSAuth.sh %% sh ~/ShellScript/BFSAuth.sh'
alias mkr='sh ~/ShellScript/mkrep.sh'
#alias epa='c3270 9.188.216.204'
# alias epb='c3270 9.188.216.205'
alias mqm1='ssh -l mqm 192.168.56.101'
alias mqm2='ssh -l mqm 192.168.56.102'
alias mqm3='ssh -l mqm 192.168.58.101'
alias -g G='| grep'
alias mqm4='ssh -l mqm 192.168.60.101'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'
alias -g C='| cat'
alias vi='nvim'
alias so='source'
#alias vim='nvim'
alias mk='mkdir -p'
alias to='touch'
alias rm='rm -ir'
alias cp='cp -i'
alias mv='mv -i'
alias lst='gls --color=auto -ltr'
alias ls='gls --color=auto'
alias l='gls --color=auto -ltra'
alias la='gls --color=auto -a'
alias ll='gls --color=auto -l'
alias o='open'
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract


alias al='vi ~/dotfiles/30_aliases.zsh'
alias zshrc='vi ~/.zshrc'
alias epa='ssh epa'
alias -g G='| grep'
# mkdirとcdを同時実行
function mkc() {
  if [[ -d $1 ]]; then


    echo "$1 already exists!"
    cd $1
  else
  mkdir -p $1 && cd $1
  fi
}
alias t="tmuximum"
alias tmux='tmux -u'

#shhpass
#
#
alias aix="~/ShellScript/ssh-change-profile-aix.sh"
# USS command for eplex type A

alias sdsf='sdsf.sh'
alias tsocmd='tsocmd.sh'
alias pepa='pepa.sh'
alias ssh='~/ShellScript/ssh-change-profile.sh'

# USS command for eplex type A

alias sdsf='sdsf.sh'
alias tsocmd='tsocmd.sh'
alias pepa='pepa.sh'
alias ssh='~/ShellScript/ssh-change-profile.sh'
