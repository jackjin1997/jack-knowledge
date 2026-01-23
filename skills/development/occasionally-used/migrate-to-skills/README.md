# migrate-to-skills

将 Cursor rules 和 commands 迁移到 Skills 格式。

## 概述

`migrate-to-skills` 帮助将旧的 `.cursor/rules/*.mdc` 和 `.cursor/commands/*.md` 文件转换为新的 Skills 系统格式。

## 系统位置

- **安装路径**: `/Users/jinzexu/.cursor/skills-cursor/migrate-to-skills`
- **文档路径**: `skills/development/occasionally-used/migrate-to-skills/`

## 功能说明

- 迁移 `.cursor/rules/*.mdc` 到 `.cursor/skills/`
- 迁移 `.cursor/commands/*.md` 到 `.cursor/skills/`
- 保留原始文件不变
- 自动转换格式
- 支持撤销迁移

## 使用方法

### 在 Cursor 中使用

**迁移所有规则**：
```
"将所有 rules 迁移到 skills 格式"
```

**迁移特定规则**：
```
"迁移 typescript-standards.mdc 到 skills"
```

**迁移 commands**：
```
"将所有 commands 迁移到 skills"
```

## 迁移过程

### 1. Rules 迁移

**原始格式** (`.cursor/rules/typescript-standards.mdc`):
```markdown
---
description: TypeScript coding standards
alwaysApply: false
globs:
  - "**/*.ts"
  - "**/*.tsx"
---

# TypeScript Standards

Use strict mode and explicit types...
```

**迁移后** (`.cursor/skills/typescript-standards/SKILL.md`):
```markdown
---
name: typescript-standards
description: TypeScript coding standards
metadata:
  migrated-from: rules/typescript-standards.mdc
  applies-to:
    - "**/*.ts"
    - "**/*.tsx"
---

# TypeScript Standards

Use strict mode and explicit types...
```

### 2. Commands 迁移

**原始格式** (`.cursor/commands/deploy-preview.md`):
```markdown
# Deploy Preview

Deploys a preview environment...

## Usage
/deploy-preview [branch]

## Steps
1. Build image
2. Push to registry
3. Deploy to k8s
```

**迁移后** (`.cursor/skills/deploy-preview/SKILL.md`):
```markdown
---
name: deploy-preview
description: Deploy a preview environment
metadata:
  migrated-from: commands/deploy-preview.md
---

# Deploy Preview

## Usage
Ask: "Deploy preview for [branch]"

## Steps
1. Build image
2. Push to registry
3. Deploy to k8s
```

## 使用场景

### 场景 1：升级旧项目

```
在 Cursor 中："我有一个旧项目使用 .cursor/rules/，
帮我迁移到新的 skills 系统"
```

### 场景 2：整合配置

```
"将所有 rules 和 commands 合并到 skills 目录"
```

### 场景 3：清理旧格式

```
"迁移完成后，验证新格式工作正常，
然后删除旧的 rules 和 commands 目录"
```

## 迁移后验证

### 1. 检查 Skills 目录
```bash
ls .cursor/skills/
# 应该看到迁移后的 skills
```

### 2. 测试 Skills
在 Cursor 中使用迁移后的 skills，确保功能正常。

### 3. 对比内容
```bash
# 对比原始和迁移后的内容
diff .cursor/rules/my-rule.mdc \
     .cursor/skills/my-rule/SKILL.md
```

## 撤销迁移

如果迁移后发现问题，可以撤销：

```
在 Cursor 中："撤销 skills 迁移，恢复原来的 rules"
```

**手动撤销**：
```bash
# 删除迁移的 skills
rm -rf .cursor/skills/my-rule/

# 原始 rules/commands 文件仍然保留
```

## 注意事项

1. **原始文件保留**：迁移不会删除原始文件
2. **手动清理**：验证迁移成功后，手动删除旧文件
3. **Git 提交**：迁移后提交新的 skills 到 git
4. **团队协调**：确保团队成员了解新格式

## 迁移最佳实践

### 1. 逐步迁移
```bash
# 先迁移一个 rule 测试
migrate rule: typescript-standards.mdc

# 验证工作正常
# 再迁移其他
```

### 2. 保留备份
```bash
# 迁移前备份
cp -r .cursor/rules .cursor/rules.backup
cp -r .cursor/commands .cursor/commands.backup
```

### 3. 测试完整性
迁移后在实际任务中测试所有迁移的 skills。

### 4. 更新文档
更新项目文档，说明已迁移到 skills 系统。

## 迁移清单

迁移完成后检查：

- [ ] 所有 rules 已迁移
- [ ] 所有 commands 已迁移
- [ ] 新 skills 功能正常
- [ ] 文件结构正确
- [ ] YAML frontmatter 有效
- [ ] 提交到 git
- [ ] 通知团队成员
- [ ] 删除旧文件（可选）

## Rules vs Skills 对比

| 特性 | Rules | Skills |
|------|-------|--------|
| 文件格式 | `.mdc` | `SKILL.md` |
| 位置 | `.cursor/rules/` | `.cursor/skills/skill-name/` |
| 作用域 | 全局或文件模式 | 按需调用 |
| 捆绑资源 | 不支持 | 支持脚本、参考文件等 |
| 灵活性 | 较低 | 较高 |
| 推荐用途 | 简单规则 | 复杂工作流 |

## 何时使用 Rules vs Skills

### 继续使用 Rules
- 简单的编码规范
- 文件特定的约定
- 不需要额外资源的规则

### 迁移到 Skills
- 多步骤工作流
- 需要脚本或工具
- 复杂的领域知识
- 需要捆绑参考文件

## 相关资源

- [create-rule](../../frequently-used/create-rule/) - 创建新规则
- [create-skill](../../frequently-used/create-skill/) - 创建新 Skills
- [贡献指南](../../../../docs/contributing.md)

---

**需要迁移？** 在 Cursor 中说 "迁移 rules 到 skills" 即可开始！
