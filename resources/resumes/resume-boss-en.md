# Resume (Job Platform Version)

---

## 1. Personal Strengths

5 years of full-stack development experience (2020.7-2025.9), 2+ years of AI application architecture experience. Led a 5-person team as Tech Lead to deliver multiple core products from 0 to 1.

**Open Source Contributions**:
• LangChain Contributor - The most popular AI application development framework (126k+ Stars)
• Antigravity Awesome Skills Contributor - AI Agent skills collection (7.8k+ Stars), contributed complete Skill module
• Cosmos SDK Contributor - Well-known blockchain framework (6.9k+ Stars)
• GitHub: jackjin1997

**Core Competencies**:
• LangChain/LangGraph open-source contributor with deep framework understanding, capable of multi-Agent system design and production deployment
• Led enterprise low-code/workflow platform architecture, successfully serving top-tier banking and e-commerce B2B clients
• Designed and implemented plugin-based microservice framework from scratch, supporting multiple core microservices in production
• Experienced with Claude/OpenAI and other major LLM APIs, large-scale AI application production experience with 10k+ daily requests
• International B2B SaaS product development experience with French company background

**Tech Stack**:
• AI: LangChain, LangGraph, LangSmith, Claude API, OpenAI API, MCP Protocol
• Backend: TypeScript, Python, Node.js, FastAPI, Hono, GraphQL, NestJS, Koa
• Frontend: React, Vue, Next.js
• Architecture: Microservices, Plugin Architecture, Low-Code Platform, Distributed Systems
• Database: PostgreSQL, MySQL, Redis, Prisma ORM, TypeORM
• DevOps: Docker, Kubernetes, GitLab CI, AWS Lambda
• Blockchain: Cosmos SDK, Go

---

## 2. Work Experience

### Experience 1: Starblazer Technology Co., Ltd.

**Position**: Backend Developer → Tech Lead
**Duration**: 2022.09 - 2025.09 (3 years)
**Department**: Technology R&D

**Responsibilities**:

1. Technical Team Management
• Led a 5-person R&D team as Tech Lead, responsible for AI product line and microservice infrastructure architecture design and development
• Established technical standards and code review guidelines, driving team technical growth
• Participated in product requirement reviews, responsible for technical solution design and technology selection

2. AI Agent Product Development (2024-2025)
• Led overall technical architecture design for travel domain AI Agent product
• Designed multi-Agent collaboration system based on LangChain/LangGraph, implementing intelligent travel planning assistant
• Designed and implemented plugin-based microservice framework to support rapid backend service iteration

3. Low-Code Platform Development (2022-2024)
• Led architecture design and development of enterprise low-code/workflow orchestration platform
• Served top-tier banking and e-commerce B2B clients, supporting 10k+ daily workflow executions
• Designed workflow engine core model, implemented visual canvas editing and AI smart matching

4. Technical Achievements
• AI Agent system achieved 90%+ user satisfaction
• Microservice framework supports 5+ core services, reduced new service development cycle by 70%
• Low-code platform successfully deployed at multiple banking and e-commerce clients, improved workflow creation efficiency by 60%

---

### Experience 2: FTL Group (French Logistics Company)

**Position**: Full-Stack Developer
**Duration**: 2020.07 - 2022.07 (2 years)
**Department**: Technology R&D

**Responsibilities**:

1. YLab Technical R&D Team (2020.07-2020.10, occasional participation later)
• Member of JS/TS technical R&D team, responsible for internal Node.js technology development
• Developed element-ui-extension: Extended element-ui with unified theme, login page, common components, menu bar management
• Developed ftl/typeorm: Standardized TypeORM usage, interceptor configuration, native bug fixes, JSON field query support
• BI Data Visualization: Data cleaning, large table dimension reduction, index optimization
• Crawler Development: Puppeteer for customer addresses and customs HSCODE; Playwright for customs code verification

2. esendeo-web Logistics Platform Development
• Participated in core feature development for esendeo logistics solution platform, providing logistics solutions for e-commerce websites and merchants
• SQL Optimization: Optimized data insertion efficiency, converted O(n²) save method to split processing, reduced execution time to 10%
• Billing System Refactoring: Async billing + Lambda Serverless async PDF rendering, significantly improved speed and reduced server load
• Pricing Table Refactoring: Split table design (pricing unit table + pricing range table), Redis caching, resolved billing vs ordering price inconsistency
• Batch Ordering: Frontend polling + cache progress storage + async batch ordering, supporting high concurrency
• TypeScript Refactoring: Strong typing, decorators, deep generics application

3. esendeo-shopify Mini Program (0 to 1 Development)
• Built on Next.js server-side rendering, providing logistics ordering capability for Shopify/Prestashop e-commerce platforms
• Customers can place orders and select pickup points directly on e-commerce platform after plugin installation, automatic order and logistics synchronization
• Feature Modules: E-commerce order management, package management, information management, billing management, configuration management, customer service

