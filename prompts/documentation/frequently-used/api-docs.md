# API 文档 Prompt

生成清晰、完整的 API 文档。

## 用途

为 API 端点、函数库、或组件生成专业的文档，包括参数、返回值、示例等。

## 使用场景

- REST API 文档
- 函数库 API 文档
- 组件 Props 文档
- SDK 文档

## Prompt 模板

```
请为以下 API 生成完整文档：

## API 信息
- API 类型：{REST API/GraphQL/函数库/组件}
- 技术栈：{技术}
- 认证方式：{JWT/API Key/OAuth等}
- Base URL：{基础URL}

## API 代码
\`\`\`{language}
{API 实现代码或接口定义}
\`\`\`

## 补充信息
- 速率限制：{限制说明}
- 错误码：{错误码列表}
- 版本：{API 版本}

请生成包含以下内容的文档：

### 1. API 概述
- 简短描述
- 主要功能
- 使用场景

### 2. 认证
- 认证方式
- 获取凭证的方法
- 认证示例

### 3. 端点/方法列表
对每个端点/方法：

#### 端点名称
**描述**：简短说明

**请求**：
- 方法：GET/POST/PUT/DELETE
- 路径：`/api/resource`
- Headers：必需的 headers
- 参数：
  - `param1` (类型, 必需/可选): 描述
  - `param2` (类型, 必需/可选): 描述
  
**响应**：
- 成功响应（200）：
  \`\`\`json
  {
    "data": ...
  }
  \`\`\`
- 错误响应：
  - 400: 错误描述
  - 401: 未授权
  - 404: 未找到
  - 500: 服务器错误

**示例**：
\`\`\`bash
curl示例
\`\`\`

\`\`\`javascript
JavaScript 示例
\`\`\`

### 4. 数据模型
- 定义返回的数据结构
- 字段说明
- 数据类型

### 5. 错误处理
- 错误响应格式
- 常见错误码
- 错误处理建议

### 6. 最佳实践
- 使用建议
- 性能优化
- 安全注意事项

### 7. 变更日志
- 版本历史
- 重大变更

要求：
- 清晰的结构
- 完整的示例
- 实用的说明
- 易于导航
```

## 使用示例

### 示例 1：REST API 文档

**输入**：
```
请为以下 API 生成完整文档：

## API 信息
- API 类型：REST API
- 技术栈：Node.js + Express
- 认证方式：JWT Bearer Token
- Base URL：https://api.example.com/v1

## API 代码
\`\`\`javascript
// GET /api/users
app.get('/api/users', authenticate, async (req, res) => {
  const { page = 1, limit = 20, search } = req.query;
  const users = await User.find(search)
    .skip((page - 1) * limit)
    .limit(limit);
  res.json({ users, total: await User.count() });
});

// POST /api/users
app.post('/api/users', authenticate, async (req, res) => {
  const { name, email, role } = req.body;
  const user = await User.create({ name, email, role });
  res.status(201).json(user);
});
\`\`\`

## 补充信息
- 速率限制：100 请求/分钟
- 版本：v1.0.0

[... 后续部分按模板 ...]
```

**预期输出**：

```markdown
# User API 文档

## 概述

User API 提供用户管理功能，包括创建、查询、更新和删除用户。

**Base URL**: `https://api.example.com/v1`
**Version**: v1.0.0

## 认证

所有 API 请求需要 JWT Bearer Token 认证。

### 获取 Token

```bash
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password"
}
```

### 使用 Token

在请求头中包含 token：

```
Authorization: Bearer your_jwt_token_here
```

## 端点

### 获取用户列表

**GET** `/api/users`

获取分页的用户列表，支持搜索。

**Query Parameters**:

| 参数 | 类型 | 必需 | 默认值 | 描述 |
|------|------|------|--------|------|
| page | integer | 否 | 1 | 页码（从1开始） |
| limit | integer | 否 | 20 | 每页数量（最大100） |
| search | string | 否 | - | 搜索关键词（匹配姓名或邮箱） |

**成功响应** (200 OK):

```json
{
  "users": [
    {
      "id": "123",
      "name": "John Doe",
      "email": "john@example.com",
      "role": "user",
      "createdAt": "2026-01-01T00:00:00Z"
    }
  ],
  "total": 150,
  "page": 1,
  "limit": 20
}
```

**错误响应**:

- `401 Unauthorized`: Token 无效或过期
- `429 Too Many Requests`: 超过速率限制

**示例**:

```bash
# cURL
curl -X GET "https://api.example.com/v1/api/users?page=1&limit=20" \
  -H "Authorization: Bearer YOUR_TOKEN"

# JavaScript (Fetch)
fetch('https://api.example.com/v1/api/users?page=1&limit=20', {
  headers: {
    'Authorization': 'Bearer YOUR_TOKEN'
  }
})
.then(res => res.json())
.then(data => console.log(data));

# JavaScript (Axios)
axios.get('https://api.example.com/v1/api/users', {
  headers: {
    'Authorization': 'Bearer YOUR_TOKEN'
  },
  params: {
    page: 1,
    limit: 20
  }
})
.then(response => console.log(response.data));
```

---

### 创建用户

**POST** `/api/users`

创建新用户（需要管理员权限）。

