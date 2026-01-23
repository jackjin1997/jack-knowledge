# Skills 知识库

扩展 Cursor 能力的技能集合，让 AI 辅助开发更强大。

## 📋 Skills 总览

当前收录 **7 个 Skills**，按领域和使用频率组织。

### 按领域浏览

- **[Development 开发工具](#development-开发工具)** - 5 个
- **[Productivity 效率工具](#productivity-效率工具)** - 1 个  
- **[AI Workflow AI 工作流](#ai-workflow-ai-工作流)** - 1 个

### 按频率浏览

- **高频使用** - 5 个（create-rule、create-skill、update-cursor-settings、skill-installer、skill-creator）
- **偶尔使用** - 2 个（migrate-to-skills、create-subagent）

## Development 开发工具

### 高频使用

#### create-rule
**创建 Cursor 规则，提供持久化 AI 指导**

- **路径**: `development/frequently-used/create-rule/`
- **系统位置**: `/Users/jinzexu/.cursor/skills-cursor/create-rule`
- **用途**: 在 `.cursor/rules/` 中创建项目规则文件
- **使用场景**:
  - 设置编码规范和风格指南
  - 定义项目特定的约定
  - 配置文件特定的 AI 行为模式
- **如何使用**: 在 Cursor 中说 "创建一个规则..."
- **[详细文档 →](development/frequently-used/create-rule/)**

#### create-skill
**创建 Cursor Agent Skills**

- **路径**: `development/frequently-used/create-skill/`
- **系统位置**: `/Users/jinzexu/.cursor/skills-cursor/create-skill`
- **用途**: 指导创建有效的 Agent Skills
- **使用场景**:
  - 创建新的技能扩展
  - 学习 Skill 编写最佳实践
  - 将工作流程标准化为可复用 Skills
- **特点**: 
  - 支持个人级和项目级 Skills
  - 渐进式披露设计指南
  - 包含完整示例
- **[详细文档 →](development/frequently-used/create-skill/)**

#### update-cursor-settings
**修改 Cursor/VSCode 用户设置**

- **路径**: `development/frequently-used/update-cursor-settings/`
- **系统位置**: `/Users/jinzexu/.cursor/skills-cursor/update-cursor-settings`
- **用途**: 更新 `settings.json` 中的编辑器配置
- **使用场景**:
  - 调整编辑器设置（主题、字体、格式化）
  - 配置扩展选项
  - 设置工作区偏好
- **支持**: macOS/Linux/Windows
- **[详细文档 →](development/frequently-used/update-cursor-settings/)**

### 偶尔使用

#### migrate-to-skills
**将 Cursor rules 和 commands 迁移到 Skills 格式**

- **路径**: `development/occasionally-used/migrate-to-skills/`
- **系统位置**: `/Users/jinzexu/.cursor/skills-cursor/migrate-to-skills`
- **用途**: 转换旧格式到新的 Skills 系统
- **使用场景**:
  - 迁移 `.cursor/rules/*.mdc`
  - 迁移 `.cursor/commands/*.md`
  - 升级项目配置
- **特点**: 
  - 保留原始内容
  - 支持撤销
  - 自动转换格式
- **[详细文档 →](development/occasionally-used/migrate-to-skills/)**

#### create-subagent
**创建自定义 Subagents 用于专门的 AI 任务**

- **路径**: `development/occasionally-used/create-subagent/`
- **系统位置**: `/Users/jinzexu/.cursor/skills-cursor/create-subagent`
- **用途**: 创建具有自定义系统提示的专门化 AI 助手
- **使用场景**:
  - 代码审查助手
  - 调试专家
  - 数据分析助手
  - 安全审计员
- **特点**:
  - 支持项目级和用户级
  - 自定义系统提示
  - 包含示例（code-reviewer、debugger、data-scientist）
- **[详细文档 →](development/occasionally-used/create-subagent/)**

## Productivity 效率工具

### 高频使用

#### skill-installer
**从精选列表或 GitHub 安装 Codex Skills**

- **路径**: `productivity/frequently-used/skill-installer/`
- **系统位置**: `/Users/jinzexu/.codex/skills/.system/skill-installer`
- **用途**: 安装和管理 Skills
- **使用场景**:
  - 列出可安装的精选 Skills
  - 从 GitHub 仓库安装 Skills
  - 安装私有仓库的 Skills
- **特点**:
  - 支持 openai/skills 精选列表
  - 支持任意 GitHub 仓库
  - 支持私有仓库访问
- **[详细文档 →](productivity/frequently-used/skill-installer/)**

## AI Workflow AI 工作流

### 高频使用

#### skill-creator
**创建有效 Skills 的指南和工具**

- **路径**: `ai-workflow/frequently-used/skill-creator/`
- **系统位置**: `/Users/jinzexu/.codex/skills/.system/skill-creator`
- **用途**: 提供创建和更新 Skills 的完整指导
- **使用场景**:
  - 学习 Skills 设计原则
  - 创建新 Skill
  - 优化现有 Skill
- **特点**:
  - 包含核心原则和最佳实践
  - 提供初始化脚本
  - 包含打包和验证工具
- **附带工具**:
  - `init_skill.py` - 初始化新 Skill
  - `package_skill.py` - 打包 Skill
  - `quick_validate.py` - 快速验证
- **[详细文档 →](ai-workflow/frequently-used/skill-creator/)**

## 🔗 实际安装位置

所有 Skills 的软链接位于 `installed/` 目录，指向系统实际安装位置：

```bash
skills/installed/
├── skill-creator -> /Users/jinzexu/.codex/skills/.system/skill-creator
├── skill-installer -> /Users/jinzexu/.codex/skills/.system/skill-installer
├── create-rule -> /Users/jinzexu/.cursor/skills-cursor/create-rule
├── create-skill -> /Users/jinzexu/.cursor/skills-cursor/create-skill
├── create-subagent -> /Users/jinzexu/.cursor/skills-cursor/create-subagent
├── migrate-to-skills -> /Users/jinzexu/.cursor/skills-cursor/migrate-to-skills
└── update-cursor-settings -> /Users/jinzexu/.cursor/skills-cursor/update-cursor-settings
```

## 📖 如何使用 Skills

### 在 Cursor 对话中使用

直接在对话中描述需求，Cursor 会自动调用相应的 Skill：

```
"创建一个规则，要求所有 TypeScript 文件使用严格模式"
-> 自动使用 create-rule skill

"帮我安装 skill-name skill"
-> 自动使用 skill-installer

"更新编辑器配置，设置 tab 大小为 2"
-> 自动使用 update-cursor-settings
```

### 使用 @ 引用

在 Cursor 中使用 `@` 符号快速引用 Skill 文档：

```
@skills/development/frequently-used/create-rule/
@skills/ai-workflow/frequently-used/skill-creator/
```

## 🎯 使用场景

### 场景 1：设置项目规范
1. 使用 `create-rule` 创建编码规范
2. 使用 `create-rule` 定义文件组织约定
3. 使用 `create-rule` 配置提交消息格式

### 场景 2：扩展功能
1. 使用 `skill-installer` 发现和安装新 Skills
2. 使用 `skill-creator` 创建自定义 Skills
3. 使用 `create-skill` 学习最佳实践

### 场景 3：团队协作
1. 使用 `create-rule` 共享团队规范
2. 使用 `update-cursor-settings` 统一开发环境
3. 使用 `create-subagent` 创建专门的审查助手

## 🔧 管理 Skills

### 查看已安装的 Skills
```bash
ls -l skills/installed/
```

### 安装新 Skill
在 Cursor 中：
```
"使用 skill-installer 列出可用的 skills"
"安装 [skill-name] skill"
```

### 更新 Skill 文档
根据实际使用经验，更新相应目录下的文档。

### 调整频率分类
根据使用频率，在 `frequently-used/`、`occasionally-used/`、`archived/` 之间移动。

## 📚 进一步学习

- **创建 Skills**: 查看 [skill-creator 文档](ai-workflow/frequently-used/skill-creator/)
- **创建规则**: 查看 [create-rule 文档](development/frequently-used/create-rule/)
- **安装更多**: 查看 [skill-installer 文档](productivity/frequently-used/skill-installer/)

## 🆕 发现新 Skills

- **官方精选**: 使用 skill-installer 查看 openai/skills 列表
- **GitHub 搜索**: 搜索 "cursor skills" 或 "codex skills"
- **社区分享**: 查看 [resources/communities.md](../resources/communities.md)

## 🔄 保持同步

使用同步脚本更新软链接和文档：

```bash
./scripts/sync-resources.sh
```

---

**开始使用**: 在 Cursor 中直接描述需求，或使用 `@skills/` 引用文档！
