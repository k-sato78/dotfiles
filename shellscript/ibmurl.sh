#!/bin/bash
URL=$(curl -XPOST http://ibmurl.hursley.ibm.com/api.php/short -d "url=$1")
echo -e  "Short url  (""\033[0;31m$URL\033[0;39m"") is copied to your clipbood."
echo $URL | pbcopy
