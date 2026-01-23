#!/bin/bash
# 在知识库中搜索内容

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 显示帮助
show_help() {
    cat << EOF
使用方法: $0 [选项] <搜索关键词>

在 Jack Knowledge Hub 中搜索内容

选项:
    -h, --help          显示此帮助信息
    -t, --type TYPE     限制搜索类型 (skills|mcp|prompts|workflows|snippets|resources)
    -f, --freq FREQ     限制频率 (frequently-used|occasionally-used|archived)
    -i, --ignore-case   忽略大小写
    -c, --count         只显示匹配数量

示例:
    $0 "地理编码"                      # 搜索所有内容
    $0 -t mcp "地图"                   # 只搜索 MCP 相关
    $0 -t prompts -f frequently-used "测试"  # 搜索高频 Prompts
    $0 -i "API"                        # 忽略大小写搜索
EOF
}

# 解析命令行参数
SEARCH_TYPE=""
SEARCH_FREQ=""
IGNORE_CASE=""
COUNT_ONLY=""
SEARCH_TERM=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -t|--type)
            SEARCH_TYPE="$2"
            shift 2
            ;;
        -f|--freq)
            SEARCH_FREQ="$2"
            shift 2
            ;;
        -i|--ignore-case)
            IGNORE_CASE="-i"
            shift
            ;;
        -c|--count)
            COUNT_ONLY="yes"
            shift
            ;;
        *)
            SEARCH_TERM="$1"
            shift
            ;;
    esac
done

# 检查搜索词
if [ -z "$SEARCH_TERM" ]; then
    echo "错误: 请提供搜索关键词"
    echo "使用 $0 --help 查看帮助"
    exit 1
fi

# 构建搜索路径
SEARCH_PATH="$ROOT_DIR"
if [ -n "$SEARCH_TYPE" ]; then
    SEARCH_PATH="$ROOT_DIR/$SEARCH_TYPE"
    if [ ! -d "$SEARCH_PATH" ]; then
        echo "错误: 类型 '$SEARCH_TYPE' 不存在"
        exit 1
    fi
fi

if [ -n "$SEARCH_FREQ" ]; then
    SEARCH_PATH="$SEARCH_PATH/*/$SEARCH_FREQ"
fi

# 执行搜索
echo -e "${GREEN}搜索 '$SEARCH_TERM' 在: $SEARCH_PATH${NC}"
echo ""

# 使用 ripgrep 如果可用，否则使用 grep
if command -v rg &> /dev/null; then
    if [ -n "$COUNT_ONLY" ]; then
        rg $IGNORE_CASE --count "$SEARCH_TERM" "$SEARCH_PATH" 2>/dev/null
    else
        rg $IGNORE_CASE --color=always --heading --line-number "$SEARCH_TERM" "$SEARCH_PATH" 2>/dev/null | less -R
    fi
else
    if [ -n "$COUNT_ONLY" ]; then
        grep -r $IGNORE_CASE -c "$SEARCH_TERM" "$SEARCH_PATH" 2>/dev/null | grep -v ":0$"
    else
        grep -r $IGNORE_CASE -n --color=always "$SEARCH_TERM" "$SEARCH_PATH" 2>/dev/null | less -R
    fi
fi

# 检查搜索结果
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}未找到匹配结果${NC}"
    exit 1
fi
