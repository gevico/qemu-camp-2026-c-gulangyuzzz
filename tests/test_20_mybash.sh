#!/bin/bash
# test_20_mybash.sh - 测试脚本 for mybash 练习
# 被 test_framework compile_and_run(is_make=2) 调用
# 运行目录：tests/

set -e

cd ../exercises/20_mybash

# 创建临时命令脚本
SCRIPT_FILE=$(mktemp /tmp/mybash_script.XXXXXX)
trap "rm -f $SCRIPT_FILE" EXIT

cat > "$SCRIPT_FILE" << 'SCRIPT'
myfile /bin/ls
myfile obj/mybash/main.o
mysed s/unix/linux/ "unix is opensource. unix is free os."
mytrans src/mytrans/text.txt
mywc src/mywc/paper.txt
SCRIPT

./bin/mybash "$SCRIPT_FILE"
