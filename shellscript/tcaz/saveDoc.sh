#!/bin/bash
FILE_PATH=$(cd $(dirname "$1") && pwd)/$(basename "$1")
FILE_NAME=$(basename "$1")
 mv $FILE_PATH "/Users/k.sato/Box/TCAZ z2/TCAZテスト評価作業文書 z2/"
 echo "finish"
 ls /Users/k.sato/Box/TCAZ z2/TCAZテスト評価作業文書 z2/
