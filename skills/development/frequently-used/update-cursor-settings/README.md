# update-cursor-settings

修改 Cursor/VSCode 用户设置。

## 概述

`update-cursor-settings` skill 帮助更新 `settings.json` 中的编辑器设置、偏好和配置，包括主题、字体、格式化等各种选项。

## 系统位置

- **安装路径**: `/Users/jinzexu/.cursor/skills-cursor/update-cursor-settings`
- **文档路径**: `skills/development/frequently-used/update-cursor-settings/`

## 功能说明

- 修改 Cursor/VSCode settings.json
- 支持所有平台（macOS/Linux/Windows）
- 保留现有设置
- 自动验证 JSON 语法
- 支持工作区和用户级别设置

## Settings 文件位置

### macOS
```
~/Library/Application Support/Cursor/User/settings.json
```

### Linux
```
~/.config/Cursor/User/settings.json
```

### Windows
```
%APPDATA%\Cursor\User\settings.json
```

## 使用方法

### 在 Cursor 中使用

**修改编辑器配置**：
```
"更新设置：tab 大小改为 2"
"设置自动保存为 onFocusChange"
"启用 format on save"
```

**修改主题**：
```
"将主题改为 GitHub Dark"
"使用 One Dark Pro 主题"
```

**修改字体**：
```
"字体大小改为 14"
"使用 Fira Code 字体，启用 font ligatures"
```

**配置格式化**：
```
"设置 Prettier 为默认格式化器"
"禁用 JavaScript 的默认格式化"
```

## 常用设置

### 编辑器基础

```json
{
  "editor.fontSize": 14,
  "editor.fontFamily": "Fira Code, Menlo, Monaco, 'Courier New', monospace",
  "editor.fontLigatures": true,
  "editor.lineHeight": 1.6,
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "editor.wordWrap": "on",
  "editor.minimap.enabled": false
}
```

### 格式化

```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[python]": {
    "editor.defaultFormatter": "ms-python.black-formatter"
  }
}
```

### 自动保存

```json
{
  "files.autoSave": "onFocusChange",
  "files.autoSaveDelay": 1000
}
```

### 主题和外观

```json
{
  "workbench.colorTheme": "GitHub Dark",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.sideBar.location": "left",
  "workbench.activityBar.visible": true
}
```

### 文件配置

```json
{
  "files.exclude": {
    "**/.git": true,
    "**/.DS_Store": true,
    "**/node_modules": true,
    "**/__pycache__": true
  },
  "files.watcherExclude": {
    "**/node_modules/**": true,
    "**/.git/objects/**": true
  }
}
```

### 语言特定

```json
{
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "go.formatTool": "goimports"
}
```

## 使用场景

### 场景 1：配置代码格式化

```
在 Cursor 中："配置代码格式化：
- 保存时自动格式化
- 使用 Prettier 格式化 JS/TS
- Tab 大小为 2
- 行宽限制 100 字符"
```

结果：
```json
{
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "prettier.printWidth": 100
}
```

### 场景 2：优化编辑器性能

```
"优化编辑器性能：
- 禁用 minimap
- 限制文件监控
- 排除 node_modules"
```

结果：
```json
{
  "editor.minimap.enabled": false,
  "files.exclude": {
    "**/node_modules": true
  },
  "files.watcherExclude": {
    "**/node_modules/**": true
  }
}
```

### 场景 3：设置开发环境

```
"配置 Python 开发环境：
- 使用 Black 格式化
- 启用 Pylint
- 保存时自动格式化
- 显示类型提示"
```

结果：
```json
{
  "[python]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "ms-python.black-formatter"
  },
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "python.analysis.typeCheckingMode": "basic"
}
```

## 工作区 vs 用户设置

### 用户设置（User Settings）
- 位置：`~/Library/Application Support/Cursor/User/settings.json`
- 作用域：所有项目
- 用途：个人偏好（字体、主题、快捷键等）

### 工作区设置（Workspace Settings）
- 位置：`project/.vscode/settings.json`
- 作用域：当前项目
- 用途：项目特定配置（格式化规则、Linter 配置等）

**通常建议**：
- 外观和编辑器偏好 → 用户设置
- 项目规范和工具配置 → 工作区设置

## 最佳实践

### 1. 团队协作
将项目特定的设置放入 `.vscode/settings.json` 并提交到 git：

```json
// .vscode/settings.json
{
  "editor.tabSize": 2,
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode"
}
```

### 2. 渐进式配置
不要一次性修改太多设置，逐步调整找到适合自己的配置。

### 3. 备份设置
```bash
# 备份当前设置
cp ~/Library/Application\ Support/Cursor/User/settings.json \
   ~/cursor-settings-backup.json
```

### 4. 使用设置同步
启用 Cursor/VSCode 的设置同步功能，在多台机器间同步配置。

## 常见配置集合

### 最小配置（性能优先）
```json
{
  "editor.minimap.enabled": false,
  "editor.fontSize": 13,
  "editor.tabSize": 2,
  "files.autoSave": "onFocusChange"
}
```

### 完整配置（功能丰富）
```json
{
  "editor.fontSize": 14,
  "editor.fontFamily": "Fira Code",
  "editor.fontLigatures": true,
  "editor.tabSize": 2,
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.minimap.enabled": false,
  "editor.wordWrap": "on",
  "files.autoSave": "onFocusChange",
  "workbench.colorTheme": "GitHub Dark",
  "workbench.iconTheme": "material-icon-theme"
}
```

### Python 开发配置
```json
{
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "python.formatting.provider": "black",
  "[python]": {
    "editor.formatOnSave": true,
    "editor.tabSize": 4
  },
  "python.analysis.typeCheckingMode": "basic"
}
```

### Web 开发配置
```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "emmet.includeLanguages": {
    "javascript": "javascriptreact"
  }
}
```

## 注意事项

1. **语法检查**：设置会自动验证 JSON 语法
2. **优先级**：工作区设置会覆盖用户设置
3. **扩展依赖**：某些设置需要安装相应的扩展
4. **重启可能需要**：部分设置更改后需要重启编辑器

## 相关资源

- [VSCode Settings 文档](https://code.visualstudio.com/docs/getstarted/settings)
- [推荐扩展](../../../resources/tools.md)
- [配置模板](../../../snippets/configs/)

---

**立即使用**: 在 Cursor 中说 "更新设置..." 即可开始配置！
