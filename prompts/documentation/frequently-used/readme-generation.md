# README 生成 Prompt

生成完整、专业的项目 README 文档。

## 用途

为项目创建全面的 README.md 文档，包括项目简介、安装、使用、API 等所有必要信息。

## 使用场景

- 新项目初始化
- 更新过时的文档
- 开源项目准备
- 提升项目专业度

## Prompt 模板

```
请为以下项目生成完整的 README.md 文档：

## 项目信息
- 项目名称：{项目名}
- 项目类型：{库/框架/应用/工具}
- 主要语言：{编程语言}
- 核心功能：{简要描述}
- 目标用户：{开发者/最终用户/企业等}

## 技术栈
- 前端：{技术}
- 后端：{技术}
- 数据库：{数据库}
- 其他：{工具/服务}

## 项目结构
\`\`\`
{项目目录结构}
\`\`\`

## 核心代码示例
\`\`\`{language}
{关键代码片段}
\`\`\`

## 特殊说明
- 安装要求：{Node版本、依赖等}
- 配置需求：{API密钥、环境变量等}
- 已知限制：{限制条件}
- {其他重要信息}

请生成包含以下部分的 README：

### 必需部分
1. **项目标题和徽章**
   - 项目名称
   - 简短描述（一句话）
   - 徽章（构建状态、版本、许可证等）

2. **功能特性**
   - 核心功能列表
   - 突出优势

3. **快速开始**
   - 前置要求
   - 安装步骤
   - 基本使用示例

4. **详细文档**
   - 配置说明
   - API 文档（如适用）
   - 使用示例

5. **项目结构**
   - 目录说明
   - 关键文件

6. **开发指南**
   - 本地开发设置
   - 运行测试
   - 构建部署

7. **贡献指南**
   - 如何贡献
   - 代码规范
   - PR 流程

8. **许可证**
   - 开源许可

### 可选部分（根据需要）
- Demo/截图
- 技术架构
- 性能指标
- 常见问题（FAQ）
- 更新日志
- 致谢
- 联系方式

要求：
- 使用 Markdown 格式
- 清晰的层级结构
- 代码示例使用代码块
- 专业、友好的语气
- 面向目标用户编写
```

## 使用示例

### 示例 1：开源库 README

**输入**：
```
请为以下项目生成完整的 README.md：

## 项目信息
- 项目名称：easy-validator
- 项目类型：JavaScript 库
- 主要语言：TypeScript
- 核心功能：简单易用的表单验证库
- 目标用户：前端开发者

## 技术栈
- TypeScript
- 支持 React、Vue、原生 JS
- 零依赖

## 核心代码示例
\`\`\`typescript
import { validate } from 'easy-validator';

const rules = {
  email: 'required|email',
  password: 'required|min:8'
};

const result = validate(formData, rules);
\`\`\`

## 特殊说明
- 需要 Node.js 14+
- 支持 TypeScript
- Bundle 大小 < 5KB

[... 后续部分按模板 ...]
```

**预期输出**：

```markdown
# easy-validator

> 简单易用、零依赖的 JavaScript 表单验证库

[![npm version](https://img.shields.io/npm/v/easy-validator.svg)](https://www.npmjs.com/package/easy-validator)
[![Bundle Size](https://img.shields.io/bundlephobia/minzip/easy-validator.svg)](https://bundlephobia.com/package/easy-validator)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## ✨ 特性

- 🚀 **简单易用** - 直观的 API，5 分钟上手
- 📦 **零依赖** - Bundle 大小 < 5KB
- 🔧 **高度可配置** - 支持自定义规则和错误消息
- 💪 **TypeScript** - 完整的类型定义
- 🎯 **框架无关** - 支持 React、Vue、原生 JS

## 📦 安装

\`\`\`bash
npm install easy-validator
# or
yarn add easy-validator
\`\`\`

## 🚀 快速开始

\`\`\`typescript
import { validate } from 'easy-validator';

// 定义验证规则
const rules = {
  email: 'required|email',
  password: 'required|min:8',
  age: 'required|integer|min:18'
};

// 验证数据
const data = {
  email: 'user@example.com',
  password: 'password123',
  age: 25
};

const result = validate(data, rules);

if (result.valid) {
  console.log('验证通过！');
} else {
  console.log('验证失败：', result.errors);
}
\`\`\`

[... 更多部分 ...]
```

## 变体

### 变体 1：最小 README

```
生成最小可用的 README：

项目：{项目名}
功能：{一句话描述}

包含：
- 项目名和描述
- 安装命令
- 基本使用示例
- 许可证

保持简洁，适合快速原型。
```

### 变体 2：开源项目 README

```
生成开源项目 README，强调：

项目信息：
[详细信息]

重点：
- 吸引贡献者
- 清晰的贡献指南
- 行为准则
- 详细的开发文档
- Demo 和截图
```

### 变体 3：企业内部项目 README