**Request Body**:

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "role": "user"
}
```

**字段说明**:

| 字段 | 类型 | 必需 | 描述 |
|------|------|------|------|
| name | string | 是 | 用户姓名（2-50字符） |
| email | string | 是 | 邮箱地址（唯一） |
| role | string | 否 | 角色（user/admin），默认user |

**成功响应** (201 Created):

```json
{
  "id": "124",
  "name": "John Doe",
  "email": "john@example.com",
  "role": "user",
  "createdAt": "2026-01-23T10:00:00Z"
}
```

**错误响应**:

- `400 Bad Request`: 请求数据无效
  ```json
  {
    "error": "Validation failed",
    "details": {
      "email": "Email already exists"
    }
  }
  ```
- `401 Unauthorized`: 未认证
- `403 Forbidden`: 权限不足

**示例**:

```bash
curl -X POST "https://api.example.com/v1/api/users" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "role": "user"
  }'
```

---

## 数据模型

### User

| 字段 | 类型 | 描述 |
|------|------|------|
| id | string | 用户唯一标识符 |
| name | string | 用户姓名 |
| email | string | 邮箱地址 |
| role | string | 角色（user/admin） |
| createdAt | string | 创建时间（ISO 8601） |
| updatedAt | string | 更新时间（ISO 8601） |

---

## 错误处理

所有错误响应遵循统一格式：

```json
{
  "error": "错误消息",
  "code": "ERROR_CODE",
  "details": {
    // 详细错误信息（可选）
  }
}
```

### 常见错误码

| HTTP 状态码 | 错误码 | 描述 |
|------------|--------|------|
| 400 | VALIDATION_ERROR | 请求数据验证失败 |
| 401 | UNAUTHORIZED | 未认证或 token 无效 |
| 403 | FORBIDDEN | 权限不足 |
| 404 | NOT_FOUND | 资源未找到 |
| 429 | RATE_LIMIT_EXCEEDED | 超过速率限制 |
| 500 | INTERNAL_ERROR | 服务器内部错误 |

---

## 速率限制

- **限制**: 100 请求/分钟/IP
- **响应头**:
  - `X-RateLimit-Limit`: 限制数量
  - `X-RateLimit-Remaining`: 剩余数量
  - `X-RateLimit-Reset`: 重置时间（Unix 时间戳）

超过限制时返回 `429 Too Many Requests`。

---

## 最佳实践

### 1. 使用分页

对于列表接口，始终使用分页避免一次获取过多数据。

### 2. 缓存响应

对于不常变化的数据，使用缓存减少 API 调用。

### 3. 错误处理

始终检查响应状态码和错误消息，提供友好的用户提示。

### 4. 安全

- 不要在前端暴露 API token
- 使用 HTTPS
- 定期刷新 token

---

## 变更日志

### v1.0.0 (2026-01-23)

- 初始版本
- 用户 CRUD 操作
- JWT 认证
```

## 变体

### 变体 1：函数库 API 文档

```
为函数库生成 API 文档：

库名：{库名}
语言：{语言}

函数代码：
[函数实现或类型定义]

对每个函数：
- 函数签名
- 参数说明
- 返回值
- 使用示例
- 注意事项
```

### 变体 2：GraphQL API 文档

```
为 GraphQL API 生成文档：

Schema：
[GraphQL Schema]

对每个 Query/Mutation：
- 描述
- 参数
- 返回类型
- 示例查询
```

### 变体 3：组件 Props 文档

```
为 React 组件生成 Props 文档：

组件代码：
[组件代码]

生成：
- Props 表格
- 类型定义
- 默认值
- 使用示例
```

## API 文档模板

### REST API 模板

见上方完整示例

### 函数库模板

```markdown
# 函数名

## 语法

\`\`\`typescript
function functionName(param1: Type1, param2: Type2): ReturnType
\`\`\`

## 参数

| 参数 | 类型 | 必需 | 默认值 | 描述 |
|------|------|------|--------|------|
| param1 | Type1 | 是 | - | 描述 |
| param2 | Type2 | 否 | value | 描述 |

## 返回值

- `ReturnType`: 描述

## 示例

### 基本用法

\`\`\`javascript
const result = functionName(arg1, arg2);
\`\`\`

### 高级用法

\`\`\`javascript
// 复杂示例
\`\`\`

## 注意事项

- 注意事项 1
- 注意事项 2

## 相关

- [相关函数](link)
```

## 最佳实践

### 1. 清晰的示例

```markdown
✅ Good: 完整的可运行示例
✅ 多种语言的示例
❌ Bad: 不完整或过于复杂的示例
```

### 2. 表格展示参数

使用表格清晰展示参数信息

### 3. 错误处理文档

详细说明可能的错误和处理方法

### 4. 交互式文档

如果可能，提供可交互的 API 测试（如 Swagger UI）

### 5. 版本管理

清楚标注 API 版本和变更

## 注意事项

1. **保持更新**：API 变更时及时更新文档
2. **完整性**：包含所有端点和参数
3. **示例丰富**：提供多种场景的示例
4. **易于导航**：清晰的目录和锚点
5. **安全信息**：说明认证和权限要求

## 相关资源

- [README 生成 Prompt](readme-generation.md)
- [Swagger/OpenAPI](https://swagger.io/)
- [API 文档工具](https://stoplight.io/)

---

**立即使用**: 提供 API 代码，生成完整文档！
