# create-skill

创建 Cursor Agent Skills，扩展 AI 能力。

## 概述

`create-skill` 提供创建有效 Agent Skills 的完整指导，帮助将工作流、专业知识和工具集成标准化为可复用的 Skills。

## 系统位置

- **安装路径**: `/Users/jinzexu/.cursor/skills-cursor/create-skill`
- **文档路径**: `skills/development/frequently-used/create-skill/`

## Skills 是什么

Skills 是模块化、自包含的包，通过提供专业知识、工作流和工具来扩展 Cursor 的能力。可以把它们看作特定领域或任务的"入职指南"。

### Skills 提供什么

1. **专业工作流** - 特定领域的多步骤流程
2. **工具集成** - 处理特定文件格式或 API 的说明
3. **领域专业知识** - 公司特定知识、架构、业务逻辑
4. **捆绑资源** - 脚本、参考文件、资产等

## 使用方法

### 在 Cursor 中使用

```
"帮我创建一个 skill 用于处理 GraphQL schema"
"创建一个 skill 来规范 API 文档流程"
"写一个 skill 教 AI 如何使用我们的测试框架"
```

### Skill 级别

#### 个人级 Skills
```bash
~/.cursor/skills/my-skill/
└── SKILL.md
```
- 存储在用户目录
- 在所有项目中可用
- 适合个人工作流和偏好

#### 项目级 Skills
```bash
project/.cursor/skills/my-skill/
└── SKILL.md
```
- 存储在项目目录
- 仅在该项目中可用
- 适合项目特定的工作流
- 可以与团队共享（通过 git）

## 核心原则

### 1. 简洁是关键

上下文窗口是公共资源。Skills 与其他所有内容共享：系统提示、对话历史、用户请求等。

**默认假设：Cursor 已经很聪明**
- 只添加 Cursor 不知道的上下文
- 挑战每条信息："Cursor 真的需要这个解释吗？"
- 优先使用简洁示例而非冗长解释

### 2. 设置适当的自由度

根据任务的脆弱性和可变性匹配详细程度：

- **高自由度（文本指令）**: 多种方法都有效，决策取决于上下文
- **中等自由度（伪代码）**: 有首选模式，但允许一些变化
- **低自由度（具体脚本）**: 操作脆弱易错，必须遵循特定顺序

### 3. 渐进式披露

```markdown
# 标题（立即看到）

## 概述（快速理解）
简短的 1-2 句描述

## 使用方法（常用场景）
最常见的用法

## 详细说明（按需展开）
详细的选项和高级用法
```

## Skill 结构

### 必需文件：SKILL.md

```markdown
---
name: skill-name
description: 简短描述（一句话）
metadata:
  short-description: 更短的描述
---

# Skill 标题

## 概述
简短说明（1-2 句）

## 使用方法
基本用法说明

## 详细说明
详细的步骤、选项、示例

## 示例
具体的代码示例

## 注意事项
重要提醒和限制
```

### 可选：捆绑资源

```
my-skill/
├── SKILL.md           # 必需
├── scripts/           # 可选：辅助脚本
├── references/        # 可选：参考文件
└── assets/           # 可选：其他资源
```

## 使用场景

### 场景 1：标准化测试流程

```markdown
---
name: run-tests
description: Execute project tests with proper configuration
---

# Run Tests

## Usage
Ask: "Run tests for [component/file]"

## Steps
1. Check test file existence
2. Run with appropriate command:
   - Unit: `npm test -- [file]`
   - Integration: `npm run test:integration`
   - E2E: `npm run test:e2e`
3. Parse and report results

## Configuration
Tests use Jest. Config in `jest.config.js`.
```

### 场景 2：集成自定义工具

```markdown
---
name: deploy-preview
description: Deploy preview environment using company tools
---

# Deploy Preview

## Usage
Ask: "Deploy a preview for this branch"

## Steps
1. Run: `./scripts/deploy-preview.sh [branch-name]`
2. Wait for deployment (2-3 minutes)
3. Return preview URL
4. Run smoke tests if requested

## Script Details
The script (scripts/deploy-preview.sh):
- Builds Docker image
- Pushes to staging registry
- Creates k8s resources
- Returns URL when ready
```

