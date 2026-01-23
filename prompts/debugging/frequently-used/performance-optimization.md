# 性能优化 Prompt

识别性能瓶颈并提供优化方案。

## 用途

分析代码或应用的性能问题，识别瓶颈，提供具体的优化建议。

## 使用场景

- 应用响应缓慢
- 资源使用过高
- 性能优化需求
- 性能测试和调优

## Prompt 模板

```
需要分析和优化以下代码/系统的性能：

## 性能问题描述
{描述性能问题，如响应慢、内存高等}

## 当前性能指标
- 响应时间：{当前值} (目标：{目标值})
- 吞吐量：{当前值} (目标：{目标值})
- CPU使用：{百分比}
- 内存使用：{大小}
- 数据量：{记录数/文件大小等}

## 技术栈
- 语言/框架：{技术栈}
- 数据库：{数据库类型}
- 缓存：{缓存方案}
- 环境：{硬件/云环境}

## 相关代码
\`\`\`{language}
{代码}
\`\`\`

## 性能数据（如有）
- 火焰图：{链接或描述}
- 慢查询日志：{日志}
- 性能分析报告：{报告}

请进行性能分析：

### 1. 性能分析
- 识别瓶颈点
- 计算时间复杂度
- 计算空间复杂度
- 找出重复计算
- 识别不必要的操作

### 2. 优化建议
按优先级（影响大小）排序：

**高优先级（Quick Wins）**
1. [优化点] - 预期提升：{百分比}
   - 当前问题：
   - 优化方案：
   - 实施难度：{低/中/高}

**中优先级（Important）**
2. ...

**低优先级（Future）**
3. ...

### 3. 优化代码
提供优化后的代码实现

### 4. 性能对比
- 优化前：{复杂度/性能指标}
- 优化后：{复杂度/性能指标}
- 提升幅度：{百分比}

### 5. 测试建议
- 性能测试方法
- 基准测试代码
- 压力测试场景

### 6. 监控建议
- 关键指标
- 告警阈值
- 监控实施
```

## 使用示例

### 示例 1：数据库查询优化

**输入**：
```
需要优化以下代码的性能：

## 性能问题
用户列表页面加载缓慢

## 当前性能指标
- 响应时间：3.5秒 (目标：< 500ms)
- 数据量：10,000 用户记录
- 查询时间：3.2秒

## 技术栈
- 语言/框架：Node.js + Express + Sequelize
- 数据库：PostgreSQL
- 缓存：Redis (未充分利用)

## 相关代码
\`\`\`javascript
async function getUserList(req, res) {
  const users = await User.findAll({
    include: [
      { model: Profile },
      { model: Post },
      { model: Comment }
    ]
  });
  
  const enrichedUsers = await Promise.all(
    users.map(async (user) => {
      const postCount = await Post.count({ where: { userId: user.id } });
      const lastLogin = await Login.findOne({
        where: { userId: user.id },
        order: [['createdAt', 'DESC']]
      });
      
      return {
        ...user.toJSON(),
        postCount,
        lastLoginAt: lastLogin?.createdAt
      };
    })
  );
  
  res.json(enrichedUsers);
}
\`\`\`

[... 后续分析按模板 ...]
```

## 变体

### 变体 1：前端性能优化

```
前端应用性能问题：

页面：{页面名称}
问题：{加载慢/渲染慢/交互卡顿}

性能指标：
- FCP: {时间}
- LCP: {时间}
- TTI: {时间}
- Bundle Size: {大小}

代码：
[React/Vue 组件代码]

请优化：
1. 加载性能（代码分割、懒加载）
2. 渲染性能（虚拟化、memo）
3. 打包优化（tree shaking、压缩）
4. 资源优化（图片、字体）
```

### 变体 2：算法优化

```
算法性能问题：

功能：{算法功能}
当前复杂度：O({复杂度})
数据规模：{数据量}
当前耗时：{时间}

代码：
[算法实现]

请：
1. 分析当前算法复杂度
2. 提出更优算法
3. 降低时间/空间复杂度
4. 提供优化实现
5. 复杂度对比
```

