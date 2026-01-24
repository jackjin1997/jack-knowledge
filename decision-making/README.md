# 个人决策系统

基于苏格拉底式对话的个人决策支持系统，帮助你发现内心真实的想法。

## 核心理念

### AI 的角色：引导者，而非决策者

**AI 在这里的作用是**：
- 🧭 **引导者** - 通过提问帮助你探索
- 🪞 **镜子** - 反映你的思考过程
- 🤝 **教练** - 支持你做出自己的决策

**AI 不会**：
- ❌ 给你建议
- ❌ 替你做决策
- ❌ 鼓动你选择某个方案
- ❌ 评判你的选择

### 设计原则

1. **苏格拉底式对话** - 通过提问引导思考
2. **价值观澄清** - 帮助识别真正重要的事
3. **自我觉察** - 发现内心真实的声音
4. **完整记录** - 决策日志和复盘系统

## 系统组成

```
decision-making/
├── coaches/          # 决策教练 (4个专业 Agents)
├── methods/          # 决策方法 (4种思考框架)
├── frameworks/       # 记录和复盘框架
├── prompts/          # 快速启动 Prompts
└── records/          # 你的决策历史 (私密)
```

## 如何使用

### 场景 1：面临重要决策

```
在 Cursor 中：
"@jack-knowledge/decision-making/coaches/self-discovery-coach.md

我在考虑是否换工作，请帮我探索"
```

Coach 会通过提问帮你：
1. 澄清现状和感受
2. 探索内心真实想法
3. 识别价值观
4. 发现决策的本质

### 场景 2：需要深入思考

```
"@jack-knowledge/decision-making/coaches/values-clarifier.md
 @jack-knowledge/decision-making/methods/socratic-questioning.md

帮我理清这个决策涉及的价值观"
```

### 场景 3：需要多角度分析

```
"@jack-knowledge/decision-making/coaches/perspective-explorer.md

请帮我从不同角度看这个问题"
```

### 场景 4：决策后复盘

```
"@jack-knowledge/decision-making/coaches/reflection-guide.md
 @jack-knowledge/decision-making/frameworks/reflection-template.md

帮我复盘3个月前的决策"
```

## 决策教练 (Coaches)

### [自我发现教练](coaches/self-discovery-coach.md)
通过提问帮你发现内心真实的想法和感受

**适用场景**：
- 不知道自己真正想要什么
- 面临多个选择，难以抉择
- 需要探索内心的声音

### [价值观澄清教练](coaches/values-clarifier.md)
帮助识别和澄清核心价值观

**适用场景**：
- 需要判断选择是否符合价值观
- 价值观冲突的决策
- 长期影响重大的决策

### [多角度探索教练](coaches/perspective-explorer.md)
引导从不同角度看问题，发现盲点

**适用场景**：
- 觉得考虑不够全面
- 需要突破思维定式
- 评估风险和影响

### [反思引导教练](coaches/reflection-guide.md)
引导决策后的复盘和学习

**适用场景**：
- 决策后的复盘
- 从经验中学习
- 提升决策能力

## 决策方法 (Methods)

### [苏格拉底式提问法](methods/socratic-questioning.md)
通过6类问题层层深入探究

### [五个为什么](methods/five-whys.md)
连续问"为什么"，找到真实动机

### [价值观对齐法](methods/values-alignment.md)
检查决策与价值观的一致性

### [未来自我对话法](methods/future-self-dialogue.md)
与5年后的自己对话，获得时间视角

## 决策记录

### [决策日志](frameworks/decision-journal.md)
记录决策过程的完整框架

**包含**：
- 背景情况
- 考虑的选项
- 内心思考过程
- 关键顾虑
- 价值观考量
- 最终决策和原因

### [复盘模板](frameworks/reflection-template.md)
决策后反思的结构化模板

**包含**：
- 实际结果
- 与预期对比
- 新的发现
- 经验总结

### 记录管理

