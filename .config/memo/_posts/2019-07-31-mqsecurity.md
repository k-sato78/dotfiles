# mqsecurity


起動ユーザー
KENICHIRO.SATO
アプリユーザー　
MQM009(全権利持ち)

MQセキュリティ
CHLAUTH(disabled)
CONNAUTH(OSのやつ)





通常起動
問題なし

user pass渡し
userとパスがあっていればok



no.CONTEXT.checkを消して
M9AD.CONTEXT.** を作成

user passがあっていてもエラー
```
+CSQX511I M9AD CSQXRESP Channel SYSTEM.DEF.SVRCONN started 924
 connection 9.68.254.236
ICH408I USER(IBMUSER ) GROUP(SYS1    ) NAME(                    ) 92
  M9AD.CONTEXT.Q1 CL(MQADMIN )
  PROFILE NOT FOUND - REQUIRED FOR AUTHORITY CHECKING
  ACCESS INTENT(UPDATE )  ACCESS ALLOWED(NONE   )
+CSQX209E M9AD CSQXRESP Connection unexpectedly terminated, 926
 channel SYSTEM.DEF.SVRCONN
 connection 9.68.254.236 (9.68.254.236)
 (queue manager M9AD)
 TRPTYPE=TCP RC=00000000
+CSQX512I M9AD CSQXRESP Channel SYSTEM.DEF.SVRCONN no longer active

```
ibmuserがcontextに触れる権限がない

```
RDEFINE MQADMIN M9AD.CONTEXT.**    UACC(NONE) REPLACE
PERMIT M9AD.CONTEXT.** CLASS(MQADMIN) ID(SYS1) ACCESS(CONTROL)
SETR RACLIST(MQADMIN) REFRESH
```
MQENVをセットしていないと
```
ICH408I USER(KENICHIR) GROUP(0000    ) NAME(???                 ) 171
  LOGON/JOB INITIATION - USER AT TERMINAL          NOT RACF-DEFINED

```
セットしてRACFにとうろくしてあるやつなら通る

