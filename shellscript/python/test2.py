path = '/Users/k.sato/ShellScript/python/TMP.DC2.Z190425.SL1032.V1.PM.INQRES.TXT'
f = open(path)
for i, line in enumerate(f):
        if '***  GROUP TOTAL  ***' in line:
            break
print(i)
for s, line in enumerate(f):
     if 'AVERAGE' in line:
         break
for k, line in enumerate(f):
     if 'SQL DML' in line:
         print line
         break
print(i)
print(s)
print(k)
print(s + i)
print(s + i + k)
