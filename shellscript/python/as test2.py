# -*- coding: utf-8 -*-

import pandas as pd
import openpyxl as opx
import re
import subprocess
import pandas as pd
import openpyxl as opx


# ファイルをオープンする
test_data = open("/Users/k.sato/ShellScript/python/TMP.DC2.Z190425.SL1032.V1.PM.INQRES.TXT", "r")

# EXL=pd.ExcelWriter('/Users/k.sato/ShellScript/python/PerformanceStatmentz2yymmdd.SL1032.Vx.xlsx', engine='openpyxl')
# ExcelWriterに既存の対象ファイルを読み込ませる
# EXL.book=opx.load_workbook('/Users/k.sato/ShellScript/python/PerformanceStatmentz2yymmdd.SL1032.Vx.xlsx')
# 既存のsheet情報を読み込ませる
# EXL.sheets=dict((ws.title, ws) for ws in EXL.book.worksheets)

args =["grep","-A","45","-m","2","\*  GROUP","/Users/k.sato/ShellScript/python/TMP.DC2.Z190425.SL1032.V1.PM.INQRES.TXT"]
         # ,"|","sed","-n","11,47p"]
csvlist =[[' '],[' '],[' '],[' '],[' '],[' ']]


try:
    print "try"
    res = subprocess.check_output(args)
    print "try2"
    # lines = readlines(res)
    # print lines[0]
    lines = res.split("\n")
    for i in range(10,46):
        print lines[i]
        na = lines[i].replace(r'                            ',r'-  -  -  ')
        noc = na.replace(r":", "")
        csvlist.append(re.sub(r' {2,10}',",",noc))

    print "fin"
    print csvlist
    # df = pd.DataFrame(csvlist)
    # print(df)

    # df.to_excel(EXL,'PM.INQRES',index=False, header=False)
except:
    print "except"
    print "Error."
# print res





# EXL.save()




# 行ごとにすべて読み込んでリストデータにする
# lines = test_data.readlines()
#
# for line in lines:

#     if line.find(r"***  GROUP TOTAL  ***") >= 0:
#         print line[:-1]
#
#
# # 一行ずつ表示する
# for line in lines:
#     print line
#     na = line.replace(r'                            ',r'　 　 　 ')
#     print na
#     noc = na.replace(r":", "")
#     words = noc.split()
#     print words
# ファイルをクローズする
test_data.close()

