# Jack Knowledge Hub 🧠

个人知识库项目，集成和管理各类开发资源，包括 Skills、MCP、Prompts、工作流、代码片段等，让 AI 辅助开发更高效。

## 📚 项目结构

```
jack-knowledge/
├── skills/           # Skills 知识库 - 扩展 Cursor 能力的技能
├── mcp/             # MCP 资源库 - Model Context Protocol 集成
├── prompts/         # Prompt 模板库 - 常用对话模板
├── workflows/       # 工作流库 - 开发最佳实践
├── snippets/        # 代码片段库 - 常用代码模式
├── resources/       # 外部资源索引 - 文档、工具、社区
├── decision-making/ # 个人决策系统 - AI 引导式决策支持
├── templates/       # 模板文件 - 快速创建新内容
└── scripts/         # 实用脚本 - 自动化工具
```

## 🚀 快速开始

### 查找资源

在 Cursor 中，使用 `@` 符号快速引用任何资源：

```
@skills/development/frequently-used/create-rule
@prompts/coding/frequently-used/implement-feature.md
@mcp/location-services/amap-maps/
```

### 按类型浏览

- **[Skills →](skills/)** - **30+ 个精选技能** 🆕，涵盖 7 大领域（开发、效率、AI 工作流、商业、沟通、创意、数据分析）
  - 📋 [完整列表](skills/README.md) | 🚀 [快速参考](skills/QUICK_REFERENCE.md) | 🆕 [新增说明](skills/NEWLY_ADDED.md)
- **[MCP →](mcp/)** - 已集成高德地图等服务，13+ 个工具
- **[Prompts →](prompts/)** - 编码、调试、重构、文档等场景的模板
- **[Workflows →](workflows/)** - 功能开发、测试、部署的完整流程
- **[Snippets →](snippets/)** - JavaScript、Python、Shell 等常用代码
- **[Resources →](resources/)** - 精选的文档、教程、工具、社区链接
- **[Decision Making →](decision-making/)** - 个人决策系统，AI 引导式探索和复盘

### 按频率浏览

每个类别按使用频率组织：
- `frequently-used/` - 高频使用，快速访问
- `occasionally-used/` - 偶尔使用，按需查阅
- `archived/` - 收藏备用，长期参考

## 💡 使用场景

### 场景 1：实现新功能
```bash
1. 查阅 prompts/coding/frequently-used/implement-feature.md
2. 参考 workflows/development/frequently-used/feature-development.md
3. 使用 skills/development/frequently-used/create-rule 设置项目规则
```

### 场景 2：集成地图功能
```bash
1. 查看 mcp/location-services/amap-maps/README.md
2. 在 Cursor 中调用 MCP 工具（地理编码、路径规划等）
3. 参考示例代码快速集成
```

### 场景 3：代码重构
```bash
1. 使用 prompts/refactoring/frequently-used/clean-code.md
2. 参考 snippets/ 中的最佳实践代码
3. 按照 workflows/development/frequently-used/code-refactoring.md 执行
```

### 场景 4：个人决策
```bash
1. 使用 decision-making/coaches/self-discovery-coach.md 开始探索
2. 参考 decision-making/methods/ 使用合适的方法
3. 用 decision-making/frameworks/decision-journal.md 记录决策
4. 定期用 decision-making/frameworks/reflection-template.md 复盘
```

## 🔍 搜索技巧

### 使用 Cursor 搜索
- `Cmd/Ctrl + P` - 快速打开文件
- `Cmd/Ctrl + Shift + F` - 全文搜索
- `@` 符号 - 在对话中引用文件

### 使用命令行搜索
```bash
# 搜索所有 Prompts
./scripts/search-knowledge.sh "代码审查"

# 查找特定类型的资源
find skills/ -name "*.md" | grep "frequently-used"
```

## 📖 详细文档

- [快速开始指南](docs/quick-start.md) - 5 分钟上手
- [架构说明](docs/architecture.md) - 了解组织原则
- [贡献指南](docs/contributing.md) - 如何添加新资源

## 🛠️ 维护工具

### 同步系统资源
```bash
# 同步最新的 Skills 和 MCP 配置
./scripts/sync-resources.sh
```

### 安装新 Skill
```bash
# 使用辅助脚本安装
./scripts/install-skill.sh <skill-name>

# 或使用 skill-installer
# 在 Cursor 中：使用 @skills/productivity/frequently-used/skill-installer
```

## 🎯 核心理念

### 混合模式
- **实际集成** - Skills 和 MCP 即装即用
- **完整文档** - 每个资源都有详细说明和示例

### 三级组织
- **类型** - 按功能分类（Skills、MCP、Prompts 等）
- **领域** - 按应用场景分类（开发、测试、部署等）
- **频率** - 按使用频率分类（高频、偶尔、收藏）

### 深度集成 Cursor
- 所有资源通过 `@` 符号即可引用
- Prompt 模板直接在对话中使用
- Skills 和 MCP 无缝工作

## 📊 当前统计

- **Skills**: **30+ 个精选技能** 🆕（来自 awesome-claude-skills 社区）
  - AI Workflow: 4 个
  - Development: 10 个
  - Productivity: 7 个
  - Business: 3 个 🆕
  - Communication: 3 个 🆕
  - Creative: 5 个 🆕
  - Data Analysis: 1 个 🆕
- **MCP Servers**: 1 个（高德地图，13 个工具）
- **Prompts**: 8+ 个常用模板
- **Workflows**: 8+ 个标准流程
- **Snippets**: 多语言代码片段库
- **Resources**: 精选外部资源索引
- **Decision System**: 4 个教练 + 4 个方法 + 完整记录复盘系统

### 🎉 最新更新（2026-01-26）

从 [awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) 精选并引入 **23 个高质量 Skills**：

**亮点功能**:
- ⚡ **connect-apps** - 连接 500+ 外部应用（Gmail、Slack、GitHub、Notion 等）
- 📋 **changelog-generator** - 自动生成用户友好的变更日志
- 🧪 **webapp-testing** - 使用 Playwright 进行自动化测试
- 📝 **content-research-writer** - 辅助研究和撰写高质量内容
- 📂 **file-organizer** - 智能文件整理和去重
- 🎨 **canvas-design** - 创建精美的视觉设计（含 80+ 字体）
- 🔌 **mcp-builder** - 创建 MCP 服务器的完整指南

查看 [新增 Skills 完整说明](skills/NEWLY_ADDED.md) 了解详情。

## 🔄 持续更新

- 定期从社区发现新 Skills 和 MCP
- 收集实际使用中的有效 Prompts
- 根据使用频率调整资源分类
- 添加更多领域的工作流和最佳实践

## 📝 许可

本项目为个人知识库，供学习和参考使用。

---

**开始探索**: 从 [快速开始指南](docs/quick-start.md) 开始，或直接浏览 [Skills 目录](skills/)！
