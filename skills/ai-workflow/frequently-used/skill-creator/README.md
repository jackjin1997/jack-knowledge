# skill-creator

创建有效 Skills 的完整指南和工具。

## 概述

`skill-creator` 提供创建和更新 Skills 的完整指导，包括核心原则、最佳实践、工作流程和辅助工具。

## 系统位置

- **安装路径**: `/Users/jinzexu/.codex/skills/.system/skill-creator`
- **文档路径**: `skills/ai-workflow/frequently-used/skill-creator/`

## 功能说明

- 提供 Skill 设计原则
- 教授 Skill 编写最佳实践
- 提供初始化脚本
- 提供打包和验证工具
- 包含完整的示例和模板

## 附带工具

### 1. init_skill.py
初始化新 Skill 的结构

```bash
python init_skill.py my-new-skill
```

创建：
```
my-new-skill/
├── SKILL.md
├── scripts/
├── references/
└── README.md
```

### 2. package_skill.py
打包 Skill 用于分发

```bash
python package_skill.py my-skill
```

生成：
```
my-skill.zip
├── SKILL.md
├── scripts/
├── references/
└── README.md
```

### 3. quick_validate.py
快速验证 Skill 格式

```bash
python quick_validate.py my-skill/SKILL.md
```

检查：
- YAML frontmatter 格式
- 必需字段
- Markdown 语法
- 文件引用

## 使用方法

### 在 Cursor 中使用

**学习 Skill 创建**：
```
"教我如何创建一个 skill"
"skill 的最佳实践是什么"
```

**创建新 Skill**：
```
"帮我创建一个 skill 用于 [具体用途]"
"使用 skill-creator 创建一个 [描述] skill"
```

**优化现有 Skill**：
```
"帮我优化这个 skill，让它更简洁"
"审查我的 skill，提供改进建议"
```

## 核心原则

### 1. 简洁是关键

**上下文窗口是公共资源**

Skills 与其他内容共享上下文：
- 系统提示
- 对话历史
- 其他 Skills 的元数据
- 用户请求

**默认假设：Codex 已经很聪明**
```markdown
✅ 只添加 Codex 不知道的上下文
✅ 优先使用简洁示例
❌ 避免冗长解释
❌ 不重复常识
```

**示例对比**：

```markdown
❌ 冗长版本：
TypeScript 是一种由微软开发的编程语言，它是 JavaScript 的超集，
添加了静态类型系统。类型系统帮助在编译时捕获错误，而不是在运行时。
在 TypeScript 中，你应该为所有变量和函数参数添加类型注解...

✅ 简洁版本：
TypeScript: 为所有函数参数和返回值添加类型：

\`\`\`typescript
function getUser(id: string): Promise<User> {
  return db.users.findById(id);
}
\`\`\`
```

### 2. 设置适当的自由度

根据任务特性选择详细程度：

**高自由度（文本指令）**：
```markdown
检查代码质量：
- 逻辑正确性
- 可读性
- 最佳实践
```
**适用**：多种方法都有效，需要上下文判断

**中等自由度（伪代码/模式）**：
```markdown
部署流程：
1. 运行测试：`npm test`
2. 构建：`npm run build`
3. 部署：`./scripts/deploy.sh [env]`
   - 环境可选：staging, production
```
**适用**：有首选模式，但允许一些变化

**低自由度（具体脚本）**：
```python
# scripts/deploy.py
def deploy(environment):
    # 精确的步骤，不要修改
    validate_env(environment)
    run_tests()
    build_artifacts()
    push_to_registry()
    deploy_to_k8s(environment)
```
**适用**：操作脆弱易错，必须精确执行

### 3. 渐进式披露

```markdown
# 标题                          ← 立即看到

## 概述                         ← 快速理解
1-2 句简短描述

## 使用方法                     ← 常用场景
最常见的用法

## 详细说明                     ← 按需展开
### 选项 A
### 选项 B
### 高级用法

## 示例                         ← 具体参考
完整的代码示例

## 故障排查                     ← 解决问题
常见问题和解决方案
```

## Skill 结构

### 最小 Skill

```markdown
---
name: skill-name
description: One-line description
---

# Skill Title

## Usage
How to use this skill

## Details
Important information Codex needs
```

### 完整 Skill

```markdown
---
name: skill-name
description: One-line description
metadata:
  short-description: Even shorter
  version: 1.0.0
  author: Your Name
  tags: [tag1, tag2]
---

# Skill Title

## Overview
1-2 sentence summary

## Usage
Basic usage instructions

## Detailed Guide
### Option A
### Option B

## Examples
### Example 1
### Example 2

## Configuration
Optional settings

## Troubleshooting
Common issues and solutions

## Related
- [Other Skill](../other-skill/)
- [Documentation](https://...)
```

### 带资源的 Skill

```
my-skill/
├── SKILL.md                    # 主文档（必需）
├── README.md                   # 说明文档（推荐）
├── scripts/                    # 辅助脚本
│   ├── helper.sh
│   └── validator.py
├── references/                 # 参考文件
│   ├── api-spec.yaml
│   └── example-config.json
└── assets/                     # 其他资源
    └── diagram.png
```

## 使用场景

### 场景 1：工作流 Skill

```markdown
---
name: pr-workflow
description: Pull request workflow
---

# Pull Request Workflow

## Steps
1. Create branch: `git checkout -b feature/[name]`
2. Make changes and commit
3. Push: `git push -u origin HEAD`
4. Create PR:
   - Title: `[type]: description`
   - Use template: `.github/pull_request_template.md`
5. Request reviews from: @team-members
6. Address feedback
7. Merge when approved

## PR Types
- feat: New feature
- fix: Bug fix
- docs: Documentation
- refactor: Code refactoring
```

