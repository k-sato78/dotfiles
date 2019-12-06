!/bin/bash

# 入力があるまで無限ループ
# while true ;  do
#
#  # 入力があるまで無限ループ
# while true ;  do
#
#         # キーワード入力を促す部分
# echo input Command File Path
#
#         # 標準入力からキーワードを読み込むコマンド (read) => 変数KEYWORDに格納される
#         read CFP
#
#         # 変数KEYWORDが空文字なら無限ループする
#         if [ "${CFP}" = "" ];then
# 						echo "write Command File Path,if you don't want,press ctr+c"
#                 # ループの先頭に戻る
#                 continue
#         fi
#
#         # 入力があった場
#
# while true;do
# 	echo "File Name is ${CFP}.(y/n)"
#    read answer
#
#     case $answer in
#         y*)
#
#

NAME=$1
FILE=${NAME%.*}
FILE_NAME=${FILE##*/}.txt

while read line
do
	 if [ $(echo $line | grep -e '-') ]; then
		FIRST=$(echo $line|cut -c 1-4)
		LAST=$(echo $line |cut -c 6-9)
     echo $FIRST
		 echo $LAST
    FIRST10=$(echo "obase=10;ibase=16;$FIRST" | bc)
		LAST10=$( echo "obase=10;ibase=16;$LAST" | bc)
		echo "$FIRST10 first"
		echo $LAST10
		i=$FIRST10
		 while [ $i -le $LAST10 ]
		 	do
		 		echo 'here'
				FIRST10s=$(($FIRST10+$i-$FIRST10))
				echo $FIRST10s
				echo "obase=16;ibase=10;$FIRST10s" | bc >> ~/memo/$FILE_NAME
		 		i=$((i+1))
		 	done
	else
		echo $line >> ~/memo/$FILE_NAME

  fi
	done < $1


# echo "${FILE}"
# echo "${CFP}"
# echo "./${FILE_NAME} is created."
# 				break
# 				;;
#         n*)
# 						continue 3
# 						;;
#         *)
#             echo  "cannot understand $answer.\n"
#             ;;
#
#
# esac
# done
# break
# done
# break
# done