4. Technical Achievements
• SQL and billing refactoring improved system performance by 10x+
• Independently completed esendeo-shopify mini program 0 to 1 development
• Accumulated complete B2B SaaS product development experience

---

## 3. Project Experience

### Project 1: Travel Planning AI Agent System

**Duration**: 2024.01 - 2025.09
**Role**: Tech Lead / AI Architect
**Team Size**: 5 people
**Company**: Starblazer Technology Co., Ltd.

**Background**:
To improve travel product user experience and conversion rate, we needed to build an intelligent travel assistant capable of understanding user travel needs, providing personalized hotel, flight, restaurant, and attraction recommendations, and automatically generating complete itinerary plans. Traditional rule engines couldn't handle complex and variable user intents, so we chose to implement this based on large language models and multi-Agent architecture.

**Responsibilities**:
• Led overall AI architecture design and technology selection as Tech Lead
• Designed multi-Agent collaboration solution, defined inter-Agent communication protocols and state management mechanisms
• Implemented core Agents (Itinerary, Hotel, Flight, etc.) and LangGraph workflow orchestration
• Responsible for performance optimization, implementing streaming response and memory optimization solutions

**Technical Solution**:

1. Multi-Agent Collaboration Architecture (Supervisor Pattern)
Designed multi-Agent system using Supervisor pattern, with Supervisor as central coordinator dynamically dispatching expert Agents based on user intent:
• Supervisor Agent: Understands user intent, decides which expert Agent to call, aggregates results for user
• Hotel Agent: Hotel search and recommendations, supports filtering by price, location, rating
• Flight Agent: Flight queries and price comparison, supports multi-airline comparison, transfer recommendations
• Restaurant Agent: Restaurant recommendations based on location and user taste preferences
• Attraction Agent: Attraction recommendations, supports sorting by theme, distance, popularity
• Itinerary Agent: Itinerary planning expert, integrates all recommendations into complete itinerary
• Currency Agent: Currency conversion, supports real-time exchange rate queries

2. Three-Phase Itinerary Planning Flow
Designed Overview→Detail→Review three-phase planning flow:
• Overview Phase: Analyze user requirements (destination, days, budget, preferences), create itinerary framework
• Detail Phase: Fill in daily details, select optimal solutions from POI pool and transportation pool, arrange time and routes
• Review Phase: Evaluate generated itinerary quality, user can confirm or request re-planning

3. LangGraph State Management
Implemented complex state management based on LangGraph's StateGraph:
• POI Pool (PoiPool): Stores restaurant, attraction, hotel recommendations from each Agent, supports deduplication and rating sorting
• Transportation Pool (TransportationPool): Stores flight recommendation information, supports multi-option comparison
• Conversation Summary (ConversationSummary): Compresses conversation history, solves long conversation context limitations
• Checkpoint Mechanism: Supports conversation state persistence, user can backtrack to any node for re-planning

4. Hybrid Architecture and Streaming Response
• Frontend Business Layer: Node.js/TypeScript handles business logic, user session management
• AI Inference Layer: Python/FastAPI handles LangChain/LangGraph calls
• Deployment: Dual-container Kubernetes Pod, shared network communication
• Streaming Response: SSE (Server-Sent Events) based streaming output, first byte response <3s

5. Observability and Error Handling
• Integrated LangSmith for full-chain tracing, recording every LLM and Tool call
• Supports custom event dispatching for monitoring and debugging
• Graceful degradation on tool call failures to ensure uninterrupted user experience

**Tech Stack**:
LangChain, LangGraph, LangSmith, Python 3.11, FastAPI, Claude API (claude-haiku-4-5), TypeScript, Node.js, PostgreSQL, Redis, Kubernetes

**Achievements**:
• Itinerary planning accuracy reached 85%+, user satisfaction 90%+
• Supports 6 expert Agent collaboration, covering all travel planning scenarios
• Streaming first byte response time <3s, complete itinerary generation <30s
• System running stably, handling thousands of daily conversation requests

---

### Project 2: Plugin-Based Microservice Framework (imean-service-engine)

**Duration**: 2024.01 - 2025.09
**Role**: Core Developer / Architect
**Team Size**: Independent development + team adoption
**Company**: Starblazer Technology Co., Ltd.

**Background**:
As business grew, we needed to rapidly build multiple microservices (data storage service, user center, scheduling center, etc.). Traditional frameworks like NestJS, while feature-complete, were cumbersome to configure with high learning curves. To improve team development efficiency, we decided to design a lightweight, type-safe, extensible microservice framework from scratch.

