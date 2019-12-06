#!/bin/bash


if [ "`echo $PWD | grep SL1032`" ]; then
	cat ./*RMF.CPU.CSV | pbcopy
	echo "RMF.CPU to your clipboard"
	read -p "Hit enter: "

	cat ./*RMF.CFSUM.CSV |pbcopy
	echo "RMF.CFSUM to your clipboard"
	read -p "Hit enter: "

	cat ./*RMF.CFSTR.CSV | sed -e "/TOTAL/p" |pbcopy
	echo "RMF.CFSTR to your clipboard"
	read -p "Hit enter: "
  grep -e ".*,.*,\"\*ALL\",.*,\"\*ALL\"," ./*RMF.DASD.CSV |pbcopy
	echo "RMF.DASD.CSV to your clipboard"
	read -p "Hit enter: "

	cat ./*RMF.STOR.CSV | pbcopy
	echo "RMF.STOR to your clipboard"
	read -p "Hit enter: "

	cat ./*RMF.WKLD.CSV | pbcopy
	echo "RMF.WKLD to your clipboard"
	read -p "Hit enter: "

	cat ./*IIB.FLOW.CSV | pbcopy
	echo "IIB.FLOW to your clipboard"
	read -p "Hit enter: "

	grep -A 45 -m 2 "\*  GROUP TOTAL" ./*PM.INQRES.TXT |sed -n 11,47p | pbcopy
	echo "PM.INQRES AVERAGE to your clipboard"
	read -p "Hit enter: "

	grep -A 45 -m 3 "\*  GROUP TOTAL" ./*PM.INQRES.TXT |sed -n 51,82p | pbcopy
	echo "PM.INQRES SQL to your clipboard"
	read -p "Hit enter: "

	grep -A 45 -m 2 "\*  GROUP TOTAL" ./*PM.EX.TXT |sed -n 11,47p | pbcopy
	echo "PM.EX AVERAGE to your clipboard"
	read -p "Hit enter: "

	grep -A 45 -m 3 "\*  GROUP TOTAL" ./*PM.EX.TXT |sed -n 51,82p | pbcopy
	echo "PM.EX SQL to your clipboard"
	read -p "Hit enter: "

	grep -A 45 -m 2 "\*  GROUP TOTAL" ./*PM.MDB.TXT |sed -n 11,47p | pbcopy
	echo "PM.MDB AVERAGE to your clipboard"
	read -p "Hit enter: "

	grep -A 45 -m 3 "\*  GROUP TOTAL" ./*PM.MDB.TXT |sed -n 51,82p | pbcopy
	echo "PM.MDB SQL to your clipboard"
	read -p "Hit enter: "


	grep -e ".*,.*,.*,.*,.*,.*,.*,\"GET\"" -e "TYPE" ./*MQ116S.CSV P
	echo "MQ116S to your clipboard"
	read -p "Hit enter: "



else
  echo "there is not ftp directory"
fi
