#!/bin/bash

source /tmp/shell_module/env.sh

depend_pkg='''
/tmp/shell_module/colorEcho.sh
'''

log_clean_switch=on     # 日志清理开关, 默认on
log_clean_size=100000   # 默认100m删除

for pkg in ${depend_pkg};do
    [ -f ${pkg} ] && source ${pkg} || echo "$0 ERROR! 因为依赖包 ${pkg} 不存在, 即将退出!"
done


function log() {
    case $1 in
      info)
        colorEcho ${WHITE} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      INFO)
        colorEcho ${BLUE} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      warn)
        colorEcho ${YELLOW} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      WARN)
        colorEcho ${HYELLOW} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      error)
        colorEcho ${RED} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      ERROR)
        colorEcho ${HRED} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      success)
        colorEcho ${GREEN} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      SUCCESS)
        colorEcho ${HGREEN} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      BBLUE)
        colorEcho ${BBLUE} "[`date +"%F %T"`]"  " ${@:2}" | tee -a ${SCRIPT_LOG_FILE}
        ;;
      *)
        colorEcho ${YELLOW} "[`date +"%F %T"`]"  "log函数参数错误" | tee -a ${SCRIPT_LOG_FILE}
    esac  
}


# 脚本的执行日志清理(大于200m则清理)
function log_clean() {
  if [[ ${log_clean_switch} == 'on'  ]]; then
    if [ -f ${SCRIPT_LOG_FILE} ];then
        log_file_size=`du -sk ${SCRIPT_LOG_FILE} | awk '{print $1}'`

        if [ ${log_file_size} -gt ${log_clean_size} ];then
            echo "日志文件${SCRIPT_LOG_FILE}大于 ${log_clean_size}k, 日志文件内容正在被删除"
            > ${SCRIPT_LOG_FILE}
        fi
    fi
  fi
}

log_clean