### 场景 2：工具集成 Skill

```markdown
---
name: graphql-helper
description: Work with our GraphQL API
---

# GraphQL Helper

## Schema Location
`schema/` directory:
- Types: `schema/types/`
- Resolvers: `schema/resolvers/`

## Naming
- Types: PascalCase (`UserProfile`)
- Fields: camelCase (`firstName`)
- Mutations: verb + noun (`createUser`)

## Patterns
All mutations return Result type:
\`\`\`graphql
type CreateUserResult {
  success: Boolean!
  user: User
  error: Error
}
\`\`\`

## Commands
- Generate types: `npm run codegen`
- Validate schema: `npm run gql:validate`
- Start playground: `npm run gql:playground`

## Example
See: `references/example-query.graphql`
```

### 场景 3：领域知识 Skill

```markdown
---
name: company-architecture
description: Our system architecture patterns
---

# Company Architecture

## Service Structure
\`\`\`
services/
├── api-gateway/          # Entry point
├── user-service/         # User management
├── payment-service/      # Payments
└── notification-service/ # Notifications
\`\`\`

## Communication
- Synchronous: REST API (between user and gateway)
- Asynchronous: RabbitMQ (between services)

## Data Storage
- User data: PostgreSQL
- Session data: Redis
- File storage: S3

## Deployment
- Platform: Kubernetes
- CI/CD: GitHub Actions
- Environments: dev, staging, production

## New Service Checklist
- [ ] Dockerfile
- [ ] Kubernetes manifests
- [ ] Database migrations
- [ ] API documentation
- [ ] Tests (>80% coverage)
- [ ] Monitoring dashboard

Reference: `references/architecture-diagram.png`
```

## 最佳实践

### 1. 从用户视角写作
```markdown
✅ "Run: `npm test`"
✅ "Ask: 'Deploy to staging'"
❌ "This skill provides testing capabilities"
```

### 2. 使用具体示例
```markdown
✅ 
\`\`\`typescript
// Good: explicit return type
async function getUser(id: string): Promise<User> {
  return await db.users.findById(id);
}
\`\`\`

❌ "Functions should have return types"
```

### 3. 引用而非嵌入
```markdown
✅ "Schema: `schema/api.graphql`"
✅ "Example: `references/example.ts`"
❌ [粘贴 500 行 schema]
```

### 4. 提供可执行脚本
```markdown
复杂、易错的操作 → 提供脚本
简单、灵活的操作 → 文本说明
```

### 5. 测试和迭代
```
1. 创建初版
2. 在实际任务中使用
3. 根据效果调整
4. 重复 2-3
```

## 创建工作流

### 1. 识别需求
- [ ] 有重复的工作流吗？
- [ ] 有 AI 不知道的领域知识吗？
- [ ] 有需要精确执行的工具吗？

### 2. 设计 Skill
- [ ] 确定范围（个人/项目/通用）
- [ ] 选择自由度级别
- [ ] 规划文档结构
- [ ] 识别需要的资源

### 3. 创建文件
```bash
# 使用初始化工具
python ~/.codex/skills/.system/skill-creator/scripts/init_skill.py my-skill

# 或手动创建
mkdir -p my-skill
touch my-skill/SKILL.md
```

### 4. 编写内容
按照上述原则和结构编写

### 5. 验证
```bash
# 使用验证工具
python ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py \
  my-skill/SKILL.md
```

### 6. 测试
在 Cursor 中使用新 Skill 执行实际任务

### 7. 迭代
根据使用效果优化

### 8. 分享（可选）
- 发布到 GitHub
- 提交到 openai/skills
- 与团队共享

## 常见错误

### ❌ 过于冗长
```markdown
❌ 
TypeScript 是一种静态类型的编程语言，它是 JavaScript 的超集。
TypeScript 编译成 JavaScript，所以可以在任何支持 JavaScript 的地方运行。
TypeScript 提供了类型系统，这有助于在开发时捕获错误...
（还有 20 行关于 TypeScript 基础知识）

✅ 
TypeScript: 添加类型注解

\`\`\`typescript
function getUser(id: string): User {
  return db.query(id);
}
\`\`\`
```

### ❌ 缺少具体示例
```markdown
❌ 
遵循我们的 API 命名约定。使用 REST 原则。确保路径清晰。

✅ 
API 命名：

\`\`\`
GET  /users          # 列表
GET  /users/:id      # 详情
POST /users          # 创建
PUT  /users/:id      # 更新
DELETE /users/:id    # 删除
\`\`\`
```

### ❌ 自由度不当
```markdown
❌ 太具体（应该灵活）：
代码审查必须严格按照以下顺序：
1. 检查第 1 行
2. 检查第 2 行
...

✅ 适当自由度：
代码审查关注：
- 正确性
- 安全性
- 可维护性
```

## 相关资源

- [create-skill](../../development/frequently-used/create-skill/) - 在 Cursor 中创建 Skills
- [skill-installer](../../productivity/frequently-used/skill-installer/) - 安装 Skills
- [示例 Skills](https://github.com/openai/skills)
- [完整文档]参考系统安装路径中的 SKILL.md

---

**开始创建**: 在 Cursor 中说 "帮我创建一个 skill..." 或使用初始化工具！
