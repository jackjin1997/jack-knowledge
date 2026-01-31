# Skills 知识库

扩展 Cursor 能力的技能集合，让 AI 辅助开发更强大。

## 📋 Skills 总览

当前收录 **30+ 个 Skills**，来自 awesome-claude-skills 社区精选，按领域和使用频率组织。

### 按领域浏览

- **[AI Workflow AI 工作流](#ai-workflow-ai-工作流)** - 4 个
- **[Development 开发工具](#development-开发工具)** - 10 个
- **[Productivity 效率工具](#productivity-效率工具)** - 7 个
- **[Business 商业工具](#business-商业工具)** - 3 个
- **[Communication 沟通工具](#communication-沟通工具)** - 3 个
- **[Creative 创意工具](#creative-创意工具)** - 5 个
- **[Data Analysis 数据分析](#data-analysis-数据分析)** - 1 个

### 按频率浏览

- **高频使用** - 20+ 个
- **偶尔使用** - 5 个

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

#### changelog-generator
**自动生成用户友好的变更日志**

- **路径**: `development/frequently-used/changelog-generator/`
- **用途**: 从 git 提交历史自动创建面向用户的变更日志
- **使用场景**:
  - 发布版本时生成 CHANGELOG
  - 将技术提交转换为用户友好描述
  - 自动化发布文档

#### artifacts-builder
**创建复杂的多组件 HTML artifacts**

- **路径**: `development/frequently-used/artifacts-builder/`
- **用途**: 使用 React、Tailwind CSS、shadcn/ui 创建精美的 Web 组件
- **使用场景**:
  - 快速原型开发
  - 创建演示页面
  - 构建交互式组件
- **包含**: 初始化脚本和组件打包工具

#### webapp-testing
**本地 Web 应用测试**

- **路径**: `development/frequently-used/webapp-testing/`
- **用途**: 使用 Playwright 测试本地 Web 应用
- **使用场景**:
  - 前端功能验证
  - UI 行为调试
  - 截图和视觉回归测试
- **包含**: 完整的测试示例和服务器集成脚本

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

#### langsmith-fetch
**LangChain 调试工具**

- **路径**: `development/occasionally-used/langsmith-fetch/`
- **用途**: 从 LangSmith Studio 获取和分析执行追踪
- **使用场景**:
  - 调试 LangChain 应用
  - 分析 LangGraph 代理
  - 查看执行轨迹
- **特点**: 首个 AI 可观测性 skill

#### document-skills
**全面的文档处理工具集**

- **路径**: `development/occasionally-used/document-skills/`
- **用途**: 处理 Word、PDF、Excel、PowerPoint 等文档
- **使用场景**:
  - 创建和编辑 Word 文档
  - 提取 PDF 内容
  - 操作 Excel 表格
  - 生成演示文稿
- **支持格式**: docx, pdf, xlsx, pptx

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

#### file-organizer
**智能文件和文件夹整理**

- **路径**: `productivity/frequently-used/file-organizer/`
- **用途**: 通过理解上下文整理文件，查找重复，建议更好的组织结构
- **使用场景**:
  - 整理混乱的下载文件夹
  - 项目文件归档
  - 查找和移除重复文件

#### content-research-writer
**内容研究和写作助手**

- **路径**: `productivity/frequently-used/content-research-writer/`
- **用途**: 撰写高质量内容，进行研究，添加引用，改进文章结构
- **使用场景**:
  - 博客文章写作
  - 技术文档编写
  - 研究报告撰写
- **特点**: 提供逐段反馈，自动添加引用

#### meeting-insights-analyzer
**会议记录分析工具**

- **路径**: `productivity/frequently-used/meeting-insights-analyzer/`
- **用途**: 分析会议记录，发现行为模式
- **使用场景**:
  - 识别冲突回避
  - 分析发言比例
  - 评估领导风格
  - 检测填充词使用

### 偶尔使用

#### invoice-organizer
**发票和收据智能整理**

- **路径**: `productivity/occasionally-used/invoice-organizer/`
- **用途**: 为税务准备自动整理发票和收据
- **使用场景**:
  - 税务文档整理
  - 费用报销准备
  - 财务记录管理

#### tailored-resume-generator
**定制简历生成器**

- **路径**: `productivity/occasionally-used/tailored-resume-generator/`
- **用途**: 根据职位描述生成定制简历
- **使用场景**:
  - 求职申请
  - 突出相关经验
  - 最大化面试机会

#### raffle-winner-picker
**抽奖和活动获奖者选择**

- **路径**: `productivity/occasionally-used/raffle-winner-picker/`
- **用途**: 使用密码学安全随机数从列表中选择获奖者
- **使用场景**:
  - 举办抽奖活动
  - 竞赛获奖者选择
  - 随机分组

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

#### mcp-builder
**创建高质量的 MCP（Model Context Protocol）服务器**

- **路径**: `ai-workflow/frequently-used/mcp-builder/`
- **用途**: 指导创建用于集成外部 API 和服务的 MCP 服务器
- **使用场景**:
  - 为 LLM 创建 API 集成
  - 开发数据库连接器
  - 构建工具集成
- **支持**: Python 和 TypeScript
- **包含最佳实践和评估脚本**

#### connect-apps
**连接 Claude 到 500+ 外部应用**

- **路径**: `ai-workflow/frequently-used/connect-apps/`
- **用途**: 让 Claude 执行真实操作（发邮件、创建 issues、发 Slack 消息等）
- **使用场景**:
  - 自动化工作流
  - 与 Gmail、Slack、GitHub、Notion 等集成
  - 执行跨应用操作
- **特点**: 基于 Composio 平台，处理认证和连接

#### skill-share
**技能分享和协作工具**

- **路径**: `ai-workflow/frequently-used/skill-share/`
- **用途**: 分享和管理 Claude Skills
- **使用场景**:
  - 团队技能共享
  - 技能发布和分发
  - 协作开发

## Business 商业工具

### 高频使用

#### competitive-ads-extractor
**竞争对手广告分析**

- **路径**: `business/frequently-used/competitive-ads-extractor/`
- **用途**: 从广告库中提取和分析竞争对手的广告
- **使用场景**:
  - 竞品分析
  - 营销策略研究
  - 创意灵感获取

#### lead-research-assistant
**潜在客户研究助手**

- **路径**: `business/frequently-used/lead-research-assistant/`
- **用途**: 识别和评估高质量潜在客户
- **使用场景**:
  - 销售线索挖掘
  - 目标公司分析
  - 外展策略制定

#### domain-name-brainstormer
**域名创意生成器**

- **路径**: `business/frequently-used/domain-name-brainstormer/`
- **用途**: 生成创意域名并检查可用性
- **使用场景**:
  - 新产品命名
  - 品牌域名选择
  - 检查多个 TLD（.com、.io、.dev、.ai）

## Communication 沟通工具

### 高频使用

#### internal-comms
**内部沟通文档助手**

- **路径**: `communication/frequently-used/internal-comms/`
- **用途**: 编写内部通讯，包括更新、通讯、FAQ、状态报告
- **使用场景**:
  - 公司公告
  - 项目更新
  - 团队通讯
- **包含**: 多种模板和示例

#### twitter-algorithm-optimizer
**Twitter 算法优化器**

- **路径**: `communication/frequently-used/twitter-algorithm-optimizer/`
- **用途**: 基于 Twitter 开源算法优化推文以获得最大曝光
- **使用场景**:
  - 推文重写和优化
  - 提升互动率
  - 改善可见性

#### slack-gif-creator
**Slack GIF 动画创建器**

- **路径**: `communication/frequently-used/slack-gif-creator/`
- **用途**: 创建针对 Slack 优化的动画 GIF
- **使用场景**:
  - 团队表情包制作
  - 庆祝动画
  - 演示动画
- **特点**: 包含多种动画模板和效果库

## Creative 创意工具

### 高频使用

#### canvas-design
**精美的视觉艺术创作**

- **路径**: `creative/frequently-used/canvas-design/`
- **用途**: 创建 PNG 和 PDF 格式的视觉设计
- **使用场景**:
  - 海报设计
  - 信息图表
  - 静态艺术作品
- **包含**: 80+ 专业字体

#### image-enhancer
**图像质量提升**

- **路径**: `creative/frequently-used/image-enhancer/`
- **用途**: 提升图像和截图的分辨率、清晰度
- **使用场景**:
  - 演示文稿图片优化
  - 文档配图增强
  - 截图专业化

#### theme-factory
**专业主题应用**

- **路径**: `creative/frequently-used/theme-factory/`
- **用途**: 为文档、幻灯片、网页应用专业字体和配色主题
- **使用场景**:
  - 品牌一致性
  - 文档美化
  - 快速主题切换
- **包含**: 10 个预设主题

#### brand-guidelines
**品牌规范应用**

- **路径**: `creative/frequently-used/brand-guidelines/`
- **用途**: 应用 Anthropic 官方品牌色彩和排版
- **使用场景**:
  - 保持视觉一致性
  - 专业设计标准
  - 品牌资产创建

#### video-downloader
**视频下载工具**

- **路径**: `creative/frequently-used/video-downloader/`
- **用途**: 从 YouTube 等平台下载视频
- **使用场景**:
  - 离线观看
  - 视频编辑素材
  - 内容归档

## Data Analysis 数据分析

### 高频使用

#### developer-growth-analysis
**开发者增长分析**

- **路径**: `data-analysis/frequently-used/developer-growth-analysis/`
- **用途**: 分析开发者增长趋势和指标
- **使用场景**:
  - GitHub 活动分析
  - 开源项目增长追踪
  - 社区健康评估

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
