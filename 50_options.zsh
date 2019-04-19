# 同じコマンドをヒストリに保存しない
setopt hist_ignore_all_dups
 # 無駄なスペースを消してヒストリに保存する
setopt hist_reduce_blanks
 # ヒストリを共有
setopt share_history
# 補完候補を一覧を表示
setopt auto_list
#cdpath
setopt AUTO_CD
cdpath=(
/Users/k.sato/.config/nvim
~
~/BOX
~/git
)
# コマンドラインの引数でも補完を有効にする（--prefix=/userなど）
setopt magic_equal_subst

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# auto_pushdで重複するディレクトリは記録しない
setopt pushd_ignore_dups
# C+dでログアウトしないようにする
setopt IGNOREEOF
