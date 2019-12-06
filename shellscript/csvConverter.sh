#!/bin/bash

# 入力があるまで無限ループ
while true ;  do

        # キーワード入力を促す部分
echo input Queue Mamager Name

        # 標準入力からキーワードを読み込むコマンド (read) => 変数KEYWORDに格納される
        read QMN

        # 変数KEYWORDが空文字なら無限ループする
        if [ "${QMN}" = "" ];then
						echo "write Queue Mamager Name,if you don't want,press ctr+c"
                # ループの先頭に戻る
                continue
        fi
 # 入力があるまで無限ループ
while true ;  do

        # キーワード入力を促す部分
echo input Command File Path

        # 標準入力からキーワードを読み込むコマンド (read) => 変数KEYWORDに格納される
        read CFP

        # 変数KEYWORDが空文字なら無限ループする
        if [ "${CFP}" = "" ];then
						echo "write Command File Path,if you don't want,press ctr+c"
                # ループの先頭に戻る
                continue
        fi

        # 入力があった場

while true;do
	echo "QMname is ${QMN},Command File Name is ${CFP}.(y/n)"
   read answer

    case $answer in
        y*)


NAME=$(basename ${CFP})
FILE=$(echo $NAME | sed  's/\.[^\.]*$//' )
FILE_NAME=${FILE##*/}_CSV.csv
#echo "変更前"
#cat $1
#echo "変更後"
runmqsc ${QMN} < $NAME|sed -e '1,6d' -e 's/(/,/g' -e 's/)/\'$'\n/g' -e 's/ //g' | sed -e '/^$/d' | sed -e '$d'| sed -e '$d'| sed -e '$d' | sed -e 's/^AMQ.*/ /g' > ./$FILE_NAME
echo "Converted."

# echo "${FILE}"
# echo "${CFP}"
# echo "./${FILE_NAME} is created."
				break
				;;
        n*)
						continue 3
						;;
        *)
            echo  "cannot understand $answer.\n"
            ;;


esac
done
break
done
break
done
