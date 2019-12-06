#!/usr/local/bin/zsh
NAME=$1

FILE=${NAME%.*}
FILE_NAME=${FILE##*/}_CSV.csv
echo "変更前"
cat $1
echo "変更後"
#gsed -e 's/^AMQ.*/ /g' -e '1,6d' -e 's/(/,/g' -e 's/  /\'$'\n/g' $1 |gsed -e 's/)/\'$'\n/g' -e 's/ //g' | gsed -e '/^$/d' | gsed -e '$d'| gsed -e '$d'| gsed -e '$d'  > ./$FILE_NAME
	gsed -e 's/^AMQ.*/ /g' -e '1,6d' -e 's/(/,/g' -e 's/  /\'$'\n/g' -e 's/)/\'$'\n/g' -e 's/ //g' $1 | gsed -e '/^$/d' | gsed -e '$d'| gsed -e '$d'| gsed -e '$d' > ~/CommandLogCsv/$FILE_NAME




#gsed -e '1,6d' -e 's/(/,/g' -e 's/)/\'$'\n/g' -e 's/ //g' $1 | gsed -e '/^$/d' | gsed -e '$d'| gsed -e '$d'| gsed -e '$d' | gsed -e 's/.*AMQ.*/ /g' > ./$FILE_NAME
echo ~/CommandLogCsv/$FILE_NAME

cat ~/CommandLogCsv/$FILE_NAME
open  ~/CommandLogCsv/$FILE_NAME
