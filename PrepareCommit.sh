#!/usr/bin/bash

CUR_PATH=$(dirname $0)

# delete history of "launcher/afxw/AFXW.INI"
TARGET_FILE="$CUR_PATH/afxw/AFXW.INI"

sed -i -e "s/PATH_L=.*/PATH_L=/g" ${TARGET_FILE}
sed -i -e "s/PATH_R=.*/PATH_R=/g" ${TARGET_FILE}

mv ${TARGET_FILE} tmp
perl -p -e 's/\n/\r\n/' <tmp >${TARGET_FILE}
rm tmp

# delete history of "launcher/clnch/clnch.ini"
TARGET_FILE="$CUR_PATH/clnch/clnch.ini"

sed -i -e "s/history_0=.*/history_0=/g" ${TARGET_FILE}
# sed -i -e "s/history_[^0]=.*//g" ${TARGET_FILE}

mv ${TARGET_FILE} tmp
perl -p -e 's/\n/\r\n/' <tmp >${TARGET_FILE}
rm tmp