你的决策记录保存在 `records/` 目录：
- 私密性保护（已加入 .gitignore）
- 按日期组织：`YYYY-MM-DD-decision-name.md`
- 使用统一模板

## 使用流程

```
1. 选择合适的 Coach
   ↓
2. 开始苏格拉底式对话
   ↓
3. 探索内心想法和价值观
   ↓
4. 你做出自己的决策
   ↓
5. 记录决策日志
   ↓
6. 执行决策
   ↓
7. 定期复盘反思
   ↓
8. 提取经验，提升决策能力
```

## 与其他模块协同

这个决策系统可以配合使用：

- **Prompts** - 用于快速分析
  ```
  @jack-knowledge/prompts/debugging/frequently-used/error-analysis.md
  结合决策教练分析技术选型问题
  ```

- **Workflows** - 用于结构化流程
  ```
  @jack-knowledge/workflows/development/frequently-used/feature-development.md
  在功能开发决策时参考
  ```

- **Skills** - 用于辅助工具
  ```
  @jack-knowledge/skills/development/frequently-used/create-rule
  在决策后创建规则固化经验
  ```

## 核心原则提醒

### 你是决策者

- ✅ 决策永远由你做出
- ✅ AI 只是帮你看清自己
- ✅ 没有对错，只有选择
- ✅ 相信你内心的声音

### Coach 的职责

- ✅ 提出有力的问题
- ✅ 倾听和反映
- ✅ 保持中立
- ✅ 尊重你的价值观

### 记录的价值

- 📝 记录帮助澄清思路
- 🔍 复盘帮助提升能力
- 📈 积累形成个人决策智慧
- 🎯 发现决策模式

## 快速开始

### 第一次使用

1. **选择一个教练**
   ```
   推荐从 self-discovery-coach 开始
   ```

2. **准备好开放的心态**
   - 诚实面对自己
   - 接受不确定性
   - 相信过程

3. **开始对话**
   ```
   "@jack-knowledge/decision-making/coaches/self-discovery-coach.md
   
   我在考虑 [你的决策]，请帮我探索"
   ```

4. **记录你的思考**
   - 对话结束后，用决策日志记录
   - 保存到 records/ 目录

5. **执行并复盘**
   - 做出决策后执行
   - 1-3个月后使用 reflection-guide 复盘

## 常见问题

### Q: 如果 AI 给了建议怎么办？
A: 提醒 AI 它的角色是教练，不是顾问。你可以说："请不要给建议，只问问题帮我探索。"

### Q: 我还是不知道怎么选怎么办？
A: 这很正常。继续探索，或者：
- 换一个 Coach（如 perspective-explorer）
- 使用不同的方法（如 five-whys）
- 给自己更多时间

### Q: 决策后后悔怎么办？
A: 这是学习的机会：
1. 使用 reflection-guide 复盘
2. 识别决策过程中的盲点
3. 提取经验，下次更好

### Q: 需要保存所有决策吗？
A: 不需要。只记录重要的决策。判断标准：
- 对未来有长期影响
- 涉及核心价值观
- 你想从中学习

## 最佳实践

1. **定期复盘**
   - 每季度回顾一次决策记录
   - 识别决策模式
   - 总结经验教训

2. **诚实记录**
   - 记录真实的想法，不美化
   - 包括犹豫和矛盾
   - 这是给自己看的

3. **给予时间**
   - 重要决策不要急
   - 给自己探索的空间
   - 必要时睡一觉再说

4. **信任过程**
   - 答案在你心中
   - 教练只是帮你发现
   - 相信自己的判断

## 延伸阅读

- 苏格拉底式对话的哲学基础
- 价值观心理学
- 决策日志的科学依据
- 反思性实践 (Reflective Practice)

---

**记住**：这个系统的目的不是帮你做"正确"的决策，而是帮你做"你自己"的决策。

**开始探索**：选择一个 Coach，开始你的第一次对话！
