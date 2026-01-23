#!/bin/bash
# 同步系统 Skills 和 MCP 配置到知识库

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}=== Jack Knowledge Hub 资源同步 ===${NC}"
echo ""

# 1. 同步 Skills 软链接
echo -e "${GREEN}[1/3] 同步 Skills 软链接...${NC}"

SKILLS_INSTALLED="$ROOT_DIR/skills/installed"

# 检查并创建软链接
declare -A SKILLS_MAP
SKILLS_MAP["skill-creator"]="/Users/jinzexu/.codex/skills/.system/skill-creator"
SKILLS_MAP["skill-installer"]="/Users/jinzexu/.codex/skills/.system/skill-installer"
SKILLS_MAP["create-rule"]="/Users/jinzexu/.cursor/skills-cursor/create-rule"
SKILLS_MAP["create-skill"]="/Users/jinzexu/.cursor/skills-cursor/create-skill"
SKILLS_MAP["create-subagent"]="/Users/jinzexu/.cursor/skills-cursor/create-subagent"
SKILLS_MAP["migrate-to-skills"]="/Users/jinzexu/.cursor/skills-cursor/migrate-to-skills"
SKILLS_MAP["update-cursor-settings"]="/Users/jinzexu/.cursor/skills-cursor/update-cursor-settings"

for skill in "${!SKILLS_MAP[@]}"; do
    target="${SKILLS_MAP[$skill]}"
    link="$SKILLS_INSTALLED/$skill"
    
    if [ -L "$link" ]; then
        if [ "$(readlink "$link")" = "$target" ]; then
            echo -e "  ✓ $skill ${YELLOW}(已存在)${NC}"
        else
            echo -e "  ↻ $skill ${YELLOW}(更新链接)${NC}"
            rm "$link"
            ln -s "$target" "$link"
        fi
    elif [ -e "$link" ]; then
        echo -e "  ${RED}✗ $skill (存在同名文件，跳过)${NC}"
    else
        if [ -e "$target" ]; then
            ln -s "$target" "$link"
            echo -e "  ${GREEN}✓ $skill (新建)${NC}"
        else
            echo -e "  ${RED}✗ $skill (源不存在: $target)${NC}"
        fi
    fi
done

echo ""

# 2. 检查 MCP Servers
echo -e "${GREEN}[2/3] 检查 MCP Servers...${NC}"

MCP_DIR="/Users/jinzexu/.cursor/projects/Users-jinzexu-workspace-codes-practise-jack-knowledge/mcps"

if [ -d "$MCP_DIR" ]; then
    SERVER_COUNT=$(find "$MCP_DIR" -maxdepth 1 -type d | tail -n +2 | wc -l | tr -d ' ')
    echo -e "  找到 ${GREEN}$SERVER_COUNT${NC} 个 MCP Server(s)"
    
    for server_dir in "$MCP_DIR"/*; do
        if [ -d "$server_dir" ]; then
            server_name=$(basename "$server_dir")
            echo -e "  ✓ $server_name"
        fi
    done
else
    echo -e "  ${YELLOW}MCP 目录不存在${NC}"
fi

echo ""

# 3. 生成统计报告
echo -e "${GREEN}[3/3] 生成统计报告...${NC}"

# 统计各类资源数量
SKILLS_COUNT=$(find "$ROOT_DIR/skills" -name "README.md" -type f | wc -l | tr -d ' ')
MCP_COUNT=$(find "$ROOT_DIR/mcp" -name "README.md" -type f | wc -l | tr -d ' ')
PROMPTS_COUNT=$(find "$ROOT_DIR/prompts" -name "*.md" -not -name "README.md" -type f | wc -l | tr -d ' ')
WORKFLOWS_COUNT=$(find "$ROOT_DIR/workflows" -name "*.md" -not -name "README.md" -type f | wc -l | tr -d ' ')
SNIPPETS_COUNT=$(find "$ROOT_DIR/snippets" -name "*.md" -type f | wc -l | tr -d ' ')

echo ""
echo -e "${BLUE}=== 资源统计 ===${NC}"
echo -e "  Skills:    ${GREEN}$SKILLS_COUNT${NC} 个文档"
echo -e "  MCP:       ${GREEN}$MCP_COUNT${NC} 个文档"
echo -e "  Prompts:   ${GREEN}$PROMPTS_COUNT${NC} 个模板"
echo -e "  Workflows: ${GREEN}$WORKFLOWS_COUNT${NC} 个流程"
echo -e "  Snippets:  ${GREEN}$SNIPPETS_COUNT${NC} 个片段"
echo ""

echo -e "${GREEN}✓ 同步完成！${NC}"
