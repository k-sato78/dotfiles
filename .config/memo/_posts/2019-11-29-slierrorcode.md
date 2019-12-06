# slierrorcode


Dは対応決めておいたら？

"CSQJ011D","RESTART CONTROL rrr CREATED AT date time FOUND. REPLY Y TO USE, N TO CANCEL"
"CSQJ021D","REPLY Y WHEN DEVICE READY OR N TO CANCEL"
"CSQJ031D","csect-name, THE LOG RBA RANGE MUST BE RESET. REPLY \'Y\' TO CONTINUE STARTUP OR \'N\' TO SHUTDOWN."
"CSQJ245D","RESTART CONTROL INDICATES TRUNCATION AT RBA rrr. REPLY Y TO CONTINUE, N TO CANCEL"
"CSQJ246D","RESTART CONTROL INDICATES COLD START AT RBA rrr. REPLY Y TO CONTINUE, N TO CANCEL"
"CSQJ295D","RESTART CONTROL INDICATES TRUNCATION AT LRSN rrr. REPLY Y TO CONTINUE, N TO CANCEL"
"CSQR021D","REPLY Y TO COMMIT OR N TO CONTINUE"
"CSQV461D","csect-name Reply Y to continue startup with CLWLEXIT not enabled, or N to shutdown."
"CSQY341D","Reply Y to continue or N to cancel"



お疲れ様です。ISEの佐藤賢一郎です。

先日の会議で話した障害時のリカバリーに関してですが、以下にまとめましたので参考にしていただければと思います。

・PAGE SET障害
メトロミラーの機能で障害にあったデータセットorディスクを復旧。その後、MQを再起動。

https://www.ibm.com/support/knowledgecenter/ja/SSFKSJ_9.0.0/com.ibm.mq.tro.doc/q040640_.htm
ページセット入力エラー参照

・ BSDS 片系障害

損傷したBSDSをrenameし、代わりに定義したD/Sに正常稼働しているBSDSをコピーする。


https://www.ibm.com/support/knowledgecenter/ja/SSFKSJ_9.0.0/com.ibm.mq.tro.doc/q040630_.htm
BSDS のオープン中に発生するエラー参照

・アクティブログ片系障害

損傷したアクティブログをrenameし、代わりに定義したD/Sに正常稼働しているアクティブログをコピーする。
ログ目録変更ユーティリティーでBSDSを修正し、QMGRを再始動。

https://www.ibm.com/support/knowledgecenter/ja/SSFKSJ_9.0.0/com.ibm.mq.tro.doc/q040610_.htm
活動ログ・データ・セット　1 つまたは両方のコピーが損傷

https://www.ibm.com/support/knowledgecenter/ja/SSFKSJ_9.0.0/com.ibm.mq.ref.adm.doc/q088880_.htm
z/OS でのログ目録変更ユーティリティー (CSQJU003)




Pageset障害は、キューへのアクセスの際にQMGRが落ちますので、能動監視でも対応可能かと思います
BSDS,アクティブログの稼働中の片系障害はエラーを出した後、片系のみで稼働するため、検知が必要です。
検知後は、QMGRを正常終了させ、障害対応を行ってください。
以下の資料を参考にして下さい。

また、先日の会議で議題に上がったリカバリー時の再起動時間についてですが、以下に考え方があります。





