#!/usr/local/bin/zsh
SYSLOG=$1
NewFile=$2
if [ -z "$NewFile" ]; then
   NewFile="reportTmp.txt"
fi
touch $NewFile
export LANG=C
echo '- JES2' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | sed  -ne '/IEA371I/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOG | sed  -ne '/$HASP426/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo '- VTAM' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | sed  -ne '/IST020I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo '- TCPIP' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | sed  -ne '/EZZ4202I/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOG | sed  -ne '/BPXF206I/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOG | sed  -ne '/EZAIN11I/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOG | sed  -ne '/EZD1176I/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOG | sed  -ne '/EZZ4202I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo '- RRS' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | sed  -ne '/ATR221I/p' | sed -e "s/^.\{20\}//" >> $NewFile
cat $SYSLOG | sed  -ne '/ASA2011I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile
echo '- HIS' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | sed  -ne '/HIS002I/p' | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo '- "D A,L"を発行し、下記のA/Sが稼働していることを確認' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | grep -A 15 "D A,L" | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo '- "D M=CPU"を発行し、PROCESSOR STATUS CPUが設定どおり(+=GCP,+A=zAAP)であることを確認'  >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | grep -A 7 "D M=CPU" | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo '- "D M=STOR"を発行し、REAL STORAGE STATUSが設定どおりであることを確認' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | grep -A 12 "D M=STOR" | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

echo '- "D XCF,CF"を発行し、期待通りCFが稼動していることを確認' >> $NewFile
echo '```' >> $NewFile
cat $SYSLOG | grep -A 12 "D XCF,CF" | sed -e "s/^.\{20\}//" >> $NewFile
echo '```' >> $NewFile

exit

