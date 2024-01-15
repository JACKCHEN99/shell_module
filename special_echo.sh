#!/bin/bash

# 打印特定数量的符号, 作为分隔符
echo_line() {
	# 参数1(必选): 占终端的百分比(不需要%)
	width_percent=$1

	# 参数2(可选): 符号(默认为-，*号要加引号)
	symbol=${2:--}

	# 获取终端宽度，如果无法获取则默认为80
	width=$(($(tput cols 2>/dev/null || echo 80) * width_percent / 100))

	# 打印
	printf "%-${width}s\n" "" | tr ' ' "${symbol}"
}
