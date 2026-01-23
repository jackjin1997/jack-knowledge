# 贡献指南

如何向 Jack Knowledge Hub 添加新资源，让知识库持续成长。

## 🎯 贡献原则

### 质量优先
- ✅ 经过验证的、有效的资源
- ✅ 清晰的文档和示例
- ✅ 通用性强，可复用
- ❌ 避免过于特定的、一次性的内容

### 组织规范
- 按**类型 > 领域 > 频率**三级组织
- 使用统一的文档格式
- 保持目录结构清晰

### 实用性
- 专注于实际工作中的需求
- 提供完整的使用示例
- 包含必要的注意事项

## 📝 添加新 Prompt

### 1. 选择合适的位置

```bash
# 确定类型和领域
prompts/
├── coding/          # 编码相关
├── debugging/       # 调试相关
├── refactoring/     # 重构相关
└── documentation/   # 文档相关

# 确定频率（初始可以放在 occasionally-used，后续根据实际使用调整）
coding/
├── frequently-used/
├── occasionally-used/   # 新 Prompt 建议先放这里
└── archived/
```

### 2. 复制模板

```bash
cp templates/prompt-template.md \
   prompts/coding/occasionally-used/my-new-prompt.md
```

### 3. 编写内容

```markdown
# Prompt 名称

## 用途
简短描述这个 Prompt 的用途

## 使用场景
- 场景 1
- 场景 2

## Prompt 模板

\`\`\`
[具体的 Prompt 内容]
\`\`\`

## 使用示例

### 输入
\`\`\`
示例输入
\`\`\`

### 预期输出
\`\`\`
示例输出
\`\`\`

## 变体

### 变体 1：[描述]
\`\`\`
变体内容
\`\`\`

## 注意事项
- 注意事项 1
- 注意事项 2

## 相关资源
- [相关 Prompt](../other-prompt.md)
- [相关 Workflow](../../workflows/...)
```

### 4. 测试和验证

在 Cursor 中测试：
```
1. 使用 @ 引用新 Prompt
2. 在实际任务中测试效果
3. 根据反馈调整内容
4. 使用 3-5 次后，根据频率调整位置
```

## 🛠️ 添加新 Skill

### 1. 安装 Skill

```bash
# 方法 1：使用 skill-installer
# 在 Cursor 中：使用 skill-installer 安装 <skill-name>

# 方法 2：使用脚本
./scripts/install-skill.sh <skill-name>

# 方法 3：手动安装（参考官方文档）
```

### 2. 创建文档

```bash
# 确定领域和频率
mkdir -p skills/development/occasionally-used/new-skill/

# 创建文档
touch skills/development/occasionally-used/new-skill/README.md
```

### 3. 编写文档内容

```markdown
# Skill 名称

## 概述
Skill 的功能概述

## 安装位置
- 系统路径：`/path/to/skill`
- 文档路径：`skills/domain/frequency/skill-name/`

## 功能说明
- 功能 1
- 功能 2

## 使用方法

### 在 Cursor 中使用
\`\`\`
描述如何在 Cursor 中调用这个 Skill
\`\`\`

### 命令行使用（如适用）
\`\`\`bash
命令示例
\`\`\`

## 使用场景
1. 场景 1：描述
2. 场景 2：描述

## 配置选项（如适用）
\`\`\`json
{
  "option1": "value1",
  "option2": "value2"
}
\`\`\`

## 示例

### 示例 1：基本用法
\`\`\`
示例代码
\`\`\`

### 示例 2：高级用法
\`\`\`
示例代码
\`\`\`

## 注意事项
- 注意事项 1
- 注意事项 2

## 相关资源
- [官方文档](链接)
- [相关 Skill](../other-skill/)
```

### 4. 创建软链接（可选）

```bash
# 如果 Skill 已安装在系统中，创建软链接方便访问
ln -s /actual/path/to/skill skills/installed/skill-name
```

### 5. 更新索引

编辑 `skills/README.md`，添加新 Skill 到相应部分。

## 🌐 添加新 MCP Server

### 1. 安装和配置 MCP Server

按照 MCP Server 的官方文档进行安装和配置。

### 2. 创建文档目录

```bash
# 确定服务类型
mkdir -p mcp/service-type/server-name/
```

### 3. 编写主文档

```bash
# 创建 README.md
cat > mcp/service-type/server-name/README.md << 'EOF'
# Server 名称

## 概述
简短描述这个 MCP Server 的功能

## 服务信息
- **Server ID**: `server-id`
- **服务类型**: 服务类型
- **官方文档**: [链接]

## 功能列表
1. 功能 1
2. 功能 2
3. ...

## 安装配置

### 安装
\`\`\`bash
安装命令
\`\`\`

### 配置
\`\`\`json
{
  "配置": "示例"
}
\`\`\`

## 工具说明

### 工具 1
- **用途**: 描述
- **参数**: 
  - `param1` (必需): 说明
  - `param2` (可选): 说明
- **示例**:
  \`\`\`
  示例代码
  \`\`\`

### 工具 2
...

## 使用场景
1. 场景 1
2. 场景 2

## 注意事项
- API 密钥配置
- 使用限制
- 最佳实践

## 相关资源
- [官方文档](链接)
EOF
```

