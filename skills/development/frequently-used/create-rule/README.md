# create-rule

创建 Cursor 规则，为 AI 提供持久化指导。

## 概述

`create-rule` skill 帮助在 `.cursor/rules/` 目录中创建项目规则文件，为 AI agent 提供持久化的上下文和指导。

## 系统位置

- **安装路径**: `/Users/jinzexu/.cursor/skills-cursor/create-rule`
- **文档路径**: `skills/development/frequently-used/create-rule/`

## 功能说明

- 创建全局规则（始终应用）
- 创建文件特定规则（基于 glob 模式）
- 使用 `.mdc` 格式（Markdown with YAML frontmatter）
- 自动创建 `.cursor/rules/` 目录

## 规则文件格式

```markdown
---
description: 规则的简短描述
alwaysApply: true  # 或 false（文件特定规则）
globs:             # 仅当 alwaysApply: false 时使用
  - "**/*.ts"
  - "**/*.tsx"
---

# 规则内容

这里写规则的详细说明和要求...
```

## 使用方法

### 在 Cursor 中使用

**创建全局规则**：
```
"创建一个规则，要求所有代码都要有详细注释"
```

**创建文件特定规则**：
```
"为所有 TypeScript 文件创建规则，使用严格类型检查"
```

**指定文件模式**：
```
"创建规则适用于 backend/**/*.py 文件，要求使用 type hints"
```

### 规则作用域

#### 全局规则（Always Apply）
```yaml
---
description: 适用于所有文件的规则
alwaysApply: true
---
```

**使用场景**：
- 通用编码标准
- 项目约定
- 提交消息格式

#### 文件特定规则（File Patterns）
```yaml
---
description: 仅适用于特定文件的规则
alwaysApply: false
globs:
  - "**/*.ts"
  - "**/*.tsx"
---
```

**使用场景**：
- 特定语言的规范
- 特定目录的约定
- 特定文件类型的模式

## 使用场景

### 场景 1：设置 TypeScript 规范
```
在 Cursor 中："为 TypeScript 文件创建规则：
- 使用严格模式
- 所有函数需要返回类型
- 使用 interface 而不是 type（除非需要联合类型）"
```

### 场景 2：定义 API 路由约定
```
"为 backend/routes/**/*.ts 创建规则：
- 所有路由必须有 OpenAPI 文档注释
- 使用统一的错误处理中间件
- 参数验证使用 Zod"
```

### 场景 3：React 组件规范
```
"为 React 组件文件创建规则：
- 使用函数组件和 Hooks
- Props 接口以组件名 + Props 命名
- 导出组件使用 export default"
```

### 场景 4：提交消息规范
```
"创建全局规则：
提交消息格式：
- type(scope): description
- type 可选值：feat, fix, docs, style, refactor, test, chore
- description 使用现在时态，首字母小写"
```

## Glob 模式示例

```yaml
# 所有 TypeScript 文件
globs:
  - "**/*.ts"
  - "**/*.tsx"

# 特定目录
globs:
  - "backend/**/*"
  - "frontend/src/**/*"

# 多种文件类型
globs:
  - "**/*.{js,ts,jsx,tsx}"

# 排除特定目录（在规则内容中说明）
globs:
  - "src/**/*.ts"
# 然后在规则内容中说明不包括 src/__tests__/
```

## 最佳实践

### 1. 明确规则范围
- 全局规则用于通用约定
- 文件特定规则用于特定语言/框架

### 2. 保持规则简洁
```markdown
✅ 好的规则：
- 简洁明确的要求
- 具体的示例
- 清晰的理由

❌ 避免：
- 过长的解释
- 重复的内容
- 模糊的要求
```

### 3. 使用描述性文件名
```
✅ 好的文件名：
- typescript-strict-mode.mdc
- react-component-patterns.mdc
- api-documentation-standards.mdc

❌ 避免：
- rule1.mdc
- my-rule.mdc
- temp.mdc
```

### 4. 组织规则文件
```
.cursor/rules/
├── coding-standards.mdc        # 通用编码规范（全局）
├── typescript-config.mdc        # TypeScript 配置（文件特定）
├── react-patterns.mdc           # React 模式（文件特定）
└── git-conventions.mdc          # Git 约定（全局）
```

## 示例规则

### 示例 1：TypeScript 严格模式
```markdown
---
description: TypeScript strict mode and type safety
alwaysApply: false
globs:
  - "**/*.ts"
  - "**/*.tsx"
---

# TypeScript 严格类型规范

## 要求

1. **显式类型**：所有函数参数和返回值必须有类型注解
2. **严格模式**：启用 strict: true
3. **避免 any**：禁止使用 any 类型，使用 unknown 或具体类型

## 示例

\`\`\`typescript
// ✅ 正确
function processUser(user: User): UserResult {
  return { id: user.id, name: user.name };
}

// ❌ 错误
function processUser(user) {
  return { id: user.id, name: user.name };
}
\`\`\`
```

### 示例 2：提交消息格式
```markdown
---
description: Git commit message conventions
alwaysApply: true
---

# Git 提交消息规范

遵循 Conventional Commits 格式：

\`\`\`
type(scope): description

[optional body]

[optional footer]
\`\`\`

## Type 类型

- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `style`: 代码格式（不影响功能）
- `refactor`: 重构
- `test`: 测试相关
- `chore`: 构建/工具相关

## 示例

\`\`\`
feat(auth): add JWT token refresh mechanism
fix(api): handle null values in user profile
docs(readme): update installation instructions
\`\`\`
```

## 注意事项

1. **规则会影响所有匹配的文件**：确保 glob 模式准确
2. **规则会被 AI 读取**：保持简洁，避免浪费 tokens
3. **可以创建多个规则**：按主题分离更易维护
4. **规则文件可以版本控制**：纳入 git 与团队共享

## 相关资源

- [create-skill](../../create-skill/) - 创建可复用的 Skills
- [Cursor 官方文档](../../../resources/documentation.md)
- [贡献指南](../../../../docs/contributing.md)

---

**立即使用**: 在 Cursor 中说 "创建一个规则..." 即可开始！
