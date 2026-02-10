# Zexu Jin — Backend Engineer (AI Agent)

> **Phone** 18158522238 &emsp; **Email** jackjin1997@gmail.com &emsp; **GitHub** [jackjin1997](https://github.com/jackjin1997)
>
> **Experience** 5 Years (Jul 2020 - Present) &emsp; **Education** B.S. in Software Engineering &emsp; **Target** Backend Engineer (AI Agent)

---

## Summary

5 years of full-stack development experience, 2+ years of AI application architecture experience. Led a 5-person team as Tech Lead to deliver multiple core products from scratch.

**Open Source Contributions**:
- **LangChain Contributor** — The most popular open-source framework in AI application development (126k+ Stars)
- **Antigravity Awesome Skills Contributor** — AI Agent skills collection (7.8k+ Stars), contributed complete Skill module
- **Cosmos SDK Contributor** — Well-known blockchain framework (6.9k+ Stars)

**Core Strengths**:
- LangChain/LangGraph open-source contributor with deep understanding of framework internals, capable of designing and shipping multi-Agent systems in production
- Led architecture design of enterprise low-code/workflow platform, successfully serving top-tier banking and e-commerce B2B clients
- Designed and implemented a plugin-based microservice framework from scratch, now powering multiple core services in production
- Experienced with Claude / OpenAI / Bedrock APIs, with hands-on AI application production deployment experience
- Background in a French multinational company, experienced in international B2B SaaS product development

---

## Work Experience

### Starblazer Technology Co., Ltd. — Backend Developer → Tech Lead
<sub>Sep 2022 - Present &emsp;|&emsp; Company focused on AI Agent and intelligent automation products</sub>

1. **Technical Team Management**
   - Led a 5-person engineering team, responsible for AI product line and microservice infrastructure architecture and development
   - Established coding standards and code review processes, driving team technical growth
   - Participated in product requirement reviews, responsible for technical solution design and technology selection

2. **AI Agent Product Development** (2024 - Present)
   - Led the overall technical architecture design of a travel-domain AI Agent product
   - Designed multi-Agent collaboration system based on LangChain/LangGraph, building an intelligent travel planning assistant
   - Designed and implemented a plugin-based microservice framework from scratch to support rapid backend iteration

3. **Low-Code Platform & Other Products** (2022 - 2024)
   - Led architecture design and development of an enterprise low-code/workflow orchestration platform, serving top-tier banking and e-commerce B2B clients
   - Developed IHelp online customer service system (NestJS + Socket.io), Tracker event tracking microservice (Fastify + Elasticsearch)
   - Built Prompt microservice, vector search microservice, logging microservice (Python + S3 + Athena) and other infrastructure

4. **Key Results**
   - AI Agent system launched as a core product feature with continuous iteration and positive user feedback
   - Microservice framework powers 5+ core services in production, significantly reducing new service setup time
   - Low-code platform successfully deployed to multiple banking and e-commerce clients, earning client renewals

---

### FTL Group / Faxiang Logistics Co., Ltd. (French Company) — Full-Stack Developer
<sub>Jul 2020 - Jul 2022 (2 years) &emsp;|&emsp; French e-commerce logistics solution provider</sub>

1. **esendeo Logistics Platform Core Development**
   - Contributed to core feature development of the esendeo logistics solution platform, providing shipping solutions for e-commerce sites and merchants
   - Led SQL performance optimization and billing reconciliation system refactoring, significantly improving system throughput
   - Pricing table refactoring: table splitting + Redis caching, resolving price inconsistencies between billing and ordering

2. **esendeo-shopify Plugin (Built from Scratch)**
   - Built with Next.js SSR + Koa backend, providing logistics ordering capabilities for Shopify/Prestashop e-commerce platforms
   - Feature modules: order management, parcel management, billing, configuration, after-sales service

3. **YLab R&D Group**
   - Developed element-ui-extension: unified management of themes, login pages, shared components, and navigation
   - Developed ftl/typeorm: standardized TypeORM usage, configured interceptors, fixed native bugs
   - Web scraping: Puppeteer for customer addresses and customs HS codes; Playwright for customs code validation

4. **Key Results**
   - SQL and billing refactoring significantly improved batch processing efficiency and reduced server load
   - Independently built and shipped the esendeo-shopify plugin from scratch

---

## Project Experience

### Project 1: Travel Planning AI Agent System (IMean-Coyage)

<sub>Jan 2024 - Present &emsp;|&emsp; Tech Lead / AI Architect &emsp;|&emsp; 5-person team</sub>

**Background**: Built an LLM-powered intelligent travel assistant that understands user travel needs, provides personalized recommendations for hotels, flights, restaurants, and attractions, and automatically generates complete itineraries. Traditional rule engines couldn't handle the complexity and variety of user intents, so a multi-Agent architecture was chosen.

**Technical Approach**:

- **Multi-Agent Collaboration (Supervisor Pattern)**: Supervisor acts as a central coordinator, dynamically dispatching 6 expert Agents (Hotel / Flight / Restaurant / Attraction / Itinerary / Currency) based on user intent, covering all travel planning scenarios
- **Three-Phase Itinerary Planning**: Overview (analyze requirements, create framework) → Detail (fill in daily details, integrate POI pool and transportation pool) → Review (quality assessment, confirm or re-plan)
- **LangGraph State Management**: POI pool stores Agent recommendations with deduplication and ranking; transportation pool manages flight options (Flight Agent internally runs a 4-stage pipeline: Dispatcher → Search → Best of Best → Package); conversation summary compresses history to handle long conversations; Checkpoint mechanism supports state persistence and conversation rollback
- **Hybrid Architecture Deployment**: Node.js for business logic + Python/FastAPI for AI inference, dual-container Kubernetes Pod deployment
- **Streaming & Observability**: SSE-based streaming output; LangSmith integration for end-to-end tracing with custom event dispatching
- **Tool Integration**: External tool access via MCP protocol (map services, etc.); Tavily integration for real-time web search; multi-LLM provider support (Claude / OpenAI / AWS Bedrock) with flexible switching

**Tech Stack**: LangChain, LangGraph, LangSmith, Python, FastAPI, Claude API, TypeScript, Node.js, PostgreSQL, Redis, Kubernetes, MCP

**Results**:
- 6 expert Agents collaborating across all travel planning scenarios, launched as a core product feature
- Streaming first-byte response time at second-level, delivering smooth user experience
- Checkpoint-based conversation rollback, allowing users to revert to any point and re-plan

---

### Project 2: Plugin-Based Microservice Framework (imean-service-engine)

<sub>Jan 2024 - Present &emsp;|&emsp; Core Developer / Architect &emsp;|&emsp; Solo design & development, adopted by team</sub>

**Background**: Designed a lightweight, type-safe, extensible microservice framework from scratch to support the AI Agent product and rapid iteration of multiple backend services. Traditional frameworks like NestJS were configuration-heavy with steep learning curves and lacked support for plugin-based architecture and auto client generation.

**Technical Approach**:

- **Plugin Architecture**: Factory pattern for creating typed engine instances with all features implemented via plugins. Unique Symbols ensure multi-instance isolation, decorator-driven API definitions for clean and intuitive code
- **Onion Priority Model**: Plugins auto-sorted by priority (SYSTEM 50 → SECURITY 100 → LOGGING 200 → BUSINESS 300 → PERFORMANCE 400 → ROUTE 1000), building wrapper chains via handler.wrap()
- **7 Core Plugins**:
  - **Action**: RPC-style API + Zod param/return validation + AsyncIterator streaming + idempotency markers
  - **Route**: HTTP routing + three-tier middleware (global / module / route level)
  - **Cache**: Method-level caching with Memory / Redis backends, TTL and custom cache keys
  - **Schedule**: Distributed cron jobs with etcd leader election, FIXED_RATE / FIXED_DELAY modes
  - **ClientCode**: Auto-scans Action definitions, generates fully typed client code
  - **GracefulShutdown**: Graceful shutdown with active request tracking, signal listening + timeout protection
  - **DynamicConfig**: etcd-based dynamic configuration with hot reload, Zod schema validation, environment variable fallback
- **Type Safety**: Compile-time type inference and runtime validation via TypeScript + Zod, auto-aggregated plugin config types, fully typed generated client code

**Tech Stack**: TypeScript, Hono, Zod, Etcd3, Redis, EJSON, Winston, LRU-Cache

**Results**:
- Framework powers 5+ microservices in production (datastore, user-center, schedule-center, etc.)
- ClientCode plugin auto-generates typed clients, eliminating manual cross-service call code
- New services go from project init to basic functionality in just days

---

### Project 3: Enterprise Low-Code/Workflow Orchestration Platform (IMean)

<sub>Sep 2022 - Jan 2024 &emsp;|&emsp; Tech Lead &emsp;|&emsp; 5-person team</sub>

**Background**: Built a Dify/N8n-like low-code platform for banking and e-commerce B2B clients, enabling business users to visually orchestrate workflows, lowering automation barriers while integrating AI capabilities for smart matching and process planning.

**Technical Approach**:

- **Dual-Layer Workflow Model**: AtomFlow as the minimum execution unit containing step sequences and parameterized configurations; CombinedFlow connecting nodes via multi-linked list structure, supporting sequential, parallel, and nested orchestration patterns
- **Reusable Component System**: Built-in component types including LLM invocation, API requests, conditionals, loops, and database operations. Workflow nodes can reference either AtomFlows or Components for flexible reuse
- **Workflow Execution Engine**: ProcessService managing flow lifecycle, MongoDB storing runtime execution state, Redis supporting breakpoint resumption, RabbitMQ handling async tasks
- **Visual Canvas Editor**: React-based drag-and-drop canvas with node dragging, edge connections, real-time preview, and auto-layout
- **Multi-Tenant Permission System**: Built on GraphQL + Prisma, Channel workspace isolation, RBAC access control (Owner / Admin / Editor / Viewer), category-level fine-grained permissions
- **AI Smart Matching**: Combined vector search and tag matching — natural language input auto-matches the most relevant workflows; AI-assisted conditional node decisions for dynamic branch selection
- **Enterprise Features**: Version control and rollback, soft delete, batch operations, import/export, audit trails

**Tech Stack**: TypeScript, GraphQL (TypeGraphQL), Prisma ORM, React, Redis, MySQL, MongoDB, RabbitMQ

**Results**:
- Successfully served multiple banking and e-commerce clients, with continued iteration and client renewals post-launch
- Business users can build workflows through visual orchestration, significantly reducing dependency on developers

---

### Project 4: Logistics SaaS Platform (esendeo)

<sub>Jul 2020 - Jul 2022 &emsp;|&emsp; Full-Stack Developer</sub>

**Background**: esendeo is a French B2B SaaS logistics solution platform for online e-commerce sites and offline merchants. Clients can place orders, print shipping labels, manage parcels, and handle after-sales on the platform. Supports Web, API, and e-commerce platform plugins.

**Technical Approach**:

- **SQL Performance Optimization**: Decomposed TypeORM's O(n²) save method into separate update/insert operations, significantly reducing execution time
- **Billing Reconciliation Refactoring**: Restructured reconciliation logic, migrated invoice PDF rendering to AWS Lambda Serverless async processing, significantly improving speed and reducing server load
- **Pricing Table Refactoring**: Table splitting design (pricing unit table 1:n pricing range table), direct association between parcel and pricing range tables, Redis caching for active billing periods, resolving pricing inconsistencies
- **Batch Ordering System**: Frontend polling + Redis-cached progress + async batch processing for high-concurrency scenarios
- **esendeo-shopify Plugin (Built from Scratch)**: Next.js + Koa, integrating Shopify/Prestashop e-commerce platform APIs for order sync, logistics ordering, pickup point selection

**Tech Stack**: Vue (Vuetify), React (Next.js), Node.js (NestJS, Koa), TypeScript, PostgreSQL, Redis, TypeORM, AWS Lambda, Puppeteer, Playwright

**Results**:
- SQL and billing refactoring significantly improved batch data processing, reconciliation shifted from synchronous blocking to async rendering
- Independently built and shipped the esendeo-shopify plugin from scratch

---

## Technical Skills

| Domain | Skills |
|--------|--------|
| **AI / LLM** | LangChain (Contributor), LangGraph, LangSmith, Claude API, OpenAI API, AWS Bedrock, MCP Protocol |
| **Backend** | TypeScript, Python, Node.js, FastAPI, Hono, GraphQL (TypeGraphQL), NestJS, Koa |
| **Frontend** | React, Vue, Next.js |
| **Architecture** | Microservices, Plugin Architecture, Low-Code Platforms, Distributed Systems (etcd, Redis, RabbitMQ) |
| **Database** | PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch, Prisma ORM, TypeORM |
| **DevOps** | Docker, Kubernetes, GitLab CI, AWS Lambda |
| **Blockchain** | Cosmos SDK (Contributor), Go |

---

## Education & Certification

| | |
|---|---|
| **University** | Zhejiang University City College |
| **Major** | Software Engineering |
| **Degree** | Bachelor's (2015 - 2019) |
| **Certification** | Intermediate Software Designer |

---

## Self-Assessment

- **Technology-Driven**: Passionate about exploring cutting-edge AI technologies, LangChain/LangGraph open-source contributor, actively following community developments and shipping real-world applications
- **Architectural Thinking**: End-to-end architecture capabilities from business requirements to technical solutions, skilled in designing scalable and maintainable systems, with hands-on experience building frameworks from scratch
- **Team Collaboration**: 5-person technical team management experience, proficient in technical solution design and code reviews, driving team growth
- **Product Awareness**: Focused on business value of technology, balancing technical ideals with delivery efficiency, experienced in direct communication with banking and e-commerce B2B clients
- **International Perspective**: Background in a French multinational company, familiar with international B2B SaaS product development workflows and collaboration patterns
