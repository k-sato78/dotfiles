# -*- coding: utf-8 -*-
import pandas as pd
import openpyxl as opx
import os
import sys
import shutil
def is_num(s):
        return s.replace(',', '').replace('.', '').replace('-', '').isnumeric()


def p2f(x):
    if x == "N/A%" :
        return x
    elif x == "%" :
        return 0
    else :
        return float(x.strip('%'))/100
InputCaseName = sys.argv
if len(InputCaseName) == 1 :
    print("Usage \n  python SL1032.py TMP.DC2.Zyymmdd.caseid.Vx")
    sys.exit()
elif len(InputCaseName) == 2:
    print("処理を開始します")
else :
    print("Too many args. Please retry")
    sys.exit()

FileDir = os.environ['HOME'] + "/ftpdoc"
print(FileDir)

# print InputCaseName

print("file check start")

CheckList = [
"IIB.FLOW.CSV",
"MQ116S.CSV",
"PM.EX.TXT",
"PM.INQRES.TXT",
"PM.MDB.TXT",
"RM.EXVEL.CSV",
"RM.EXVEL.TXT",
"RMF.CFSTR.CSV",
"RMF.CFSUM.CSV",
"RMF.CPU.CSV",
"RMF.DASD.CSV",
"RMF.STOR.CSV",
"RMF.WKLD.CSV"]


d = dict()
for i in CheckList:

    CHECKDIR = FileDir + "/" + InputCaseName[1] + "." + i
    if os.path.exists(CHECKDIR) :
        d[i] = CHECKDIR
        print((d[i] + " exists."))
    else:
        print(("File not found. Download " + i + " file."))
        sys.exit()
    #

print("make file")
CaseNameList = InputCaseName[1].split(".")

ExcelPath = FileDir + "/PerformanceStatmentz2yymmdd.SL1032.Vx.xlsx"
NewExcelPath = FileDir + "/PerformanceStatment" + CaseNameList[2] + "." + CaseNameList[3] + "." + CaseNameList[4]  + ".xlsx"
shutil.copyfile(ExcelPath,NewExcelPath)

# 対象ファイルのExcelWriterの呼び出し
EXL=pd.ExcelWriter(NewExcelPath, engine='openpyxl')
# ExcelWriterに既存の対象ファイルを読み込ませる
EXL.book=opx.load_workbook(NewExcelPath)
# 既存のsheet情報を読み込ませる
EXL.sheets=dict((ws.title, ws) for ws in EXL.book.worksheets)
CPU = pd.read_csv(d['RMF.CPU.CSV'], index_col=0)
print("read RMF.CPU.CSV")
# ExcelWriterを用いて新規シートにDataFrameを保存
CPU.to_excel(EXL,'RMF.CPU' )
print("write RMF.CPU")

CFSUM = pd.read_csv(d['RMF.CFSUM.CSV'], index_col=0 ,  converters={'UTIL%':p2f})
print("read RMF.CFSUM.csv")
# ExcelWriterを用いて新規シートにDataFrameを保存
CFSUM.to_excel(EXL,'RMF.CFSUM' )
print("write RMF.CFSUM")

print("read RMF.CFSTR.csv")
CFSTR = pd.read_csv(d['RMF.CFSTR.CSV'], index_col=0)

print("Extraction from RMF.CFSTR.csv")
CFSTR = CFSTR[CFSTR['SYS'] == 'TOTAL']

print("write RMF.CFSTR")
CFSTR.to_excel(EXL,'RMF.CFSTR SYS TOTALで抽出' )

print("read RMF.DASD.csv")
DASD = pd.read_csv(d['RMF.DASD.CSV'], index_col=0)

print("Extraction from RMF.DASD.csv")

## print(DASD[(DASD['volser'] == r'*ALL') & (DASD['sys'] == r'*ALL')])
DASD = DASD[(DASD['volser'] == r'*ALL') & (DASD['sys'] == r'*ALL')]
print("write RMF.DASD")
DASD.to_excel(EXL,'RMF.DASD VOLSER ALL. SYS ALLで抽出' )

print("read RMF.STOR.csv")
STOR = pd.read_csv(d['RMF.STOR.CSV'], index_col=0)

