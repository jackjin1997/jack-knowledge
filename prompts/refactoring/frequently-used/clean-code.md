# 代码清理 Prompt

提高代码质量、可读性和可维护性。

## 用途

对现有代码进行清理和优化，提高代码质量，遵循最佳实践。

## 使用场景

- 代码审查后的改进
- 遗留代码维护
- 技术债务清理
- 代码标准化

## Prompt 模板

```
请清理和优化以下代码：

## 代码信息
- 语言/框架：{语言和框架}
- 功能：{代码功能}
- 当前问题：{已知问题，如命名混乱、结构复杂等}

## 待优化代码
\`\`\`{language}
{代码}
\`\`\`

## 优化目标
- 提高可读性
- 简化复杂度
- 遵循最佳实践
- 保持功能不变
- {其他特定目标}

请按以下方面优化：

### 1. 命名优化
- 变量名：清晰、描述性、遵循命名规范
- 函数名：动词开头，表达意图
- 类名：名词，表达概念

### 2. 结构优化
- 函数拆分：单一职责，长度适中
- 代码组织：相关代码放一起
- 层次分明：适当的抽象层次

### 3. 简化逻辑
- 减少嵌套
- 消除重复
- 简化条件判断
- 早返回模式

### 4. 最佳实践
- 遵循语言/框架惯例
- 使用现代语法特性
- 合理的注释
- 错误处理

### 5. 可读性
- 格式一致
- 空行分隔逻辑块
- 避免魔法数字
- 清晰的表达式

对每处修改：
1. 说明为什么要改
2. 改成什么样
3. 带来什么好处

最后提供：
- 优化后的完整代码
- 主要改进点总结
- 测试建议（确保行为不变）
```

## 使用示例

### 示例 1：清理复杂函数

**输入**：
```
请清理和优化以下代码：

## 代码信息
- 语言/框架：JavaScript
- 功能：处理用户订单
- 当前问题：逻辑复杂，嵌套深，难以理解

## 待优化代码
\`\`\`javascript
function processOrder(o) {
  if (o) {
    if (o.items && o.items.length > 0) {
      let t = 0;
      for (let i = 0; i < o.items.length; i++) {
        if (o.items[i].price && o.items[i].quantity) {
          t += o.items[i].price * o.items[i].quantity;
          if (o.items[i].discount) {
            t -= o.items[i].discount;
          }
        }
      }
      if (o.shipping) {
        t += o.shipping;
      }
      if (t > 100) {
        t *= 0.9;
      }
      o.total = t;
      return { success: true, order: o };
    } else {
      return { success: false, error: 'No items' };
    }
  } else {
    return { success: false, error: 'Invalid order' };
  }
}
\`\`\`

[... 后续要求按模板 ...]
```

**预期输出**：

```javascript
// 1. 提取计算项目总价的逻辑
function calculateItemsTotal(items) {
  return items.reduce((total, item) => {
    const itemTotal = item.price * item.quantity;
    const discount = item.discount || 0;
    return total + itemTotal - discount;
  }, 0);
}

// 2. 提取订单验证逻辑
function validateOrder(order) {
  if (!order) {
    throw new Error('Invalid order');
  }
  
  if (!order.items || order.items.length === 0) {
    throw new Error('No items in order');
  }
  
  return true;
}

// 3. 计算折扣
function applyBulkDiscount(total, threshold = 100, discountRate = 0.1) {
  return total > threshold ? total * (1 - discountRate) : total;
}

// 4. 主函数：清晰的流程
function processOrder(order) {
  try {
    validateOrder(order);
    
    const itemsTotal = calculateItemsTotal(order.items);
    const shippingCost = order.shipping || 0;
    const subtotal = itemsTotal + shippingCost;
    const finalTotal = applyBulkDiscount(subtotal);
    
    order.total = finalTotal;
    
    return {
      success: true,
      order
    };
  } catch (error) {
    return {
      success: false,
      error: error.message
    };
  }
}

// 主要改进：
// 1. 命名：o -> order, t -> total, i -> item
// 2. 拆分：提取了3个独立函数，每个单一职责
// 3. 简化：使用 reduce 替代 for 循环
// 4. 早返回：验证失败立即抛出错误
// 5. 常量：魔法数字提取为参数
// 6. 可读性：代码结构清晰，易于理解和测试
```

## 变体

### 变体 1：快速清理

```
快速清理以下代码，重点：
- 改善命名
- 去除明显重复
- 简化逻辑

代码：
[代码]

只做必要改进，保持简单。
```

### 变体 2：重构为现代语法

