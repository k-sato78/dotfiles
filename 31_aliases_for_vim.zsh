shopt -s expand_aliases
alias ll='ls -l'
alias zmv='noglob zmv -W'
alias mdt='pbpaste | mdt| pbcopy'
alias SL1032='py ~/ShellScript/python/SL1032.py'
alias SL103S='py ~/ShellScript/python/SL103S.py'
alias SL1K32='py ~/ShellScript/python/SL1K32.py'
alias python="python3"
alias py='python'
alias regdoc='cd ~/Box/TCAZ\ z2/z2\ リグレッションテスト/テスト記述書'
alias ghe='GITHUB_HOST=github.ibm.com git'
alias cr='eval `~/ShellScript/tcaz/CdTodaysRep.sh`'
alias workday='o https://wd5.myworkday.com/ibm/d/home.htmld'
alias g='hub'
alias c='c3270'
alias ks='ls'
alias gpom='git push origin master'
alias gp='git pull'
alias gcn='git commit --allow-empty-message'
alias ga='git add'
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
alias mkr='sh ~/ShellScript/tcaz/mkrep.sh'
alias t='sh ~/ShellScript/tcaz/tel.sh'
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
alias -g P='| pbcopy'
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
alias tm="tmuximum"
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
function tg() {
export GITHUB_HOST=github.ibm.com
hub browse tcazlabo/RESULTS
unset GITHUB_HOST
}

# tr() {
# YearMonth=$(date +%y%m)
# Day1="$(date +%d)-z2"
# Day2="$(date +%d)-j3"
#
#
#
# if [ -d ~/git/RESULTS/$YearMonth/$Day1/ ]; then
#
# 	source CdTodaysRep1.sh
#
# elif [ -d "~/git/RESULTS/$YearMonth/$Day2/" ]; then
#
#
# 	source CdTodaysRep2.sh
#
# else
# 	cd ~/git/RESULTS/
# 	git pull
#
# if [ -d "~/git/RESULTS/$YearMonth/$Day1/" ]; then
#
# 	source CdTodaysRep1.sh
#
# elif [ -d "~/git/RESULTS/$YearMonth/$Day2/" ]; then
#
#
# 	source CdTodaysRep2.sh
# fi
# fi
# }
