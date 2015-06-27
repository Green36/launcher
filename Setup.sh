#!/usr/bin/bash

CUR_PATH=$(dirname $0)
RESULT=1
COMMENT=""

ExitIfError()
{
  if [ ${RESULT} -ne 0 ]; then
    echo "ERROR COMMAND : ${COMMENT}"
    exit 1
  fi
}

UnzipWithTargetDir()
{
  local ZIP_FILE=$1
  local TARGET_DIR_NAME=${CUR_PATH}/$2

  local TMP_PATH=${CUR_PATH}/tmp

  if [ ! -e ${TARGET_DIR_NAME} ]; then
    mkdir ${TARGET_DIR_NAME}
  fi
  mkdir -p ${TMP_PATH}
  unzip ${ZIP_FILE} -d ${TMP_PATH}

  if [ `ls ${TMP_PATH} | wc -l` -eq 1 ]; then
    if [ -d $TMP_PATH/`ls ${TMP_PATH}` ]; then
      mv $TMP_PATH/`ls ${TMP_PATH}`/* ${TARGET_DIR_NAME}
    else 
      mv $TMP_PATH/`ls ${TMP_PATH}` ${TARGET_DIR_NAME}
    fi
  else
    COMMENT="mv -f ${TMP_PATH}/* ${TARGET_DIR_NAME}/"
    mv -f ${TMP_PATH}/* ${TARGET_DIR_NAME}/
    RESULT=$?
  fi
  COMMENT="rm -d ${TMP_PATH}"
  rm -rd ${TMP_PATH}
  RESULT=$?
  ExitIfError
}


while getopts a:c:f:p:z: OPT
do
  case ${OPT} in
  "a" )
    # Afxw
    UnzipWithTargetDir ${OPTARG} "afxw"
    ;;
  "c" )
    # CraftLaunch
    UnzipWithTargetDir ${OPTARG} "clnch"
    ;;
  "f" )
    # FastCopy
    UnzipWithTargetDir ${OPTARG} "fcopy"
    ;;
  "p" )
    # PathWay
    UnzipWithTargetDir ${OPTARG} "pthwy"
    ;;
  "z" )
    # 7z
    UnzipWithTargetDir ${OPTARG} "7z"
    ;;
  *   )
    ;;
  esac
done

echo "#### Complete ####"



