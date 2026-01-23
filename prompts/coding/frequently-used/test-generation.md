# 测试生成 Prompt

自动生成全面的测试用例。

## 用途

为代码生成完整的测试用例，包括单元测试、边界测试、异常测试。

## 使用场景

- 为新代码编写测试
- 提高测试覆盖率
- 补充遗漏的测试用例
- 学习测试最佳实践

## Prompt 模板

```
请为以下代码生成全面的测试用例：

## 代码信息
- 语言/框架：{语言和测试框架}
- 测试框架：{如 Jest, pytest, JUnit}
- 功能描述：{代码功能}

## 待测试代码
\`\`\`{language}
{代码内容}
\`\`\`

请生成：

### 1. 单元测试 (Unit Tests)
测试每个函数/方法的基本功能
- 正常输入的测试
- 测试返回值
- 测试状态变化（如适用）

### 2. 边界测试 (Boundary Tests)
- 空输入
- 最小值/最大值
- 边界条件
- 特殊字符/格式

### 3. 异常测试 (Exception Tests)
- 非法输入
- 错误情况
- 异常处理
- 超时情况（如适用）

### 4. 集成测试 (Integration Tests，如适用)
- 与其他模块的交互
- API 调用
- 数据库操作

### 5. 性能测试 (Performance Tests，如适用)
- 大数据量
- 并发访问
- 响应时间

对每个测试用例：
- 提供清晰的测试名称
- 说明测试目的
- 包含断言（assertion）
- 使用 AAA 模式（Arrange-Act-Assert）

目标测试覆盖率：{目标覆盖率，如 80%}
```

## 变量说明

- `{语言和测试框架}`: 如"TypeScript + Jest"
- `{如 Jest, pytest, JUnit}`: 项目使用的测试框架
- `{代码功能}`: 简短描述
- `{language}`: 代码语言标识
- `{代码内容}`: 待测试的代码
- `{目标覆盖率}`: 期望的测试覆盖率

## 使用示例

### 示例 1：测试工具函数

**输入**：
```
请为以下代码生成全面的测试用例：

## 代码信息
- 语言/框架：TypeScript
- 测试框架：Jest
- 功能描述：验证邮箱地址格式

## 待测试代码
\`\`\`typescript
export function validateEmail(email: string): boolean {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}
\`\`\`

[... 后续要求按模板 ...]
目标测试覆盖率：100%
```

**预期输出**：
```typescript
describe('validateEmail', () => {
  // 单元测试 - 正常情况
  describe('valid emails', () => {
    test('should return true for valid email', () => {
      expect(validateEmail('test@example.com')).toBe(true);
    });
    
    test('should return true for email with subdomain', () => {
      expect(validateEmail('user@mail.example.com')).toBe(true);
    });
    
    test('should return true for email with plus sign', () => {
      expect(validateEmail('user+tag@example.com')).toBe(true);
    });
  });
  
  // 单元测试 - 异常情况
  describe('invalid emails', () => {
    test('should return false for email without @', () => {
      expect(validateEmail('testexample.com')).toBe(false);
    });
    
    test('should return false for email without domain', () => {
      expect(validateEmail('test@')).toBe(false);
    });
    
    test('should return false for email without TLD', () => {
      expect(validateEmail('test@example')).toBe(false);
    });
  });
  
  // 边界测试
  describe('edge cases', () => {
    test('should return false for empty string', () => {
      expect(validateEmail('')).toBe(false);
    });
    
    test('should return false for string with only spaces', () => {
      expect(validateEmail('   ')).toBe(false);
    });
    
    test('should return false for string with spaces in email', () => {
      expect(validateEmail('test @example.com')).toBe(false);
    });
  });
  
  // 异常测试
  describe('error handling', () => {
    test('should handle very long email', () => {
      const longEmail = 'a'.repeat(1000) + '@example.com';
      expect(() => validateEmail(longEmail)).not.toThrow();
    });
  });
});
```

### 示例 2：测试 API 端点

**输入**：
```
请为以下代码生成全面的测试用例：

## 代码信息
- 语言/框架：Node.js + Express
- 测试框架：Jest + Supertest
- 功能描述：创建用户 API

## 待测试代码
\`\`\`javascript
app.post('/api/users', async (req, res) => {
  try {
    const { name, email } = req.body;
    
    if (!name || !email) {
      return res.status(400).json({ error: 'Name and email required' });
    }
    
    const user = await User.create({ name, email });
    res.status(201).json(user);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});
\`\`\`

[... 后续要求按模板 ...]
```

## 变体

### 变体 1：只生成单元测试

```
请为以下函数生成单元测试：

函数：
[代码]

测试框架：{测试框架}

只需要基本的单元测试，覆盖：
- 正常情况
- 常见边界情况
- 明显的错误情况
```

