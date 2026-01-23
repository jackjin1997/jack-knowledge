# 提取组件 Prompt

识别并提取可复用的组件或函数。

## 用途

从现有代码中识别重复模式，提取为可复用的组件、函数或模块。

## 使用场景

- 代码重复
- 组件过大需要拆分
- 提取共享逻辑
- 模块化改造

## Prompt 模板

```
请分析以下代码，识别可提取的组件/函数：

## 代码信息
- 语言/框架：{语言和框架}
- 代码类型：{UI组件/工具函数/业务逻辑}
- 当前问题：{重复代码/组件过大/逻辑混杂}

## 现有代码
\`\`\`{language}
{代码}
\`\`\`

## 提取目标
- 减少重复
- 提高复用性
- 降低复杂度
- 提升可测试性

请执行以下步骤：

### 1. 识别可提取内容
分析代码，找出：
- 重复的逻辑/UI 模式
- 可独立的功能模块
- 通用的工具函数
- 可配置的部分

### 2. 设计接口
对每个提取目标：
- 确定输入（参数/props）
- 确定输出（返回值）
- 设计 API（函数签名/组件接口）
- 考虑扩展性

### 3. 实现提取
- 提取为新的函数/组件/模块
- 保持单一职责
- 添加适当的抽象
- 包含类型定义（如适用）

### 4. 重构调用处
- 更新所有使用位置
- 保持原有功能
- 简化调用代码

### 5. 文档和测试
- 添加注释/文档
- 提供使用示例
- 建议测试用例

输出：
1. 提取的组件/函数（完整代码）
2. 重构后的原代码
3. 使用示例
4. 主要改进点
```

## 使用示例

### 示例 1：提取 React 组件

**输入**：
```
请分析以下代码，识别可提取的组件：

## 代码信息
- 语言/框架：React + TypeScript
- 代码类型：UI组件
- 当前问题：组件过大，有重复的表单字段

## 现有代码
\`\`\`typescript
function UserProfileForm() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  
  return (
    <form>
      <div>
        <label>Name</label>
        <input
          type="text"
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
      </div>
      
      <div>
        <label>Email</label>
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
      </div>
      
      <div>
        <label>Phone</label>
        <input
          type="tel"
          value={phone}
          onChange={(e) => setPhone(e.target.value)}
        />
      </div>
      
      <button type="submit">Save</button>
    </form>
  );
}
\`\`\`

[... 后续要求按模板 ...]
```

**预期输出**：

```typescript
// 1. 提取的组件：FormField
interface FormFieldProps {
  label: string;
  type: string;
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  required?: boolean;
}

function FormField({
  label,
  type,
  value,
  onChange,
  placeholder,
  required = false
}: FormFieldProps) {
  return (
    <div className="form-field">
      <label>
        {label}
        {required && <span className="required">*</span>}
      </label>
      <input
        type={type}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        required={required}
      />
    </div>
  );
}

// 2. 重构后的原组件
function UserProfileForm() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  
  return (
    <form>
      <FormField
        label="Name"
        type="text"
        value={name}
        onChange={setName}
        required
      />
      
      <FormField
        label="Email"
        type="email"
        value={email}
        onChange={setEmail}
        required
      />
      
      <FormField
        label="Phone"
        type="tel"
        value={phone}
        onChange={setPhone}
      />
      
      <button type="submit">Save</button>
    </form>
  );
}

// 3. 使用示例
<FormField
  label="Address"
  type="text"
  value={address}
  onChange={setAddress}
  placeholder="Enter your address"
/>

// 主要改进：
// - 提取了 FormField 组件，消除重复
// - 定义了清晰的 Props 接口
// - 支持可选属性（placeholder, required）
// - 原组件更简洁，易于理解和维护
```

## 变体

### 变体 1：提取自定义 Hook

```
以下 React 组件中有可提取的逻辑：

[组件代码]

请：
1. 识别可复用的状态逻辑
2. 提取为自定义 Hook
3. 定义 Hook 的输入和输出
4. 更新组件使用新 Hook
```

### 变体 2：提取工具函数

```
以下代码中有重复的工具逻辑：

[代码]

请：
1. 识别通用的工具函数
2. 提取到 utils 模块
3. 支持参数配置
4. 添加类型定义
5. 更新所有调用处
```

### 变体 3：提取业务逻辑