### 变体 3：系统架构优化

```
系统性能瓶颈：

架构：{架构描述}
瓶颈：{瓶颈点}
并发量：{当前/目标}

性能数据：
- API 响应时间：{统计}
- 数据库负载：{指标}
- 缓存命中率：{百分比}

请从架构层面提出：
1. 缓存策略
2. 数据库优化（索引、分表）
3. 异步处理
4. 负载均衡
5. CDN 使用
```

## 常见优化技术

### 1. 缓存

```typescript
// 添加缓存
const cache = new Map();

async function getUser(id) {
  if (cache.has(id)) {
    return cache.get(id);
  }
  
  const user = await db.user.findById(id);
  cache.set(id, user);
  return user;
}
```

### 2. 批量操作

```typescript
// 批量查询替代循环查询
// ❌ Bad: N+1 查询
for (const user of users) {
  user.posts = await Post.findAll({ where: { userId: user.id } });
}

// ✅ Good: 批量查询
const userIds = users.map(u => u.id);
const posts = await Post.findAll({ where: { userId: userIds } });
const postsByUser = groupBy(posts, 'userId');
users.forEach(user => {
  user.posts = postsByUser[user.id] || [];
});
```

### 3. 索引

```sql
-- 添加数据库索引
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_posts_user_created ON posts(user_id, created_at);
```

### 4. 分页

```typescript
// 使用分页
async function getUsers(page = 1, pageSize = 20) {
  return await User.findAll({
    limit: pageSize,
    offset: (page - 1) * pageSize
  });
}
```

### 5. 懒加载

```typescript
// React 组件懒加载
const HeavyComponent = lazy(() => import('./HeavyComponent'));

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <HeavyComponent />
    </Suspense>
  );
}
```

## 性能优化清单

### 前端
- [ ] 代码分割
- [ ] 懒加载
- [ ] 图片优化
- [ ] 缓存策略
- [ ] 减少重渲染
- [ ] 虚拟滚动

### 后端
- [ ] 数据库索引
- [ ] 查询优化（避免 N+1）
- [ ] 缓存使用
- [ ] 异步处理
- [ ] 批量操作
- [ ] 连接池

### 数据库
- [ ] 索引优化
- [ ] 查询优化
- [ ] 分表分库
- [ ] 读写分离
- [ ] 慢查询优化

### 架构
- [ ] CDN
- [ ] 负载均衡
- [ ] 消息队列
- [ ] 微服务拆分
- [ ] 缓存层

## 性能测试

### 基准测试

```javascript
// 使用 benchmark.js
const Benchmark = require('benchmark');
const suite = new Benchmark.Suite();

suite
  .add('方案A', function() {
    // 代码 A
  })
  .add('方案B', function() {
    // 代码 B
  })
  .on('cycle', function(event) {
    console.log(String(event.target));
  })
  .on('complete', function() {
    console.log('最快: ' + this.filter('fastest').map('name'));
  })
  .run();
```

### 压力测试

```bash
# 使用 Apache Bench
ab -n 1000 -c 10 http://localhost:3000/api/users

# 使用 wrk
wrk -t12 -c400 -d30s http://localhost:3000/api/users
```

## 注意事项

1. **测量优先**：先测量，再优化，避免过早优化
2. **关注瓶颈**：优化影响最大的部分
3. **权衡取舍**：考虑复杂度、可维护性与性能的平衡
4. **验证效果**：优化后测量实际提升
5. **监控持续**：持续监控，防止性能退化

## 相关资源

- [错误分析 Prompt](error-analysis.md)
- [代码审查 Prompt](../../coding/frequently-used/code-review.md)
- [重构 Prompt](../../refactoring/frequently-used/clean-code.md)

---

**立即使用**: 粘贴代码和性能数据，获取优化建议！
