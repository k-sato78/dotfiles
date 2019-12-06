#!/usr/local/bin/zsh

# ssh epa /u/mqm009/rexx/sdsf.rex "$1"
# a=$1

# a="'$1'"

# b=sed "$a   -e "s/(/\\(/g"|sed -e "s/)/\\)/g"1


 ssh epa /u/mqm009/rexx/sdsf.rex "'$1'"

 # ssh epa /u/mqm009/rexx/sdsf.rex "${a[*]}"
