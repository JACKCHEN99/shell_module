#######color code########
RED="31m"      # Error message
GREEN="32m"    # Success message
YELLOW="33m"   # Warning message
BLUE="36m"     # Info message
WHITE="37m"    # Info message
#-------------------------------
HRED="1;31m"      # Error message
HGREEN="1;32m"    # Success message
HYELLOW="1;33m"   # Warning message
HBLUE="1;36m"     # Info message
HWHITE="1;37m"    # Info message
#-------------------------------
BBLUE="1;44m"    # Info message

###############################
colorEcho(){
    COLOR=$1
    echo -e "\033[${COLOR}${@:2}\033[0m"
}
