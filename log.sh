#!/bin/bash

source /tmp/shell_module/env.sh

depend_pkg='''
/tmp/shell_module/colorEcho.sh
'''

for pkg in ${depend_pkg};do
	[ -f ${pkg} ] && source ${pkg} || echo "$0 ERROR! 因为依赖包 ${pkg} 不存在, 即将退出!"
done

function log() {
	colorEcho ${YELLOW} "[`date +"%F %T"`]" `echo $0` " $*"
	echo "[`date +"%F %T"`] `echo $0`  $*" >> ${SCRIPT_LOG_FILE}
}
