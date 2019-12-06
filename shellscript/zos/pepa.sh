#!/usr/local/bin/zsh -x

file=$(gmktemp ~/tmp/file-XXX.txt)
filepath=$(realpath $1)
dirname=$(dirname $filepath)
basename=$(basename $filepath)

 echo "open 9.188.216.204\nuser mqm009 lskdjf\nprompt\ncd /u/mqm009/jcllib/\nlcd $dirname\nput $basename\nbye" > $file 
 ftp -n < $file
echo "ftp done"





# trap 'rm -v "$file"' EXIT
