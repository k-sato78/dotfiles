#!/usr/local/bin/zsh

SYSLOGB1=$1
SYSLOGB2=$2
SYSLOGB3=$3
NewFile=$4
if [ -z "$NewFile" ]; then
   NewFile="reportTmp.txt"
fi
touch $NewFile


export LANG=C
echo '- DB2 B1 : RO B1,-DT11 START DB2' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB1 | sed  -ne '/-DT11 START DB2/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB1 | sed  -ne '/DSN9022I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo '- DB2 B2 : RO B2,-DT11 START DB2' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB2 | sed  -ne '/-DT21 START DB2/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB2 | sed  -ne '/DSN9022I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo ' -DB2 B3 : RO B3,-DT11 START DB2' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB3 | sed  -ne '/-DT31 START DB2/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB3 | sed  -ne '/DSN9022I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo ' -MQ B1 : RO B1,+MQH1 START QMGR' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB1 | sed  -ne '/+MQH1 START QMGR/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB1 | sed  -ne '/CSQ9022I +MQH1 CSQYASCP/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo 'RO B1,+MQH1 START CHINIT' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB1 | sed  -ne '/+MQH1 START CHINIT/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB1 | sed  -ne '/CSQ9022I +MQH1 CSQXCRPS/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo ' -MQ B2 : RO B2,+MQH2 START QMGR' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB2 | sed  -ne '/+MQH2 START QMGR/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB2 | sed  -ne '/CSQ9022I +MQH2 CSQYASCP/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo 'RO B2,+MQH2 START CHINIT' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB2 | sed  -ne '/+MQH2 START CHINIT/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB2 | sed  -ne '/CSQ9022I +MQH2 CSQXCRPS/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo ' -MQ B3 : RO B3,+MQH3 START QMGR' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB2 | sed  -ne '/+MQH3 START QMGR/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB2 | sed  -ne '/CSQ9022I +MQH3 CSQYASCP/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo 'RO B3,+MQH3 START CHINIT' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB3 | sed  -ne '/+MQH3 START CHINIT/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB3 | sed  -ne '/CSQ9022I +MQH3 CSQXCRPS/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo 'WAS V9(J3) B1 DM : RO B1,S BNM100GO' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOGB1 | sed  -ne '/S BNM100GO/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOGB2 | sed  -ne '/BBOO0246I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile








