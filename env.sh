# 当前时期
log_date=`date +%F_%T`

# 执行脚本所在的根目录
SCRIPT_ROOT_DIR=`cd $(dirname $0);pwd`

# 执行脚本的绝对路径
SCRIPT_NAME=$0

# 当前脚本的执行日志的文件路径
SCRIPT_LOG_FILE=${SCRIPT_ROOT_DIR}/.`echo ${SCRIPT_NAME%%.*}`.log