print("write RMF.STOR")
STOR.to_excel(EXL,'RMF.STOR')

print("read RMF.WKLD.csv")
WKLD = pd.read_csv(d['RMF.WKLD.CSV'], index_col=0 , converters={'CP':p2f ,'AAPCP':p2f ,'IIP':p2f, 'IIPCP':p2f })

print("write RMF.WKLD")
WKLD.to_excel(EXL,'RMF.WKLD')


print("read RM.EXVEL")
EXVEL = pd.read_csv(d['RM.EXVEL.CSV'], index_col=0)

print("write RM.EXVEL")
EXVEL.to_excel(EXL,'RM.EXVEL')


print("read IIB.FLOW.csv")
FLOW = pd.read_csv(d['IIB.FLOW.CSV'], index_col=0)

print("write IIB.FLOW")
FLOW.to_excel(EXL,'IIB.FLOW')
print("read MQ116S.csv")
MQ116S = pd.read_csv(d['MQ116S.CSV'], index_col=0)
MQ116S = MQ116S[(MQ116S['TYPE'] == 'GET')]
print("write MQ116S")
MQ116S.to_excel(EXL,'MQ116S TYPE GETで抽出')
# ファイルをオープンする
test_data = open(d['PM.INQRES.TXT'], "r")

print("PM.INQ start")

csvlist = []

csvlist = [[' '] * 4 for i in range(6)]
path = d['PM.INQRES.TXT']
f = open(path)
for firstG, line in enumerate(f):
        if '***  GROUP TOTAL  ***' in line:
            break
# print "group"
# print firstG
firstGrp = firstG
for firstA, line in enumerate(f):
     if 'AVERAGE' in line:
         break
firstAve = firstGrp + firstA + 1
for firstS, line in enumerate(f):
     if 'SQL DML' in line:
         # print line
         break

firstSql = firstAve + firstS + 1

f.close()
# 2

f = open(path)

lines = f.readlines()

f.close()
for i in range(firstAve,firstAve + 36):
    e = lines[i]
    #.replace("-","a")
    a = []
    # print(type(s))
    a += e[:14],e[14:26],e[26:41],e[41:63],e[63:77],e[77:87],e[87:101],e[101:118],e[118:].split(',')
    # print(type(s))

    s = []
    for w in range(0,9):
        # print a[w]
        # print a[w].strip()
        # print a[w]
        if isinstance(a[w], list):
            s.append(a[w][0].strip())
        else:
            s.append(a[w].strip())
    for k in range(0,9):
        if is_num(str(s[k])):
            s[k] = float(s[k])
            # print s[k]
    csvlist.append(s)

for i in range(1,14):
    csvlist.append([' '])


for i in range(firstSql,firstSql + 31):
    e = lines[i]
    #.replace("-","a")
    a = []
    # print(type(s))
    a += e[:10],e[10:19],e[19:28],e[46:55],e[55:69],e[69:76],e[76:82],e[82:90],e[90:114],e[114:124],e[124:].split(',')

    s = []
    for w in range(0,11):
        # print a[w]
        # print a[w].strip()
        # print a[w]
        if isinstance(a[w], list):
            s.append(a[w][0].strip())
        else:
            s.append(a[w].strip())
    for k in range(0,11):
        if is_num(str(s[k])):
            s[k] = float(s[k])
            # print s[k]
    csvlist.append(s)


print("PM.INQ finish")
# print csvlist
PMINQ = pd.DataFrame(csvlist)
PMINQ.to_excel(EXL,'PM.INQRES',index=False, header=False)

print("PM.EX start")
csvlistEx = []

csvlistEx = [[' '] * 4 for i in range(6)]
path = d['PM.EX.TXT']
f = open(path)
for firstG1, line in enumerate(f):
        if '***  GROUP TOTAL  ***' in line:
            break
# print "group"
# print firstG1
firstGrp1 = firstG1
for firstA1, line in enumerate(f):
     if 'AVERAGE' in line:
         break
firstAve1 = firstGrp1 + firstA1 + 1
for firstS1, line in enumerate(f):
     if 'SQL DML' in line:
         # print line
         break

firstSql1 = firstAve1 + firstS1 + 1

