#!/bin/bash

# 确认上面输出的信息是否正确, 没问题点击任意键则继续
conform_info() {
	# 参数1: 要确认的信息, 比如 "请确认上面的xxx信息是否正确"
	word=$1

	echo
	echo -e "\e[1;33m${word}, 按任意键2s后将继续...\e[0m"
	read -rsp "" -n1
	echo
	sleep 2
}