```
组件中混杂了UI和业务逻辑：

[组件代码]

请：
1. 分离业务逻辑层
2. 提取为独立模块/service
3. 定义清晰的接口
4. 组件只保留 UI 逻辑
```

### 变体 4：微前端拆分

```
单体应用需要模块化：

当前结构：
[应用结构]

请：
1. 识别独立的功能模块
2. 设计模块边界
3. 定义模块间通信接口
4. 提出拆分方案
```

## 提取模式

### 1. 提取函数

```javascript
// Before: 重复逻辑
function processUserA(user) {
  const name = user.firstName + ' ' + user.lastName;
  return name.toUpperCase();
}

function processUserB(user) {
  const name = user.firstName + ' ' + user.lastName;
  return name.toUpperCase();
}

// After: 提取函数
function getFullName(user) {
  return `${user.firstName} ${user.lastName}`;
}

function toUpperCase(text) {
  return text.toUpperCase();
}

function processUser(user) {
  return toUpperCase(getFullName(user));
}
```

### 2. 提取组件

```typescript
// Before: 重复 UI
<div className="card">
  <h3>{title1}</h3>
  <p>{content1}</p>
</div>
<div className="card">
  <h3>{title2}</h3>
  <p>{content2}</p>
</div>

// After: 提取组件
interface CardProps {
  title: string;
  content: string;
}

function Card({ title, content }: CardProps) {
  return (
    <div className="card">
      <h3>{title}</h3>
      <p>{content}</p>
    </div>
  );
}

<Card title={title1} content={content1} />
<Card title={title2} content={content2} />
```

### 3. 提取 Hook

```typescript
// Before: 重复的状态逻辑
function ComponentA() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  
  useEffect(() => {
    setLoading(true);
    fetchData().then(d => {
      setData(d);
      setLoading(false);
    });
  }, []);
}

// After: 提取 Hook
function useData(fetchFn) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  
  useEffect(() => {
    setLoading(true);
    fetchFn().then(d => {
      setData(d);
      setLoading(false);
    });
  }, [fetchFn]);
  
  return { data, loading };
}

function ComponentA() {
  const { data, loading } = useData(fetchData);
}
```

### 4. 提取配置

```javascript
// Before: 硬编码
function validateEmail(email) {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(email);
}

function validatePhone(phone) {
  const regex = /^\d{3}-\d{3}-\d{4}$/;
  return regex.test(phone);
}

// After: 提取配置
const VALIDATION_PATTERNS = {
  email: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
  phone: /^\d{3}-\d{3}-\d{4}$/,
  zipCode: /^\d{5}(-\d{4})?$/
};

function validate(value, type) {
  const pattern = VALIDATION_PATTERNS[type];
  return pattern ? pattern.test(value) : false;
}
```

## 提取原则

### 1. 单一职责
提取的组件/函数应该只做一件事

### 2. 可复用性
至少在 2-3 处使用，才值得提取

### 3. 适当抽象
不要过度抽象，保持简单

### 4. 清晰接口
输入输出明确，易于理解

### 5. 独立性
尽量减少外部依赖

## 提取清单

### 识别阶段
- [ ] 找到重复代码
- [ ] 识别相似模式
- [ ] 发现通用逻辑
- [ ] 评估复用价值

### 设计阶段
- [ ] 定义输入参数
- [ ] 定义输出结果
- [ ] 设计 API
- [ ] 考虑扩展性

### 实现阶段
- [ ] 提取代码
- [ ] 添加类型
- [ ] 编写文档
- [ ] 创建示例

### 重构阶段
- [ ] 更新调用处
- [ ] 移除重复代码
- [ ] 测试功能
- [ ] 代码审查

## 注意事项

1. **不要过度提取**：提取应该简化代码，不是增加复杂度
2. **保持语义**：提取后的名称应该表达清晰的意图
3. **考虑性能**：提取不应该影响性能
4. **向后兼容**：如果是库/框架，考虑兼容性
5. **文档完善**：提取的内容应该有清晰的文档

## 相关资源

- [代码清理 Prompt](clean-code.md)
- [代码审查 Prompt](../../coding/frequently-used/code-review.md)
- [实现功能 Prompt](../../coding/frequently-used/implement-feature.md)

---

**立即使用**: 粘贴有重复的代码，识别提取机会！
