# -*- coding: utf-8 -*-
import io
import pandas as pd
import openpyxl as opx
import re
import subprocess
import openpyxl as opx
import pprint
import os
import sys
def is_num(s):
    return s.replace(',', '').replace('.', '').replace('-', '').isnumeric()

def p2f(x):
    if x == "N/A%" :
        return x
    else :
        return float(x.strip('%'))/100

EXL=pd.ExcelWriter("/Users/k.sato/ShellScript/python/PerformanceStatmentz2yymmdd.SL1032.Vx.xlsx", engine='openpyxl')
print "read RMF.WKLD.csv"
WKLD = pd.read_csv("/Users/k.sato/ftpdoc/TMP.DC2.Z190513.SL1032.V1.RMF.WKLD.CSV", index_col=[0], converters={'CP':p2f ,'AAPCP':p2f ,'IIP':p2f, 'IIPCP':p2f })
print "write RMF.WKLD"
WKLD.info()
print WKLD['CP']
WKLD.to_excel(EXL,u'RMF.WKLD')

  # dummy data
# temp1 = """index col
# 113 34%
# 122 50%
# 123 32%
# 301 12%"""
# # custom function taken from https://stackoverflow.com/questions/12432663/what-is-a-clean-way-to-convert-a-string-percent-to-a-float
# # pass to convertes param as a dict
# df = pd.read_csv(io.StringIO(temp1), sep='\s+',index_col=[0], converters={'col':p2f})
# df
# # Out[149]:
# #         col
# index
# 113    0.34
# 122    0.50
# 123    0.32
# 301    0.12
# In [150]:
# # check that dtypes really are floats
# df.dtypes
# Out[150]:
# col    float64
# dtype: object
#














# ファイルをオープンする
# test_data = open("/Users/k.sato/ShellScript/python/TMP.DC2.Z190425.SL1032.V1.PM.INQRES.TXT", "r")

# InputCaseName = sys.argv
# if len(InputCaseName) == 1 :
#     print "Usage \n  python TMP.DC2.SL1032.py Zyymmdd.caseid.Vx" sys.exit() elif len(InputCaseName) == 2:
#     print "処理を開始します"
# else :
#     print "Too many args. Please retry"
#     sys.exit()
#
# FileDir = os.environ['HOME'] + "/ftpdoc"
# print FileDir
#
# print InputCaseName
#
# print "file check start"
#
# CheckList = [
# "IIB.FLOW.CSV",
# "MQ116S.CSV",
# "PM.EX.TXT",
# "PM.INQRES.TXT",
# "PM.MDB.TXT",
# "RM.EXVEL.CSV",
# "RM.EXVEL.TXT",
# "RMF.CFSTR.CSV",
# "RMF.CFSUM.CSV",
# "RMF.CPU.CSV",
# "RMF.DASD.CSV",
# "RMF.STOR.CSV",
# "RMF.WKLD.CSV"]
#
# d = dict()
# for i in CheckList:
#
#     CHECKDIR = FileDir + "/" + InputCaseName[1] + "." + i
#     if os.path.exists(CHECKDIR) :
#         d[i] = CHECKDIR
#         print(d[i] + " exists.")
#     else:
#         print("File not found. Download " + i + " file.")
#         sys.exit()
#     #
# print "not exit"
#
# print d['RMF.CPU.CSV']
#
# #
# # # wb = opx.load_workbook('/Users/k.sato/ShellScript/python/PerformanceStatmentz2yymmdd.SL1032.Vx.xlsx')
# EXL=pd.ExcelWriter('/Users/k.sato/ShellScript/python/PerformanceStatmentz2yymmdd.SL1032.Vx.xlsx', engine='openpyxl')
# # ExcelWriterに既存の対象ファイルを読み込ませる
# EXL.book=opx.load_workbook('/Users/k.sato/ShellScript/python/PerformanceStatmentz2yymmdd.SL1032.Vx.xlsx')
# # 既存のsheet情報を読み込ませる
# EXL.sheets=dict((ws.title, ws) for ws in EXL.book.worksheets)
#
# # args =["grep","-A","45","-m","3","\*  GROUP","/Users/k.sato/ShellScript/python/TMP.DC2.Z190425.SL1032.V1.PM.INQRES.TXT"]
#          # ,"|","sed","-n","11,47p"]
# csvlistEx = []
#
# csvlistEx = [[' '] * 4 for i in range(6)]
# path = '/Users/k.sato/ShellScript/python/TMP.DC2.Z190425.SL1032.V1.PM.EX.TXT'
# f = open(path)
# for firstG, line in enumerate(f):
#         if '***  GROUP TOTAL  ***' in line:
#             break
# print "group"
# print firstG
# firstGrp = firstG
# for firstA, line in enumerate(f):
#      if 'AVERAGE' in line:
#          break
# firstAve = firstGrp + firstA + 1
# for firstS, line in enumerate(f):
#      if 'SQL DML' in line:
#          print line
#          break
#
# firstSql = firstAve + firstS + 1
#
# f.close()
# # 2
#
# f = open(path)
#
# lines = f.readlines()
#
# f.close()
# for i in range(firstAve,firstAve + 36):
#     e = lines[i]
#     #.replace("-","a")
#     a = []
#     # print(type(s))
#     a += e[:14],e[14:26],e[26:41],e[41:63],e[63:77],e[77:87],e[87:101],e[101:118],e[118:].split(',')
#     # print(type(s))
#
#     s = []
#     for w in range(0,9):
#         # print a[w]
#         # print a[w].strip()
#         print a[w]
#         if isinstance(a[w], list):
#             s.append(a[w][0].strip())
#         else:
#             s.append(a[w].strip())
#     for k in range(0,9):
#         if is_num(unicode(s[k])):
#             s[k] = float(s[k])
#             print s[k]
#     csvlistEx.append(s)
#
# for i in range(1,14):
#     csvlistEx.append([' '])
#
#
# for i in range(firstSql,firstSql + 31):
#     e = lines[i]
#     #.replace("-","a")
#     a = []
#     # print(type(s))
#     a += e[:10],e[10:19],e[19:28],e[46:55],e[55:69],e[69:76],e[76:82],e[82:90],e[90:114],e[114:124],e[124:].split(',')
#
#     s = []
#     for w in range(0,11):
#         # print a[w]
#         # print a[w].strip()
#         print a[w]
#         if isinstance(a[w], list):
#             s.append(a[w][0].strip())
#         else:
#             s.append(a[w].strip())
#     for k in range(0,11):
#         if is_num(unicode(s[k])):
#             s[k] = float(s[k])
#             print s[k]
#     csvlistEx.append(s)
#
#
# print "fin"
# print csvlistEx
# PMEX = pd.DataFrame(csvlistEx)
# PMEX.to_excel(EXL,'PM.EX',index=False, header=False)
EXL.save()