```
将以下旧代码重构为现代语法：

旧代码：
[使用旧语法的代码]

目标语言版本：{ES2022 / Python 3.10 等}

使用新特性：
- 箭头函数 / async-await
- 解构 / 扩展运算符
- 可选链 / 空值合并
- {其他新特性}
```

### 变体 3：提取重复代码

```
以下代码中有重复逻辑：

[代码]

请：
1. 识别重复模式
2. 提取为可复用函数/组件
3. 重构调用处
4. 确保行为不变
```

### 变体 4：遗留代码现代化

```
遗留代码需要现代化：

当前代码：
[旧代码]

项目标准：
- 使用 {TypeScript/Python type hints}
- 遵循 {编码规范}
- 使用 {现代框架特性}

请完整重构，同时保持向后兼容。
```

## 代码异味识别

### 1. 长函数

```javascript
// ❌ Bad: 100+ 行的函数
function processData(data) {
  // ... 太长了
}

// ✅ Good: 拆分为多个小函数
function processData(data) {
  const validated = validateData(data);
  const transformed = transformData(validated);
  const enriched = enrichData(transformed);
  return saveData(enriched);
}
```

### 2. 深层嵌套

```javascript
// ❌ Bad: 4+ 层嵌套
if (user) {
  if (user.subscription) {
    if (user.subscription.active) {
      if (user.subscription.plan === 'premium') {
        // ...
      }
    }
  }
}

// ✅ Good: 早返回 + 提取
if (!user?.subscription?.active) return;
if (user.subscription.plan !== 'premium') return;
// ...
```

### 3. 魔法数字

```javascript
// ❌ Bad
if (user.age >= 18 && score > 60) { }

// ✅ Good
const ADULT_AGE = 18;
const PASSING_SCORE = 60;
if (user.age >= ADULT_AGE && score > PASSING_SCORE) { }
```

### 4. 重复代码

```javascript
// ❌ Bad: 重复逻辑
function calculateDiscountA(price) {
  return price * 0.9;
}
function calculateDiscountB(price) {
  return price * 0.9;
}

// ✅ Good: 提取公共逻辑
function applyDiscount(price, rate = 0.1) {
  return price * (1 - rate);
}
```

### 5. 模糊命名

```javascript
// ❌ Bad
function proc(d) {
  let t = 0;
  for (let i = 0; i < d.length; i++) {
    t += d[i].p * d[i].q;
  }
  return t;
}

// ✅ Good
function calculateTotal(items) {
  let total = 0;
  for (const item of items) {
    total += item.price * item.quantity;
  }
  return total;
}
```

## Clean Code 原则

### 1. 有意义的命名
- 使用可搜索的名称
- 避免缩写（除非约定俗成）
- 类名用名词，函数名用动词
- 布尔变量用 is/has/can 开头

### 2. 函数应该小
- 一个函数只做一件事
- 函数长度：10-20 行为宜
- 抽象层次一致
- 参数数量：0-3 个最佳

### 3. 注释用于说明"为什么"
- 代码说明"做什么"
- 注释说明"为什么这样做"
- 好的代码 > 注释
- 避免废话注释

### 4. DRY（Don't Repeat Yourself）
- 避免重复代码
- 提取公共逻辑
- 使用函数/类/模块复用

### 5. 早返回
- 提前处理错误情况
- 减少嵌套层次
- 主逻辑更清晰

## 重构清单

### 命名
- [ ] 变量名有意义
- [ ] 函数名表达意图
- [ ] 类名表达概念
- [ ] 避免误导性名称

### 函数
- [ ] 单一职责
- [ ] 长度适中（< 20行）
- [ ] 参数合理（< 3个）
- [ ] 无副作用

### 结构
- [ ] 代码组织清晰
- [ ] 抽象层次一致
- [ ] 依赖方向正确
- [ ] 模块职责明确

### 逻辑
- [ ] 减少嵌套（< 3层）
- [ ] 消除重复
- [ ] 简化条件
- [ ] 早返回模式

### 最佳实践
- [ ] 遵循语言惯例
- [ ] 错误处理完整
- [ ] 使用现代语法
- [ ] 适当的注释

## 注意事项

1. **保持行为不变**：重构不改变功能
2. **小步前进**：一次改一点，频繁测试
3. **测试保护**：先写测试，再重构
4. **代码审查**：重构后请人审查
5. **权衡利弊**：不要为了重构而重构

## 相关资源

- [提取组件 Prompt](extract-component.md)
- [代码审查 Prompt](../../coding/frequently-used/code-review.md)
- [测试生成 Prompt](../../coding/frequently-used/test-generation.md)

---

**立即使用**: 粘贴需要优化的代码，获得清理建议！
