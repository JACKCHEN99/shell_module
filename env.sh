# log.sh 日志头的时间格式
log_date=`date +%F_%T`
# 所执行脚本的绝对路径
SCRIPT_ROOT_DIR=`cd $(dirname $0);pwd`
# 所执行脚本的名称
SCRIPT_NAME=`echo $0 | awk -F / '{print $NF}'`
# log.sh使用, 所执行脚本的日志文件路径和名称
SCRIPT_LOG_FILE=${SCRIPT_ROOT_DIR}/.`echo ${SCRIPT_NAME%%.*}`.log