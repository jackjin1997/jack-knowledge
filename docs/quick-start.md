# 快速开始指南

5 分钟快速上手 Jack Knowledge Hub，让 AI 辅助开发更高效。

## 🎯 第一步：了解结构

Jack Knowledge Hub 按照**类型 > 领域 > 频率**的三级结构组织：

```
📦 类型（功能分类）
 └── 📂 领域（应用场景）
      ├── ⭐ frequently-used/    # 高频使用
      ├── 💡 occasionally-used/  # 偶尔使用
      └── 📚 archived/           # 收藏备用
```

## 🚀 第二步：探索资源

### Skills - 扩展 Cursor 能力

```bash
# 查看所有可用 Skills
ls skills/

# 高频使用的开发 Skills
ls skills/development/frequently-used/
# -> create-rule, create-skill, update-cursor-settings
```

**立即尝试**：在 Cursor 中输入 `使用 create-rule skill 创建项目规则`

### MCP - 调用外部工具

```bash
# 查看已集成的 MCP 服务
cat mcp/active-servers.md

# 高德地图功能
ls mcp/location-services/amap-maps/
```

**立即尝试**：在 Cursor 中输入 `使用高德地图查询北京天气`

### Prompts - 对话模板

```bash
# 编码相关 Prompts
ls prompts/coding/frequently-used/
# -> implement-feature.md, code-review.md, test-generation.md
```

**立即尝试**：查看 `@prompts/coding/frequently-used/implement-feature.md`

## 💡 第三步：实战场景

### 场景 A：开发新功能

1. **规划**：使用 Prompt 模板
   ```
   在 Cursor 中：@prompts/coding/frequently-used/implement-feature.md
   ```

2. **实施**：参考工作流
   ```
   查看：@workflows/development/frequently-used/feature-development.md
   ```

3. **规范**：创建项目规则
   ```
   使用 @skills/development/frequently-used/create-rule
   ```

### 场景 B：代码审查

1. **使用 Prompt 模板**
   ```
   @prompts/coding/frequently-used/code-review.md
   ```

2. **参考代码片段**
   ```
   @snippets/javascript/error-handling.md
   ```

### 场景 C：调试问题

1. **分析错误**
   ```
   @prompts/debugging/frequently-used/error-analysis.md
   ```

2. **性能优化**
   ```
   @prompts/debugging/frequently-used/performance-optimization.md
   ```

## 🔍 第四步：高效搜索

### 在 Cursor 中搜索

**方法 1：使用 @ 符号**
```
# 直接引用
@skills/development/
@prompts/coding/
@mcp/location-services/
```

**方法 2：使用搜索快捷键**
- `Cmd/Ctrl + P` - 快速打开文件
- `Cmd/Ctrl + Shift + F` - 全文搜索
- `Cmd/Ctrl + T` - 跳转到符号

### 在命令行搜索

```bash
# 搜索关键词
./scripts/search-knowledge.sh "地理编码"

# 查找特定类型
find prompts/ -name "*.md" -type f

# 搜索高频资源
find . -path "*/frequently-used/*" -name "*.md"
```

## 🛠️ 第五步：添加资源

### 添加新 Prompt

```bash
# 1. 复制模板
cp templates/prompt-template.md prompts/coding/frequently-used/my-prompt.md

# 2. 编辑内容
# 3. 在 Cursor 中测试
# 4. 根据使用频率调整位置
```

### 安装新 Skill

```bash
# 使用 skill-installer
# 在 Cursor 中：使用 skill-installer 安装新 skill

# 或使用脚本
./scripts/install-skill.sh <skill-name>
```

### 添加新 MCP Server

```bash
# 1. 参考模板
cat templates/mcp-integration.md

# 2. 创建文档目录
mkdir -p mcp/new-category/new-server

# 3. 编写文档
# 4. 更新 mcp/active-servers.md
```

## 📚 下一步

### 深入学习
- 阅读 [架构说明](architecture.md) 了解设计理念
- 查看 [贡献指南](contributing.md) 学习如何扩展

### 探索更多
- 浏览 [Skills 目录](../skills/) 了解所有可用技能
- 查看 [Workflows](../workflows/) 学习最佳实践
- 探索 [Resources](../resources/) 发现更多工具

### 自定义配置
- 调整目录结构适应个人习惯
- 添加项目特定的 Prompts
- 集成团队常用的工具和流程

## 💡 最佳实践

1. **定期同步**
   ```bash
   ./scripts/sync-resources.sh
   ```

2. **按频率组织**
   - 经常使用的放在 `frequently-used/`
   - 根据实际使用调整分类

3. **充分利用 @ 引用**
   - 在 Cursor 对话中直接引用资源
   - 减少重复输入，提高效率

4. **持续积累**
   - 记录有效的 Prompts
   - 收集优秀的代码片段
   - 分享团队的最佳实践

## 🆘 遇到问题？

- 查看各目录的 README.md 获取详细说明
- 参考 [architecture.md](architecture.md) 了解设计原则
- 在 Cursor 中提问："如何使用 jack-knowledge 中的资源？"

---

**准备好了吗？** 开始探索 [Skills 目录](../skills/) 或 [Prompts 库](../prompts/)！
