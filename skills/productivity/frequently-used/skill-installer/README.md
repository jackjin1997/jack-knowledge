# skill-installer

从精选列表或 GitHub 仓库安装 Codex Skills。

## 概述

`skill-installer` 帮助发现和安装 Skills，支持从 openai/skills 的精选列表安装，也支持任意 GitHub 仓库（包括私有仓库）。

## 系统位置

- **安装路径**: `/Users/jinzexu/.codex/skills/.system/skill-installer`
- **文档路径**: `skills/productivity/frequently-used/skill-installer/`

## 功能说明

- 列出精选 Skills 列表
- 从 GitHub 仓库安装 Skills
- 支持公开和私有仓库
- 自动处理依赖
- 验证安装完整性

## 使用方法

### 在 Cursor 中使用

**列出可用 Skills**：
```
"列出所有可安装的 skills"
"显示精选 skills 列表"
```

**安装精选 Skill**：
```
"安装 skill-name skill"
"安装代码审查 skill"
```

**从 GitHub 安装**：
```
"从 GitHub 仓库 username/repo-name 安装 skill"
"安装 https://github.com/username/repo-name 的 skill"
```

**从私有仓库安装**：
```
"从私有仓库 company/private-skills 安装 skill（使用 token）"
```

## 安装位置

### 系统 Skills
```bash
~/.codex/skills/skill-name/
```
- 在所有项目中可用
- 用于通用 skills

### 项目 Skills
```bash
project/.cursor/skills/skill-name/
```
- 仅在当前项目可用
- 用于项目特定 skills

## 使用场景

### 场景 1：发现新 Skills

```
在 Cursor 中："列出所有可用的 skills"
```

输出示例：
```
可用 Skills：
1. code-reviewer - 代码审查助手
2. test-generator - 自动生成测试
3. api-documenter - API 文档生成
4. refactoring-helper - 重构辅助
5. ...
```

### 场景 2：安装精选 Skill

```
"安装 test-generator skill"
```

过程：
1. 从 openai/skills 仓库获取
2. 下载到 ~/.codex/skills/
3. 验证安装
4. 确认可用

### 场景 3：安装自定义 Skill

```
"从 GitHub 仓库 mycompany/custom-skills 安装 skill"
```

支持：
- 公开仓库：直接安装
- 私有仓库：需要提供 GitHub token

### 场景 4：安装团队 Skill

```
"安装我们团队的内部 skill：
仓库：company/engineering-skills
路径：skills/deployment-workflow"
```

## 安装流程

### 1. 准备
```bash
# 确保 git 已安装
git --version

# 确保有网络连接
```

### 2. 安装

**从精选列表**：
```
skill-installer list           # 列出可用 skills
skill-installer install skill-name
```

**从 GitHub**：
```
skill-installer install --repo username/repo-name
skill-installer install --url https://github.com/username/repo
```

**指定安装位置**：
```
skill-installer install skill-name --location user    # 用户级
skill-installer install skill-name --location project # 项目级
```

### 3. 验证
```bash
# 检查安装位置
ls ~/.codex/skills/skill-name/

# 查看 Skill 文档
cat ~/.codex/skills/skill-name/SKILL.md

# 测试使用
# 在 Cursor 中尝试使用新安装的 skill
```

## 精选 Skills 列表

来自 openai/skills 的推荐 Skills：

### 开发工具
- **code-reviewer** - 代码审查助手
- **test-generator** - 自动生成测试用例
- **refactoring-helper** - 代码重构辅助
- **api-documenter** - API 文档生成

### 数据处理
- **data-analyzer** - 数据分析助手
- **csv-processor** - CSV 文件处理
- **json-transformer** - JSON 数据转换

### DevOps
- **docker-helper** - Docker 容器管理
- **k8s-deployer** - Kubernetes 部署
- **ci-cd-setup** - CI/CD 配置助手

### 文档
- **readme-generator** - README 文档生成
- **changelog-creator** - 变更日志生成
- **diagram-maker** - 架构图生成

*注：实际列表以 `skill-installer list` 命令输出为准*

## GitHub 安装选项

### 仓库格式

**单 Skill 仓库**：
```
repo/
├── SKILL.md
├── scripts/
└── references/
```

**多 Skill 仓库**：
```
repo/
├── skills/
│   ├── skill1/
│   │   └── SKILL.md
│   └── skill2/
│       └── SKILL.md
└── README.md
```

### 私有仓库访问

```bash
# 设置 GitHub token
export GITHUB_TOKEN=your_token_here

# 或在安装时提供
skill-installer install --repo company/private-skills --token $GITHUB_TOKEN
```

**获取 GitHub Token**：
1. GitHub Settings → Developer settings
2. Personal access tokens → Generate new token
3. 选择 `repo` 权限
4. 生成并保存 token

## 管理已安装的 Skills

### 列出已安装
```bash
# 用户级 Skills
ls ~/.codex/skills/

# 项目级 Skills
ls .cursor/skills/
```

### 更新 Skill
```
"更新 skill-name skill 到最新版本"
```

### 卸载 Skill
```bash
# 手动删除
rm -rf ~/.codex/skills/skill-name/

# 或使用命令
skill-installer uninstall skill-name
```

## 创建可安装的 Skill

如果你想让其他人安装你的 Skill：

### 1. 创建 GitHub 仓库
```bash
mkdir my-awesome-skill
cd my-awesome-skill
git init
```

### 2. 添加 Skill 文件
```
my-awesome-skill/
├── SKILL.md          # 必需
├── README.md         # 推荐
├── scripts/          # 可选
└── references/       # 可选
```

### 3. 发布
```bash
git add .
git commit -m "Initial skill"
git push origin main
```

### 4. 分享
```
"从 GitHub 安装我的 skill：username/my-awesome-skill"
```

## 最佳实践

### 1. 先浏览再安装
```
"列出可用的 skills，详细介绍前 5 个"
```

### 2. 测试后再推广
在个人环境测试新 skill，确认效果后再推荐给团队。

### 3. 版本控制
对于项目级 skills，使用 git 管理：
```bash
# 将 skills 纳入版本控制
git add .cursor/skills/
git commit -m "Add team skills"
```

### 4. 文档更新
安装新 skill 后，更新项目文档说明可用的 skills。

## 注意事项

1. **网络要求**：需要稳定的网络连接
2. **权限问题**：私有仓库需要正确的访问权限
3. **依赖处理**：某些 skills 可能有额外依赖
4. **兼容性**：确认 skill 与当前 Cursor 版本兼容

## 故障排查

### 安装失败
```
问题：无法下载 skill
解决：
1. 检查网络连接
2. 验证仓库 URL
3. 确认访问权限（私有仓库）
```

### Skill 不可用
```
问题：安装后无法使用
解决：
1. 检查安装位置
2. 验证 SKILL.md 格式
3. 重启 Cursor
```

### 权限错误
```
问题：私有仓库访问被拒绝
解决：
1. 验证 GitHub token
2. 确认 token 权限（repo scope）
3. 检查仓库访问权限
```

## 相关资源

- [skill-creator](../../ai-workflow/frequently-used/skill-creator/) - 创建自己的 Skills
- [openai/skills](https://github.com/openai/skills) - 官方 Skills 仓库
- [GitHub Token 文档](https://docs.github.com/en/authentication)

---

**发现新工具**: 在 Cursor 中说 "列出可用的 skills" 开始探索！
