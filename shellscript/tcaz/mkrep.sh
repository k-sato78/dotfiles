#!/bin/bash -e
PWD=$(pwd)
MaintenanceLevel=$(cat ./MO.md | grep \*\*メンテナンスレベル |cut -f 3- -d " ")
TestEnvironment=$(cat ./MO.md | grep \*\*テスト環境 |cut -f 3- -d " ")
Date=$(echo $PWD  | awk -F'[/]' '{print $(NF-1) $NF}' | sed s/...\$// |  sed -e 's/\(..\)/\1\//g' | sed s/.\$// )
MOName="佐藤"
# change MOName from 佐藤 to your name
if [ "`echo $PWD | grep RESULT`" ]; then

	MD=$(echo $PWD|sed  -e 's|RESULTS/.*||' -e "s|$|RESULTS/REPORT.md|" )


	if [ $# = 0 ]; then
		echo "input report name"
		read Name
        if [ "${Name}" = "" ];then

						Name="TMP"

        fi

	else
		Name=$1
	fi

	cp -i $MD ./${Name}.md

	sed -i '' -e  "s|# タイトル|# ${Name}|" ./${Name}.md
	sed -i '' -e  "s|yy/mm/dd|${Date}|" ./${Name}.md
	sed -i '' -e "s|_当日の稼働ライブラリーのメンテナンスレベルを記入_|$MaintenanceLevel|" ./${Name}.md
	sed -i '' -e "s@z2 4区画|z2 6区画|J3 WAS V8_DB2 V10 NFM構成|J3 WAS V9_DB2 V10 NFM構成|J3 WAS V9_DB2 V11 CM構成|J3 WAS V9_DB2 V11 NFM構成|Z1 4区画|Z1 6区画 _のいずれかを記入_@$TestEnvironment@" ./${Name}.md
	sed -i '' -e "s|(テスト実施担当者の名前)|${MOName}|" ./${Name}.md
	sed -i '' -e "s|> 冒頭に結論をズバリ書く。問題なしなのか、だめだったのか。||" ./${Name}.md
	sed -i '' -e "s|(何のために何を行なったかを簡潔に。最大2行程度)|[MO.md](./MO.md)|" ./${Name}.md
	sed -i '' -e "s|> 冒頭に結論をズバリ書く。問題なしなのか、だめだったのか。||" ./${Name}.md
	sed -i '' -e "s|> それはどのように評価した結論なのか。問題報告などフォローすべきことは何かを続ける。|" ./${Name}.md
	sed -i '' -e "s|> 詳細は**4. テスト結果(詳細)**以下に記載|" ./${Name}.md
	sed -i '' -e "s|>関連する問題報告やIssuesへのリンクを記載する。以下はその例。 ||" ./${Name}.md
	sed -i '' -e "s|- 評価作業文書リンク <ttps://ibm.box.com/v/DC2-Zyymmdd-CaseId> ||" ./${Name}.md
	sed -i '' -e "s|>JOBLOG, SYSLOG, DUMPなどテスト取得した資料のデータセット名やBoxフォルダーへのリンクを書く||" ./${Name}.md
	sed -i '' -e "s|>テスト結果の詳細を記入。複数の観点での記述が必要であれば、`###`で見出しをつけて整理して書く。||" ./${Name}.md
	sed -i '' -e "s|> ここはテスト実施中にとったメモを記載する。||" ./${Name}.md
	nvim ${Name}.md
	# change nvim to your editor or editor App

else
	echo "this directory is not RESULTS repository"
fi
