# Prompts 模板库

精心设计的 Prompt 模板集合，让与 AI 的对话更高效。

## 📋 Prompts 总览

当前收录 **8+ 个 Prompt 模板**，按使用场景和频率组织。

### 按场景浏览

- **[Coding 编码](#coding-编码)** - 3 个
- **[Debugging 调试](#debugging-调试)** - 2 个
- **[Refactoring 重构](#refactoring-重构)** - 2 个
- **[Documentation 文档](#documentation-文档)** - 2 个

### 按频率浏览

- **高频使用** - 7 个（implement-feature、code-review、error-analysis 等）
- **偶尔使用** - 待添加
- **收藏备用** - 待添加

## Coding 编码

### 高频使用

#### [implement-feature.md](coding/frequently-used/implement-feature.md)
**实现新功能的完整流程**

- **用途**: 系统性地实现新功能
- **包含**: 需求分析、设计、实现、测试
- **适用**: 中等到大型功能开发

#### [code-review.md](coding/frequently-used/code-review.md)
**结构化代码审查**

- **用途**: 全面的代码审查
- **包含**: 正确性、安全性、性能、可维护性检查
- **适用**: Pull Request 审查

#### [test-generation.md](coding/frequently-used/test-generation.md)
**生成测试用例**

- **用途**: 自动生成测试代码
- **包含**: 单元测试、边界测试、异常测试
- **适用**: 提高测试覆盖率

## Debugging 调试

### 高频使用

#### [error-analysis.md](debugging/frequently-used/error-analysis.md)
**系统性错误分析**

- **用途**: 分析和定位 bug
- **包含**: 错误重现、根因分析、解决方案
- **适用**: 调试复杂问题

#### [performance-optimization.md](debugging/frequently-used/performance-optimization.md)
**性能优化分析**

- **用途**: 识别和优化性能瓶颈
- **包含**: 性能分析、优化建议、实施方案
- **适用**: 性能调优

## Refactoring 重构

### 高频使用

#### [clean-code.md](refactoring/frequently-used/clean-code.md)
**代码清理和优化**

- **用途**: 提高代码质量
- **包含**: 命名、结构、简化、模式
- **适用**: 代码维护和改进

#### [extract-component.md](refactoring/frequently-used/extract-component.md)
**提取可复用组件**

- **用途**: 识别并提取重复代码
- **包含**: 组件设计、接口定义、重构步骤
- **适用**: 代码重用和模块化

## Documentation 文档

### 高频使用

#### [readme-generation.md](documentation/frequently-used/readme-generation.md)
**生成项目 README**

- **用途**: 创建完整的项目文档
- **包含**: 简介、安装、使用、API、贡献
- **适用**: 项目文档创建

#### [api-docs.md](documentation/frequently-used/api-docs.md)
**API 文档编写**

- **用途**: 生成清晰的 API 文档
- **包含**: 端点、参数、响应、示例
- **适用**: API 文档编写

## 🎯 如何使用 Prompts

### 方法 1：在 Cursor 中引用

```
@prompts/coding/frequently-used/implement-feature.md
```

然后说：
```
"按照这个模板帮我实现用户登录功能"
```

### 方法 2：直接复制使用

1. 打开 Prompt 文件
2. 复制模板内容
3. 填写具体信息
4. 在 Cursor 中使用

### 方法 3：自定义变体

1. 选择相近的模板
2. 根据需求调整
3. 保存为新模板

## 💡 Prompt 设计原则

### 1. 结构化
```markdown
✅ 好的 Prompt：
- 明确的目标
- 清晰的步骤
- 具体的要求
- 输出格式说明

❌ 避免：
- "帮我写代码"
- "修复这个 bug"
```

### 2. 上下文丰富
```markdown
✅ 提供：
- 项目背景
- 技术栈
- 约束条件
- 现有代码

❌ 缺少上下文
```

### 3. 具体明确
```markdown
✅ "生成一个 React 函数组件，使用 TypeScript，
    包含 props 类型定义，遵循项目编码规范"

❌ "写一个组件"
```

## 🔧 Prompt 模板结构

所有模板遵循统一结构：

```markdown
# Prompt 标题

## 用途
简短描述

## 使用场景
- 场景 1
- 场景 2

## Prompt 模板
\`\`\`
[完整的 prompt 内容]
\`\`\`

## 变量说明
- {variable1}: 说明
- {variable2}: 说明

## 使用示例
### 输入
### 输出

## 变体
针对不同场景的变化版本

## 注意事项
重要提醒

## 相关资源
链接到相关模板或文档
```

## 📊 使用频率统计

### 本周热门（Top 5）

1. implement-feature - 实现新功能
2. error-analysis - 错误分析
3. code-review - 代码审查
4. performance-optimization - 性能优化
5. clean-code - 代码清理

### 按场景统计

| 场景 | 使用次数 | 占比 |
|------|---------|------|
| Coding | 45% | 最常用 |
| Debugging | 30% | 经常用 |
| Refactoring | 15% | 常用 |
| Documentation | 10% | 定期用 |

## 🎨 创建自己的 Prompt

### 1. 识别需求

回答这些问题：
- 这是重复性的任务吗？
- 每次都需要提供相同的上下文吗？
- 有特定的输出格式要求吗？

### 2. 设计模板

```markdown
# 明确目标
"我需要生成 [什么]，用于 [什么目的]"

# 提供上下文
"项目使用 [技术栈]，遵循 [规范]"

# 指定步骤
"按照以下步骤：
1. [步骤 1]
2. [步骤 2]"

# 定义输出
"输出格式：
- [要求 1]
- [要求 2]"
```

### 3. 测试和优化

1. 在实际任务中使用
2. 记录效果
3. 根据反馈调整
4. 迭代优化

### 4. 保存和分享

```bash
# 保存到合适的位置
cp my-prompt.md prompts/[category]/frequently-used/

# 更新 README
# 与团队分享
```

## 📚 Prompt 最佳实践

### 1. 明确角色定位
```markdown
✅ "你是一个资深的 React 开发专家，擅长性能优化"
❌ "帮我看看代码"
```

### 2. 分步骤说明
```markdown
✅ 
"按照以下步骤：
1. 分析当前代码
2. 识别问题
3. 提供解决方案
4. 解释原因"

❌ "优化代码"
```

### 3. 提供示例
```markdown
✅ "参考这个示例：[代码示例]，生成类似的实现"
❌ "写一个函数"
```

### 4. 指定约束
```markdown
✅ 
"要求：
- 使用 TypeScript
- 包含错误处理
- 添加单元测试
- 遵循 ESLint 规范"

❌ 没有明确要求
```

### 5. 定义输出格式
```markdown
✅ 
"输出格式：
1. 代码实现（带注释）
2. 使用示例
3. 测试用例
4. 注意事项"

❌ 输出格式不明确
```

## 🔄 Prompt 维护

### 定期更新
- 根据实际使用效果调整
- 添加新发现的有效模式
- 删除不再使用的模板

### 版本控制
- 记录重大修改
- 保留历史版本（如有价值）
- 文档变更原因

### 频率调整
- 根据使用情况调整分类
- 高频使用的移到 frequently-used/
- 很少使用的移到 archived/

## 🆕 即将添加

### Coding
- component-design.md - 组件设计
- api-integration.md - API 集成
- database-query.md - 数据库查询

### Debugging
- memory-leak.md - 内存泄漏分析
- race-condition.md - 并发问题
- production-issue.md - 生产环境问题

### Refactoring
- database-migration.md - 数据库迁移
- api-versioning.md - API 版本升级
- architecture-refactor.md - 架构重构

### Documentation
- architecture-diagram.md - 架构图
- user-guide.md - 用户指南
- changelog.md - 变更日志

## 相关资源

- [模板文件](../templates/prompt-template.md)
- [贡献指南](../docs/contributing.md)
- [工作流库](../workflows/) - 配合使用效果更好

---

**开始使用**: 选择一个模板，在 Cursor 中 `@prompts/...` 引用即可！