### 场景 3：领域知识

```markdown
---
name: graphql-schema
description: Work with our GraphQL schema conventions
---

# GraphQL Schema Guidelines

## Schema Organization
- Types: `schema/types/`
- Resolvers: `schema/resolvers/`
- Directives: `schema/directives/`

## Naming Conventions
- Types: PascalCase (e.g., `UserProfile`)
- Fields: camelCase (e.g., `firstName`)
- Mutations: verb + noun (e.g., `createUser`)
- Queries: noun or get + noun (e.g., `users`, `getUser`)

## Required Patterns
1. All mutations return a Result type:
   \`\`\`graphql
   type CreateUserResult {
     success: Boolean!
     user: User
     error: Error
   }
   \`\`\`

2. All lists support pagination (reference: `schema/pagination.graphql`)

## Example
\`\`\`graphql
type Query {
  users(page: PageInput): UsersConnection!
}

type Mutation {
  createUser(input: CreateUserInput!): CreateUserResult!
}
\`\`\`
```

## 最佳实践

### 1. 从用户视角写作
```markdown
✅ "Ask: 'Deploy a preview'"
❌ "This skill handles preview deployments"
```

### 2. 包含具体示例
```markdown
✅ 
\`\`\`typescript
// Good: explicit types
function getUser(id: string): Promise<User> {
  return db.users.findById(id);
}
\`\`\`

❌ "Always use explicit types"
```

### 3. 捆绑必要的脚本
如果流程复杂且易错，提供脚本而不是文本说明

### 4. 引用而非复制
```markdown
✅ "See API schema: schema/api.graphql"
❌ [粘贴整个 schema 文件]
```

### 5. 测试 Skill
创建后在实际任务中测试，根据反馈优化

## 创建 Skill 的步骤

### 1. 识别需求
- 是否有重复的工作流？
- 是否有 AI 不知道的领域知识？
- 是否有需要精确执行的工具？

### 2. 确定范围
- 个人使用还是团队共享？
- 需要捆绑哪些资源？
- 需要多少细节？

### 3. 创建文件结构
```bash
# 个人 Skill
mkdir -p ~/.cursor/skills/my-skill

# 项目 Skill
mkdir -p .cursor/skills/my-skill
```

### 4. 编写 SKILL.md
遵循上述格式和原则

### 5. 添加资源（如需要）
```bash
my-skill/
├── SKILL.md
├── scripts/
│   └── helper.sh
└── references/
    └── api-spec.yaml
```

### 6. 测试和迭代
在实际任务中使用，根据效果调整

## 示例 Skills

### 最小 Skill
```markdown
---
name: code-review-checklist
description: Checklist for code reviews
---

# Code Review Checklist

When reviewing code, check:

1. **Correctness**: Logic is sound
2. **Tests**: New code has tests
3. **Style**: Follows project conventions (see: .cursor/rules/)
4. **Security**: No vulnerabilities
5. **Performance**: No obvious bottlenecks
6. **Documentation**: Complex logic is documented

Focus on important issues, not nitpicks.
```

### 完整 Skill
参考 `skill-creator` 本身的实现：
- `/Users/jinzexu/.codex/skills/.system/skill-creator/SKILL.md`

## 注意事项

1. **避免过度设计**：从简单开始，根据需要扩展
2. **保持同步**：工作流变化时更新 Skill
3. **团队共识**：项目级 Skill 需要团队认可
4. **版本控制**：项目 Skills 纳入 git

## 相关资源

- [skill-creator](../../../ai-workflow/frequently-used/skill-creator/) - 创建 Skills 的完整指南
- [create-rule](../create-rule/) - 创建简单的规则文件
- [示例 Skills](https://github.com/openai/skills) - 官方示例

---

**开始创建**: 在 Cursor 中说 "帮我创建一个 skill..." 即可开始！
