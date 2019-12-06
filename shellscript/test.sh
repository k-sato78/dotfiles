a="/Users/k.sato/git/RESULTS/1901/10-z2"
if [ "`echo $a | grep RESULT`" ]; then

	d=$(echo $a|sed  -e 's|RESULTS/.*||' -e "s|$|RESULTS/REPORT.md|" )
echo $d


else
	echo "this directory is not RESULTS repository"
fi


b=$(echo $a |awk -F'/' '{print $3}')
c=${b##*/}_CSV.csv




echo $a

echo $b
echo $c
