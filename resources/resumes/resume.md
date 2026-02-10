# 靳泽旭 — 后端开发工程师（AI Agent 方向）

> **电话** 18158522238 &emsp; **邮箱** jackjin1997@gmail.com &emsp; **GitHub** [jackjin1997](https://github.com/jackjin1997)
>
> **工作年限** 5 年（2020.07 - 至今） &emsp; **学历** 本科 · 软件工程 &emsp; **求职意向** 后端开发工程师（AI Agent 方向）

---

## 个人简介

5 年全栈开发经验，2 年+ AI 应用架构经验。曾作为技术负责人带领 5 人团队完成多个核心产品从 0 到 1 的落地。

**开源贡献**：
- **LangChain Contributor** — AI 应用开发领域最流行的开源框架（126k+ Stars）
- **Antigravity Awesome Skills Contributor** — AI Agent 技能集合（7.8k+ Stars），贡献完整 Skill 模块
- **Cosmos SDK Contributor** — 区块链领域知名开源框架（6.9k+ Stars）

**核心优势**：
- LangChain/LangGraph 开源贡献者，深度理解框架底层实现，具备多 Agent 系统设计与生产落地能力
- 主导过企业级低代码/工作流平台架构设计，成功服务银行、电商等 B 端头部客户
- 从零设计并实现插件化微服务框架，已支撑多个核心微服务稳定运行
- 熟悉 Claude / OpenAI / Bedrock 等主流大模型 API，有 AI 应用生产环境落地经验
- 具备法企工作背景，有国际化 B 端 SaaS 产品全流程开发经验

---

## 工作经历

### 跨越星空科技有限公司 — 后端开发工程师 → 技术负责人
<sub>2022.09 - 至今 &emsp;|&emsp; 公司专注于 AI Agent 与智能自动化产品</sub>

1. **技术团队管理**
   - 作为技术负责人，带领 5 人研发团队，负责 AI 产品线和微服务基础设施的架构设计与开发
   - 制定技术规范和代码评审标准，推动团队技术能力提升
   - 参与产品需求评审，负责技术方案设计和技术选型决策

2. **AI Agent 产品研发**（2024 - 至今）
   - 主导旅行领域 AI Agent 产品的整体技术架构设计
   - 基于 LangChain/LangGraph 设计多 Agent 协作系统，实现智能旅行规划助手
   - 从零设计插件化微服务框架，支撑 AI 产品后端服务快速迭代

3. **低代码平台 & 其他产品研发**（2022 - 2024）
   - 主导企业级低代码/工作流编排平台的架构设计与开发，服务银行、电商等 B 端头部客户
   - 开发 IHelp 在线客服系统（NestJS + Socket.io）、Tracker 事件追踪微服务（Fastify + Elasticsearch）
   - 负责 Prompt 微服务、向量搜索微服务、日志微服务（Python + S3 + Athena）等基础设施建设

4. **核心成果**
   - AI Agent 系统上线后作为产品核心功能持续迭代，获得用户正向反馈
   - 微服务框架支撑 5+ 核心服务稳定运行，显著缩短新服务搭建周期
   - 低代码平台成功落地多家银行和电商客户，获得客户续约

---

### FTL Group / 法翔物流有限公司（法企） — 全栈开发工程师
<sub>2020.07 - 2022.07（2 年）&emsp;|&emsp; 法国电商物流方案提供商</sub>

1. **esendeo 物流平台核心开发**
   - 参与 esendeo 物流方案设计平台的核心功能开发，为电商网站及商户提供物流解决方案
   - 主导 SQL 性能优化和对账系统重构，显著提升系统处理效率
   - 定价表重构：拆表设计 + Redis 缓存，解决对账与下单价格不统一问题

2. **esendeo-shopify 小程序（0 到 1 开发）**
   - 基于 Next.js 服务端渲染 + Koa 后端，为 Shopify/Prestashop 电商平台提供物流下单能力
   - 功能模块：电商订单管理、包裹管理、账单管理、配置管理、售后服务

3. **YLab 技术研发小组**
   - 封装 element-ui-extension：统一管理皮肤、登录页、公共控件、菜单栏
   - 封装 ftl/typeorm：规范化 TypeORM 使用，配置拦截器，修复原生漏洞
   - 爬虫开发：Puppeteer 爬取客户地址、海关 HSCODE；Playwright 做海关编码校验

4. **核心成果**
   - SQL 和对账重构后系统处理效率显著提升，服务器压力明显降低
   - 独立完成 esendeo-shopify 小程序 0 到 1 开发并成功上线

---

## 项目经历

### 项目一：旅行规划 AI Agent 系统（IMean-Coyage）

<sub>2024.01 - 至今 &emsp;|&emsp; 技术负责人 / AI 架构师 &emsp;|&emsp; 5 人团队</sub>

**项目背景**：构建基于大语言模型的智能旅行助手，理解用户旅行需求，提供个性化的酒店、航班、餐厅、景点推荐，并自动生成完整行程规划。传统规则引擎难以处理复杂多变的用户意图，因此选择基于多 Agent 架构实现。

**技术方案**：

- **多 Agent 协作架构（Supervisor 模式）**：Supervisor 作为中央协调器，根据用户意图动态调度 6 种专家 Agent（Hotel / Flight / Restaurant / Attraction / Itinerary / Currency），覆盖旅行规划全场景
- **三阶段行程规划**：Overview（分析需求、创建框架）→ Detail（逐日填充、整合 POI 池和交通池）→ Review（质量评估、确认或重新规划）
- **LangGraph 状态管理**：POI 池存储各 Agent 推荐结果并支持去重排序；交通池管理航班方案（Flight Agent 内部为 4 阶段流水线：Dispatcher → Search → Best of Best → Package）；对话摘要压缩历史上下文解决长对话限制；Checkpoint 机制支持状态持久化与对话回溯
- **混合架构部署**：Node.js 处理业务逻辑 + Python/FastAPI 处理 AI 推理，双容器 Kubernetes Pod 部署
- **流式响应与可观测性**：基于 SSE 实现流式输出；集成 LangSmith 全链路追踪与自定义事件分发
- **工具集成**：通过 MCP 协议接入地图服务等外部工具；集成 Tavily 实现实时网页搜索；支持多 LLM 供应商（Claude / OpenAI / AWS Bedrock）灵活切换

**技术栈**：LangChain, LangGraph, LangSmith, Python, FastAPI, Claude API, TypeScript, Node.js, PostgreSQL, Redis, Kubernetes, MCP

**项目成果**：
- 6 种专家 Agent 协作覆盖旅行规划全场景，已作为产品核心功能上线运营
- 流式首字节响应时间控制在秒级，用户体验流畅
- 支持 Checkpoint 对话回溯，用户可回到任意节点重新规划

---

### 项目二：插件化微服务框架（imean-service-engine）

<sub>2024.01 - 至今 &emsp;|&emsp; 核心开发 / 架构师 &emsp;|&emsp; 独立设计开发，团队推广使用</sub>

**项目背景**：为支撑 AI Agent 产品及多个后端服务的快速迭代，从零设计一套轻量级、类型安全、易扩展的微服务框架。传统 NestJS 等框架配置繁琐、学习成本高，且无法满足团队对插件化和自动客户端生成的需求。

**技术方案**：

- **插件化架构**：采用工厂模式创建类型化引擎实例，所有功能通过插件实现。使用 unique Symbol 确保多实例隔离，装饰器驱动定义 API，代码简洁直观
- **洋葱圈优先级模型**：插件按优先级自动排序执行（SYSTEM 50 → SECURITY 100 → LOGGING 200 → BUSINESS 300 → PERFORMANCE 400 → ROUTE 1000），通过 handler.wrap() 构建包装链
- **7 个核心插件**：
  - **Action**：RPC 风格 API + Zod 参数/返回值验证 + AsyncIterator 流式传输 + 幂等性标记
  - **Route**：HTTP 路由 + 三层中间件（全局/模块/路由级）
  - **Cache**：方法级缓存，支持 Memory / Redis 双后端，TTL 与自定义缓存键
  - **Schedule**：分布式定时任务，基于 etcd 主节点选举，支持 FIXED_RATE / FIXED_DELAY
  - **ClientCode**：自动扫描 Action 定义，生成完全类型化的客户端代码
  - **GracefulShutdown**：优雅停机，跟踪活跃请求，信号监听 + 超时保护
  - **DynamicConfig**：基于 etcd 的动态配置，支持热更新、Zod Schema 验证、环境变量回退
- **类型安全**：基于 TypeScript + Zod 实现编译时类型推断和运行时验证，插件配置类型自动聚合，生成的客户端代码完全类型化

**技术栈**：TypeScript, Hono, Zod, Etcd3, Redis, EJSON, Winston, LRU-Cache

**项目成果**：
- 框架已支撑 5+ 微服务稳定运行（datastore、user-center、schedule-center 等）
- ClientCode 插件自动生成类型化客户端，团队无需手写跨服务调用代码
- 新服务基于框架搭建，从项目初始化到基础功能就绪仅需数天

---

### 项目三：企业级低代码/工作流编排平台（imean）

<sub>2022.09 - 2024.01 &emsp;|&emsp; 技术负责人 &emsp;|&emsp; 5 人团队</sub>

**项目背景**：面向银行、电商等 B 端客户，构建类似 Dify/N8n 的低代码平台，让业务人员通过可视化方式编排工作流程，降低自动化门槛，同时集成 AI 能力实现智能匹配和流程规划。

**技术方案**：

- **双层工作流模型**：原子流程（AtomFlow）作为最小执行单元，包含步骤序列和参数化配置；组合流程（CombinedFlow）通过多链表结构连接节点，支持顺序、并行、嵌套三种编排方式
- **可复用组件系统**：内置 LLM 调用、API 请求、条件判断、循环、数据库操作等组件类型，流程节点可引用 AtomFlow 或 Component，实现灵活复用
- **工作流执行引擎**：ProcessService 管理流程生命周期，MongoDB 存储运行时执行状态，Redis 支持断点续执行，RabbitMQ 处理异步任务
- **可视化画布编辑器**：基于 React 实现拖拽式画布，支持节点拖拽、连线、实时预览、自动布局
- **多租户权限系统**：基于 GraphQL + Prisma 构建，Channel 工作空间隔离，RBAC 权限控制（Owner / Admin / Editor / Viewer），分类级别细粒度权限
- **AI 智能匹配**：结合向量搜索和标签匹配，用户输入需求描述自动匹配最相关工作流；AI 辅助条件节点决策，根据上下文动态选择分支
- **企业级特性**：版本控制与回滚、软删除、批量操作、导入导出、审计追踪

**技术栈**：TypeScript, GraphQL (TypeGraphQL), Prisma ORM, React, Redis, MySQL, MongoDB, RabbitMQ

**项目成果**：
- 成功服务多家银行和电商客户，平台上线后持续迭代，获得客户续约
- 业务人员通过可视化编排即可完成流程搭建，大幅降低了对开发人员的依赖

---

### 项目四：物流 SaaS 平台（esendeo）

<sub>2020.07 - 2022.07 &emsp;|&emsp; 全栈开发工程师</sub>

**项目背景**：esendeo 是面向线上电商网站及线下商户的法国物流方案设计 B 端 SaaS 平台，客户可在平台下单、打印运输单票、管理包裹、处理售后。支持 Web 端、API、电商平台小程序等多种下单方式。

**技术方案**：

- **SQL 性能优化**：将 TypeORM save 方法 O(n²) 复杂度拆分为独立的 update/insert 操作，执行时间大幅缩短
- **对账系统重构**：梳理对账逻辑，账单 PDF 使用 AWS Lambda Serverless 异步渲染，速度大幅提升，服务器压力显著降低
- **定价表重构**：拆表设计（定价单元表 1:n 定价范围表），包裹表直接关联定价范围表，Redis 缓存当前生效账单，解决对账与下单价格不统一问题
- **批量下单系统**：前端轮询 + Redis 缓存下单进度 + 异步批量处理，支持高并发场景
- **esendeo-shopify 小程序（0 到 1）**：基于 Next.js + Koa，对接 Shopify/Prestashop 电商平台 API，实现订单拉取、物流下单、取件点选择、订单同步

**技术栈**：Vue (Vuetify), React (Next.js), Node.js (NestJS, Koa), TypeScript, PostgreSQL, Redis, TypeORM, AWS Lambda, Puppeteer, Playwright

**项目成果**：
- SQL 和对账重构后批量数据处理效率显著提升，对账流程从同步阻塞改为异步渲染
- 独立完成 esendeo-shopify 小程序 0 到 1 开发并成功上线

---

## 技术技能

| 领域 | 技能 |
|------|------|
| **AI / LLM** | LangChain（开源贡献者）、LangGraph、LangSmith、Claude API、OpenAI API、AWS Bedrock、MCP 协议 |
| **后端** | TypeScript、Python、Node.js、FastAPI、Hono、GraphQL (TypeGraphQL)、NestJS、Koa |
| **前端** | React、Vue、Next.js |
| **架构** | 微服务架构、插件化架构、低代码平台、分布式系统（etcd、Redis、RabbitMQ） |
| **数据库** | PostgreSQL、MySQL、MongoDB、Redis、Elasticsearch、Prisma ORM、TypeORM |
| **DevOps** | Docker、Kubernetes、GitLab CI、AWS Lambda |
| **区块链** | Cosmos SDK（开源贡献者）、Go |

---

## 教育背景 & 证书

| | |
|---|---|
| **学校** | 浙江大学城市学院 |
| **专业** | 软件工程 |
| **学历** | 本科（2015 - 2019） |
| **证书** | 软件设计师（中级） |

---

## 自我评价

- **技术驱动**：热衷于探索 AI 前沿技术，是 LangChain/LangGraph 开源贡献者，持续跟进社区动态并积极实践落地
- **架构思维**：具备从业务需求到技术方案的完整架构能力，擅长设计可扩展、可维护的系统，有从零搭建框架的实战经验
- **团队协作**：具备 5 人技术团队管理经验，善于技术方案制定和代码评审，推动团队技术成长
- **产品意识**：注重技术对业务的价值，能够平衡技术理想和交付效率，有与银行、电商等 B 端客户直接沟通的经验
- **国际视野**：具备法企工作背景，熟悉国际化 B 端 SaaS 产品的开发流程和协作模式