### 4. 详细文档（按功能分类）

为复杂的 MCP Server 创建分类文档：

```bash
# 地理编码功能
touch mcp/service-type/server-name/geocoding.md

# 搜索功能
touch mcp/service-type/server-name/search.md

# 使用示例
touch mcp/service-type/server-name/examples.md
```

### 5. 更新活跃服务列表

编辑 `mcp/active-servers.md`：

```markdown
# 当前激活的 MCP Servers

## 服务类型 1

### Server 名称
- **状态**: ✅ 激活
- **位置**: [文档](./service-type/server-name/)
- **工具数量**: X 个
- **最后更新**: YYYY-MM-DD
```

## 📚 添加新 Workflow

### 1. 确定领域和频率

```bash
workflows/
├── development/
├── testing/
└── deployment/
```

### 2. 创建文档

```bash
cp templates/workflow-template.md \
   workflows/development/occasionally-used/my-workflow.md
```

### 3. 编写内容

```markdown
# Workflow 名称

## 目标
简述这个工作流的目标

## 适用场景
- 场景 1
- 场景 2

## 前置条件
- 条件 1
- 条件 2

## 步骤

### 1. 步骤名称
**目标**: 描述

**操作**:
1. 子步骤 1
2. 子步骤 2

**检查点**:
- [ ] 检查项 1
- [ ] 检查项 2

**相关资源**:
- [@prompts/coding/...](../../prompts/...)
- [@skills/development/...](../../skills/...)

### 2. 步骤名称
...

## 常见问题

### 问题 1
**现象**: 描述
**原因**: 分析
**解决**: 方案

## 相关资源
- [相关 Workflow](./other-workflow.md)
- [相关 Prompt](../../prompts/...)
```

## 💻 添加新 Code Snippet

### 1. 选择语言目录

```bash
snippets/
├── javascript/
├── python/
├── shell/
└── configs/
```

### 2. 创建或编辑文件

```bash
# 添加到现有文件
vim snippets/javascript/utility-functions.md

# 或创建新文件
touch snippets/javascript/new-category.md
```

### 3. 编写代码片段

```markdown
# 类别名称

## 功能 1

### 用途
简短描述

### 代码
\`\`\`javascript
// 清晰的注释说明
function example() {
  // 实现
}
\`\`\`

### 使用示例
\`\`\`javascript
// 使用方式
example();
\`\`\`

### 注意事项
- 注意事项 1
- 注意事项 2

## 功能 2
...
```

## 🔗 添加外部资源

### 编辑相应的资源文件

```bash
# 文档链接
vim resources/documentation.md

# 教程资源
vim resources/tutorials.md

# 工具推荐
vim resources/tools.md

# 社区资源
vim resources/communities.md
```

### 格式规范

```markdown
## 类别

### 资源名称
- **URL**: https://example.com
- **描述**: 简短描述
- **语言**: 中文/English
- **更新频率**: 定期/不定期
- **推荐理由**: 为什么推荐

### 另一个资源
...
```

## 🔄 频率调整

根据实际使用情况，调整资源的频率分类：

```bash
# 从 occasionally-used 移到 frequently-used
mv prompts/coding/occasionally-used/my-prompt.md \
   prompts/coding/frequently-used/

# 从 frequently-used 归档到 archived
mv prompts/coding/frequently-used/old-prompt.md \
   prompts/coding/archived/
```

**调整原则**：
- **frequently-used**: 每周使用 3+ 次
- **occasionally-used**: 每月使用 1-3 次
- **archived**: 很少使用，但值得保留

## 🧪 测试清单

在添加新资源前，确保：

- [ ] 文档格式符合规范
- [ ] 包含清晰的使用示例
- [ ] 在 Cursor 中测试 @ 引用
- [ ] 检查相关链接的有效性
- [ ] 归档到正确的目录（类型/领域/频率）
- [ ] 更新相应的 README.md 索引
- [ ] 提交 git commit（如使用版本控制）

## 📋 文档模板

所有模板文件位于 `templates/` 目录：
- `prompt-template.md` - Prompt 模板
- `skill-template.md` - Skill 文档模板
- `mcp-integration.md` - MCP 集成模板
- `workflow-template.md` - Workflow 模板

## 🤝 最佳实践

### 命名规范
- 使用小写字母和连字符：`my-resource-name.md`
- 目录名使用小写：`frequently-used/`
- 简洁但描述性强

### 文档风格
- 使用 Markdown 格式
- 代码块标注语言
- 使用相对链接引用其他资源
- 包含具体示例

### 维护
- 定期检查链接有效性
- 更新过时的内容
- 根据使用情况调整分类
- 删除不再使用的资源

## 🆘 需要帮助？

- 查看 [快速开始指南](quick-start.md)
- 参考 [架构说明](architecture.md)
- 查看现有资源作为示例
- 在 Cursor 中提问："如何向知识库添加新资源？"

---

开始贡献：选择要添加的资源类型，使用相应的模板！