### 变体 2：补充缺失的测试

```
当前测试代码：
[现有测试]

待测试代码：
[完整代码]

请：
1. 分析现有测试的覆盖情况
2. 识别缺失的测试场景
3. 生成补充测试用例
4. 说明新增测试覆盖的场景
```

### 变体 3：TDD 风格测试

```
功能需求：
[需求描述]

请按 TDD 方式生成测试：
1. 先写测试用例（此时代码未实现，测试会失败）
2. 包含所有预期行为的测试
3. 使用描述性的测试名称
4. 后续我会实现代码让测试通过
```

### 变体 4：React 组件测试

```
请为以下 React 组件生成测试：

组件代码：
[组件代码]

测试框架：React Testing Library + Jest

测试：
1. 组件渲染
2. Props 传递
3. 用户交互（点击、输入等）
4. 条件渲染
5. Hooks 行为
6. 快照测试（如适用）
```

## 测试模式

### AAA 模式 (Arrange-Act-Assert)

```typescript
test('should add two numbers', () => {
  // Arrange: 准备测试数据
  const a = 5;
  const b = 3;
  
  // Act: 执行被测试的代码
  const result = add(a, b);
  
  // Assert: 断言结果
  expect(result).toBe(8);
});
```

### Given-When-Then

```typescript
test('user login with valid credentials', () => {
  // Given: 给定初始条件
  const user = { email: 'test@example.com', password: 'password123' };
  
  // When: 当执行某个操作
  const result = await login(user.email, user.password);
  
  // Then: 那么应该得到预期结果
  expect(result.success).toBe(true);
  expect(result.token).toBeDefined();
});
```

## 测试最佳实践

### 1. 清晰的测试名称

```typescript
✅ Good:
test('should return 400 when email is missing')
test('should create user with valid data')
test('should hash password before saving')

❌ Bad:
test('test 1')
test('user creation')
test('it works')
```

### 2. 独立的测试

```typescript
✅ Good: 每个测试独立
test('test A', () => {
  const data = createTestData();
  // 测试 A
});

test('test B', () => {
  const data = createTestData(); // 重新创建
  // 测试 B
});

❌ Bad: 测试之间有依赖
let sharedData;
test('test A', () => {
  sharedData = ...;
});
test('test B', () => {
  // 依赖 test A 的 sharedData
});
```

### 3. 一个测试一个断言（或一组相关断言）

```typescript
✅ Good:
test('should create user with correct name', () => {
  const user = createUser({ name: 'John' });
  expect(user.name).toBe('John');
});

test('should create user with correct email', () => {
  const user = createUser({ email: 'john@example.com' });
  expect(user.email).toBe('john@example.com');
});

✅ Also Good: 相关断言可以组合
test('should create user with correct properties', () => {
  const user = createUser({ name: 'John', email: 'john@example.com' });
  expect(user).toMatchObject({
    name: 'John',
    email: 'john@example.com'
  });
});
```

### 4. 使用 Mock 隔离依赖

```typescript
test('should send email notification', async () => {
  // Mock 外部依赖
  const emailService = {
    send: jest.fn().mockResolvedValue({ success: true })
  };
  
  await notifyUser(user, emailService);
  
  expect(emailService.send).toHaveBeenCalledWith(
    user.email,
    expect.any(String)
  );
});
```

## 测试清单

针对不同类型的代码：

### 纯函数
- [ ] 正常输入
- [ ] 边界值
- [ ] 空值/null/undefined
- [ ] 类型错误（如适用）

### API 端点
- [ ] 成功响应（200/201）
- [ ] 输入验证（400）
- [ ] 认证/授权（401/403）
- [ ] 资源未找到（404）
- [ ] 服务器错误（500）

### React 组件
- [ ] 渲染测试
- [ ] Props 测试
- [ ] 事件处理
- [ ] 状态更新
- [ ] 条件渲染
- [ ] Hooks 行为

### 异步代码
- [ ] 成功情况
- [ ] 失败/错误情况
- [ ] 超时情况
- [ ] 并发情况

## 注意事项

1. **测试行为，不是实现**：测试公共 API，不测试内部实现细节
2. **测试名称描述性强**：看测试名就知道测试什么
3. **避免测试私有方法**：如需测试，考虑是否应该是公共方法
4. **使用工厂函数**：创建测试数据，保持测试简洁
5. **清理副作用**：使用 afterEach 清理，确保测试独立
6. **合理使用 Mock**：不要过度 mock，保持测试有意义

## 相关资源

- [实现功能 Prompt](implement-feature.md)
- [代码审查 Prompt](code-review.md)
- [单元测试工作流](../../../workflows/testing/frequently-used/unit-testing.md)

---

**立即使用**: 粘贴代码，生成全面的测试用例！