**Responsibilities**:
• Independently completed framework core architecture design, including plugin system, lifecycle management, type inference mechanism
• Implemented 6 core plugins covering API definition, routing, caching, scheduled tasks, client generation, graceful shutdown
• Promoted framework adoption within team, wrote technical documentation and usage examples
• Continuous iteration and optimization based on actual usage feedback

**Technical Solution**:

1. Plugin Architecture Design
Factory pattern for creating typed engine instances, all features implemented via plugins:
• Factory Class: Uses unique Symbol as module metadata key, ensuring multi-instance isolation
• Microservice Class: Manages plugin lifecycle, module discovery, handler metadata loading
• Plugin Interface: Defines standard lifecycle hooks (onInit, onModuleLoad, onHandlerLoad, onBeforeStart, onAfterStart, onDestroy)
• Decorator-Driven: Uses decorators to define APIs, clean and intuitive code

2. Onion Priority Model
Plugins automatically sorted by priority, forming onion execution model:
• SYSTEM (50): System-level plugins, e.g., graceful shutdown
• SECURITY (100): Security-related plugins, e.g., rate limiting, authentication
• LOGGING (200): Logging, monitoring plugins
• BUSINESS (300): Business logic plugins (default priority)
• PERFORMANCE (400): Performance optimization plugins, e.g., caching
• ROUTE (1000): Route plugins, must execute last
Plugins build wrapper chain via handler.wrap(), engine automatically applies in reverse priority order

3. Core Plugin Capabilities
• Action Plugin: RPC-style API endpoints, Zod-based parameter/return value validation, AsyncIterator streaming support, idempotency marking, EJSON serialization
• Route Plugin: HTTP route definition, supports RESTful and page routes, three-tier middleware (global/module/route level)
• Cache Plugin: Method-level caching, supports Memory and Redis backends, TTL and custom cache keys
• Schedule Plugin: Distributed scheduled tasks, etcd-based leader election, supports FIXED_RATE and FIXED_DELAY modes
• ClientCode Plugin: Auto-generates typed client code, supports streaming and idempotency
• GracefulShutdown Plugin: Graceful shutdown, request tracking, signal listening, timeout protection

4. Type Safety
• Based on TypeScript strict type system
• Zod runtime type validation, compile-time type inference
• Plugin configuration types auto-aggregated
• Generated client code fully typed

**Tech Stack**:
TypeScript, Hono, Zod, Etcd3, Redis, EJSON, Winston, LRU-Cache

**Achievements**:
• Framework supports 5+ microservices in production (datastore, user-center, service-center, etc.)
• Reduced new service development cycle from 2 weeks to 3 days, 70% efficiency improvement
• Auto client generation reduced 80% manual code writing
• Framework codebase <5000 lines, lightweight and maintainable

---

### Project 3: Enterprise Low-Code/Workflow Orchestration Platform

**Duration**: 2022.09 - 2024.01 (approximately 1.5 years)
**Role**: Tech Lead
**Team Size**: 5 people
**Clients**: Top-tier banking and e-commerce B2B clients
**Company**: Starblazer Technology Co., Ltd.

**Background**:
Enterprise clients (banks, e-commerce) have many repetitive business processes requiring automation, but traditional development cycles are long and costly. We needed to build a low-code platform similar to Dify/N8n, enabling business users to visually orchestrate workflows, lowering the automation barrier. It also needed AI capabilities for smart matching and process planning.

**Responsibilities**:
• Led overall technical architecture design, technology selection and solution review
• Led 5-person team to build platform from 0 to 1
• Designed workflow engine core model, defined workflow DSL
• Implemented multi-tenant permission system to meet B2B client isolation requirements
• Communicated with product and clients on requirements, drove project delivery

**Technical Solution**:

1. Dual-Layer Workflow Model
Designed atomic flow + combined flow dual-layer model, balancing flexibility and complexity:
• Atomic Flow (AtomFlow/Recording): Minimum execution unit, contains step sequence (steps), supports parameterized configuration
• Combined Flow (CombinedFlow): Workflow graph composed of multiple atomic flows connected via nodes
• Node Connection Methods: matrixBelow (vertical/sequential), matrixRight (horizontal/parallel), matrixKey (nested/sub-flow)
• Node Types: Flow node (executes atomic flow), Branch node (conditional), Optional node (skippable)

2. Visual Canvas Editor
React-based drag-and-drop canvas editor:
• Supports node drag-and-drop, edge connection, deletion, copying
• Real-time preview and execution debugging
• Node configuration panel with parameter binding and expressions
• Canvas zoom, pan, auto-layout

3. Workflow Execution Engine
• ProcessService: Process execution core, manages process lifecycle (start/finish/break)
• Runtime Cache: Redis-based execution state storage, supports breakpoint resumption
• Conditional Routing: Supports AI-driven routing, dynamically selects branches based on context
• Parallel Execution: matrixRight supports parallel branch execution for improved efficiency