```
生成内部项目 README：

项目：[信息]

包含：
- 项目背景和目标
- 架构设计
- 部署流程
- 监控和告警
- 联系人信息
- 内部资源链接
```

### 变体 4：更新现有 README

```
更新以下 README：

当前 README：
[现有内容]

更新原因：
- [新功能]
- [API 变更]
- [新的安装步骤]

请：
1. 保留有用的部分
2. 更新过时信息
3. 添加新内容
4. 改进结构和表达
```

## README 模板

### 基础模板

```markdown
# 项目名称

> 一句话项目描述

## 特性

- 特性 1
- 特性 2
- 特性 3

## 安装

\`\`\`bash
npm install package-name
\`\`\`

## 使用

\`\`\`javascript
// 代码示例
\`\`\`

## API

### method()

描述

参数：
- `param1` (type): 描述

返回值：
- `type`: 描述

示例：
\`\`\`javascript
// 示例代码
\`\`\`

## 贡献

欢迎贡献！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)

## 许可证

[MIT](LICENSE)
```

### 完整模板

```markdown
# 项目名称

<p align="center">
  <img src="logo.png" alt="Logo" width="200">
</p>

<p align="center">
  <strong>一句话项目描述</strong>
</p>

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/..." alt="Badge"></a>
  ...
</p>

## 📖 目录

- [特性](#特性)
- [Demo](#demo)
- [安装](#安装)
- [快速开始](#快速开始)
- [文档](#文档)
- [示例](#示例)
- [开发](#开发)
- [测试](#测试)
- [部署](#部署)
- [贡献](#贡献)
- [更新日志](#更新日志)
- [许可证](#许可证)

## ✨ 特性

- 🚀 特性 1 - 说明
- 📦 特性 2 - 说明
- 🎯 特性 3 - 说明

## 🎥 Demo

![Demo](demo.gif)

[在线演示](https://demo-url.com)

## 📦 安装

### 前置要求

- Node.js >= 14
- npm >= 6

### 安装步骤

\`\`\`bash
npm install package-name
\`\`\`

## 🚀 快速开始

\`\`\`javascript
// 最简单的例子
\`\`\`

## 📚 文档

### 配置

\`\`\`javascript
// 配置选项
\`\`\`

### API

详细 API 文档...

## 💡 示例

### 示例 1: 基本用法

\`\`\`javascript
// 代码
\`\`\`

### 示例 2: 高级用法

\`\`\`javascript
// 代码
\`\`\`

## 🛠️ 开发

### 本地开发

\`\`\`bash
# 克隆项目
git clone ...

# 安装依赖
npm install

# 启动开发服务器
npm run dev
\`\`\`

### 项目结构

\`\`\`
项目/
├── src/
├── tests/
└── docs/
\`\`\`

## 🧪 测试

\`\`\`bash
npm test
\`\`\`

## 🚢 部署

\`\`\`bash
npm run build
npm run deploy
\`\`\`

## 🤝 贡献

欢迎贡献！

1. Fork 项目
2. 创建特性分支 (\`git checkout -b feature/AmazingFeature\`)
3. 提交改动 (\`git commit -m 'Add some AmazingFeature'\`)
4. 推送到分支 (\`git push origin feature/AmazingFeature\`)
5. 开启 Pull Request

请阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 了解详情。

## 📝 更新日志

查看 [CHANGELOG.md](CHANGELOG.md)

## 📄 许可证

[MIT](LICENSE) © [Your Name]

## 🙏 致谢

- [库/工具 1](链接)
- [库/工具 2](链接)

## 📧 联系

- Email: your@email.com
- Twitter: [@yourhandle](https://twitter.com/yourhandle)
- Issue: [GitHub Issues](https://github.com/user/repo/issues)
```

## 最佳实践

### 1. 清晰的标题层级
```markdown
# H1: 项目名
## H2: 主要部分
### H3: 子部分
```

### 2. 使用徽章
```markdown
[![Build Status](url)](link)
[![npm version](url)](link)
[![License](url)](link)
```

### 3. 提供可运行的示例
```markdown
✅ Good: 完整的可运行代码
❌ Bad: 不完整的代码片段
```

### 4. 目标用户导向
```markdown
✅ 根据用户水平调整文档深度
✅ 提供不同级别的示例
```

### 5. 保持更新
```markdown
- 新功能及时添加
- 过时信息及时移除
- 版本号保持同步
```

## 注意事项

1. **简洁明了**：README 应该快速传达关键信息
2. **示例优先**：代码示例胜过长篇文字
3. **层次分明**：使用清晰的标题结构
4. **持续维护**：定期更新，保持文档新鲜
5. **用户视角**：站在用户角度，回答他们的问题

## 相关资源

- [API 文档 Prompt](api-docs.md)
- [贡献指南模板](../../../templates/)
- [优秀 README 示例](https://github.com/matiassingers/awesome-readme)

---

**立即使用**: 提供项目信息，生成专业的 README！
