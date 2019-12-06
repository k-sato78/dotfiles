#!/usr/local/bin/zsh

# 入力があるまで無限ループ
while true ;  do
 
        # キーワード入力を促す部分
echo input your password
 
        # 標準入力からキーワードを読み込むコマンド (read) => 変数KEYWORDに格納される
        read Password

        # 変数KEYWORDが空文字なら無限ループする
        if [ "${Password}" = "" ];then
						echo "write your password,if you don't want,press ctr+c"
                # ループの先頭に戻る
                continue
        fi
 
        # 入力があった場








while true;do
echo "password is ${Password},is it okay?[y/n]"
   read answer

    case $answer in
        y*)

#echo ${Password} | openssl rsautl -encrypt -inkey ~/.ssh/id_rsa > ~/ShellScript/BFSssl.txt 


#echo "curl http://9.188.216.169/-H \

AUTH1="AHA05078@jp.ibm.com:${Password}"
#echo $AUTH1>!./temp.txt
PASS1=$(echo -n $AUTH1 | base64)
#echo $PASS

echo "curl http://9.188.216.169/ -H \"Authorization: Basic $PASS1\"" >! ~/ShellScript/BfsAuth.sh




#curl="test ${Password}"
#echo $curl > ~/ShellScript/BfsAuthtest.sh
            echo  "changed"
            break
            ;;
        n*)
            echo  "not changed"
						continue 2
						;;
        *)
            echo  "cannot understand $answer.\n"
            ;;
    esac
done
break
done

#read yn
#if ["${yn} == "y"];then
	



#curl="test test"
#echo $curl > ~/ShellScript/BfsAuthtest.sh



#echo "curl http://9.188.216.169/ -H "Authorization: Basic $(echo -n 'AHA05078@jp.ibm.com:${Password}' | base64)" > ~/ShellScript/BFSAuthtest.sh
#echo changed 
#break              
#fi

#if["$[yn] == "n"];then
#continue
#fi
        
#done


#done