4. Multi-Tenant Permission System
• Channel Workspace: Implements tenant isolation, each Channel has independent data and permissions
• RBAC Access Control: Owner, Admin, Editor, Viewer
• Channel Types: Official, Private, Public with different visibility
• Category Permission Policy: AllMembers (visible to all), SelectedMembers (visible to selected)

5. AI Smart Matching
• Natural Language Input: User enters requirement description, system auto-matches most relevant workflow
• AI Process Planning: LLM-based requirement analysis, recommends process orchestration solutions
• Smart Routing: AI-assisted conditional node decisions, selects optimal path based on context
• Tag Matching: AI auto-tags workflows, improving search accuracy

6. Enterprise Features
• Version Control: Workflow version management, supports rollback and comparison
• Soft Delete: Data not physically deleted, supports recovery
• Batch Operations: Batch move, delete, copy
• Import/Export: Workflow JSON import/export for migration
• Audit Trail: Records creator, editor, operation timestamps

**Tech Stack**:
TypeScript, GraphQL (TypeGraphQL), Prisma ORM, React, Redis, MySQL, LangGraph (AI module)

**Achievements**:
• Successfully served multiple top-tier banking and e-commerce clients
• Supports 10,000+ daily workflow executions, 99.9% system stability
• Improved workflow creation efficiency by 60%, reduced operational costs by 40%
• High client satisfaction, multiple contract renewals

---

### Project 4: esendeo Logistics SaaS Platform

**Duration**: 2020.07 - 2022.07
**Role**: Full-Stack Developer
**Company**: FTL Group (French Logistics Company)

**Background**:
esendeo is a B2B SaaS product focused on logistics solution design, providing logistics solutions for online e-commerce websites and offline merchants. Customers can fill in package information, print shipping labels, view and manage packages, and handle customer service on the platform. Supports Web, API, and e-commerce platform mini programs for order placement.

**Responsibilities**:
• Participated in esendeo-web core feature development, responsible for performance optimization and system refactoring
• Independently completed esendeo-shopify mini program 0 to 1 development
• Participated in YLab technical R&D team, developed internal frameworks and utility libraries

**Technical Solution**:

1. SQL Performance Optimization
• Problem: TypeORM's save method had O(n²) time complexity, extremely slow for bulk data insertion
• Solution: Split update and insert operations with targeted processing
• Result: Reduced execution time to 10% of original

2. Billing System Refactoring
• Problem: B2B clients reconcile monthly, async billing was slow with high server pressure
• Solution: Streamlined billing logic, async PDF rendering using AWS Lambda Serverless
• Result: Significantly improved speed, notably reduced server load

3. Pricing Table Refactoring
• Problem: No caching caused slow queries, historical pricing data was chaotic, billing vs ordering price inconsistency
• Solution: Split table design (pricing unit table 1:n pricing range table), package table directly linked to pricing range table, Redis caching for current active billing
• Result: Improved query speed, guaranteed data consistency

4. Batch Ordering System
• Users upload package data files for batch ordering
• Frontend polls progress API, Redis caches ordering progress
• Async batch processing supporting high concurrency scenarios

5. esendeo-shopify Mini Program (0 to 1)
• Built on Next.js server-side rendering + Koa backend
• Integrated Shopify/Prestashop e-commerce platform APIs
• Features: Order pull, logistics ordering, pickup point selection, order sync, billing management

6. YLab Framework Development
• element-ui-extension: Unified theme, login page, common components, menu bar management
• ftl/typeorm: Standardized usage, interceptor configuration, native bug fixes, JSON field query support
• Crawler Tools: Puppeteer for customer addresses and customs HSCODE, Playwright for customs code verification

**Tech Stack**:
Vue (Vuetify), React (Next.js), Node.js (NestJS, Koa), TypeScript, PostgreSQL, Redis, TypeORM, AWS Lambda, Puppeteer, Playwright

**Achievements**:
• SQL and billing refactoring improved system performance by 10x+
• Independently completed shopify mini program 0 to 1 development, successfully launched
• Internal frameworks widely adopted by team
• Accumulated complete B2B SaaS product development experience

---

## 4. Skill Tags

**Recommended**:
LangChain, LangGraph, Python, TypeScript, AI Agent, Multi-Agent System, Microservices, GraphQL, NestJS, Open Source Contributor, Go, Cosmos SDK, FastAPI, Low-Code Platform, Vue, React

---

## 5. Job Preferences

**Position**: AI Application Developer / AI Architect / Backend Developer (AI Focus)
**Preferred City**: [Fill in]
**Expected Salary**: [Fill in]
