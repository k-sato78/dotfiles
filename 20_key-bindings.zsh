#--------------------key-bindings--------------------------------
# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward


#pecp
#function peco-history-selection() {
#    BUFFER=`\\history -n 1 | tac | awk '!a[$0]++' | peco`
  #  CURSOR=$#BUFFER
 #   zle reset-prompt
#}

#zle -N peco-history-selection
#bindkey '^R' peco-history-selection
#-----------------------------EoF-----------------