f.close()
# 2

f = open(path)

lines = f.readlines()

f.close()
for i in range(firstAve1,firstAve1 + 36):
    e = lines[i]
    #.replace("-","a")
    a = []
    # print(type(s))
    a += e[:14],e[14:26],e[26:41],e[41:63],e[63:77],e[77:87],e[87:101],e[101:118],e[118:].split(',')
    # print(type(s))

    s = []
    for w in range(0,9):
        # print a[w]
        # print a[w].strip()
        # print a[w]
        if isinstance(a[w], list):
            s.append(a[w][0].strip())
        else:
            s.append(a[w].strip())
    for k in range(0,9):
        if is_num(str(s[k])):
            s[k] = float(s[k])
            # print s[k]
    csvlistEx.append(s)

for i in range(1,14):
    csvlistEx.append([' '])


for i in range(firstSql1,firstSql1 + 31):
    e = lines[i]
    #.replace("-","a")
    a = []
    # print(type(s))
    a += e[:10],e[10:19],e[19:28],e[46:55],e[55:69],e[69:76],e[76:82],e[82:90],e[90:114],e[114:124],e[124:].split(',')

    s = []
    for w in range(0,11):
        # print a[w]
        # print a[w].strip()
        # print a[w]
        if isinstance(a[w], list):
            s.append(a[w][0].strip())
        else:
            s.append(a[w].strip())
    for k in range(0,11):
        if is_num(str(s[k])):
            s[k] = float(s[k])
            # print s[k]
    csvlistEx.append(s)


print("PM.EX fin")
# print csvlistEx
PMEX = pd.DataFrame(csvlistEx)
PMEX.to_excel(EXL,'PM.EX',index=False, header=False)
print("PM.MDB start")
csvlistMdb = []

csvlistMdb = [[' '] * 4 for i in range(6)]
path = d['PM.MDB.TXT']
f = open(path)
for firstG2, line in enumerate(f):
        if '***  GRAND TOTAL  ***' in line:
            break
# print "group"
# print firstG2
firstGrp2 = firstG2
for firstA2, line in enumerate(f):
     if 'AVERAGE' in line:
         break
firstAve2 = firstGrp2 + firstA2 + 1
for firstS2, line in enumerate(f):
     if 'SQL DML' in line:
         # print line
         break

firstSql2 = firstAve2 + firstS2 + 1

f.close()
# 2

f = open(path)

lines = f.readlines()

f.close()
for i in range(firstAve2,firstAve2 + 36):
    e = lines[i]
    #.replace("-","a")
    a = []
    # print(type(s))
    a += e[:14],e[14:26],e[26:41],e[41:63],e[63:77],e[77:87],e[87:101],e[101:118],e[118:].split(',')
    # print(type(s))

    s = []
    for w in range(0,9):
        # print a[w]
        # print a[w].strip()
        # print a[w]
        if isinstance(a[w], list):
            s.append(a[w][0].strip())
        else:
            s.append(a[w].strip())
    for k in range(0,9):
        if is_num(str(s[k])):
            s[k] = float(s[k])
            # print s[k]
    csvlistMdb.append(s)

for i in range(1,14):
    csvlistMdb.append([' '])


for i in range(firstSql2,firstSql2 + 31):
    e = lines[i]
    #.replace("-","a")
    a = []
    # print(type(s))
    a += e[:10],e[10:19],e[19:28],e[46:55],e[55:69],e[69:76],e[76:82],e[82:90],e[90:114],e[114:124],e[124:].split(',')

    s = []
    for w in range(0,11):
        # print a[w]
        # print a[w].strip()
        # print a[w]
        if isinstance(a[w], list):
            s.append(a[w][0].strip())
        else:
            s.append(a[w].strip())
    for k in range(0,11):
        if is_num(str(s[k])):
            s[k] = float(s[k])
            # print s[k]
    csvlistMdb.append(s)


print("PM.MDB fin")
# print csvlistMdb
PMMDB = pd.DataFrame(csvlistMdb)
PMMDB.to_excel(EXL,'PM.MDB',index=False, header=False)
# ExcelWriterの処理を保存
print("save changes")
EXL.save()
print("finish!")

