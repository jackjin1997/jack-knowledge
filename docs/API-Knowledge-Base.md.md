# 🌐 现代 Web API 核心知识体系 (2026版)

> **摘要**：本文档梳理了从架构风格到具体工具链的层级关系，帮助理清 RESTful、RPC、OpenAPI、Swagger 等概念的边界与联系。

---

## 1. 宏观层级划分：盖房子的比喻

| 层级 | 概念类别 | 对应内容 | 形象比喻 |
| :--- | :--- | :--- | :--- |
| **第一层：哲学** | **架构风格** | RESTful, RPC, GraphQL | 房子的设计流派（中式 vs 西式） |
| **第二层：契约** | **描述规范** | OpenAPI, Protobuf, Zod | 房子的施工图纸标准（符号定义） |
| **第三层：装修** | **工具链** | Swagger UI, Postman, gRPC | 具体的装修工具与样板间展示 |

---

## 2. 架构风格对比 (Architecture Styles)

### 🟢 RESTful (Representational State Transfer)
*   **核心**：**资源 (Resources)**。
*   **交互方式**：使用 HTTP 标准动词（GET, POST, PUT, DELETE）操作 URL。
*   **场景**：Web 公网 API、第三方对接、前后端分离。
*   **口诀**：看重“东西”，语义化强。

### 🔵 RPC (Remote Procedure Call)
*   **核心**：**动作 (Actions)**。
*   **交互方式**：像调用本地函数一样调用远程接口（如 `getUser(id)`）。
*   **代表**：gRPC (Google), tRPC (TypeScript), JSON-RPC。
*   **场景**：内部微服务通信、高性能要求。
*   **口诀**：看重“方法”，执行效率高。

---

## 3. 标准与工具：OpenAPI vs Swagger

> **结论**：OpenAPI 是**协议标准**，Swagger 是**实现工具**。

*   **OpenAPI (Spec)**：一份 JSON/YAML 格式的文档规范，规定了如何描述接口的路径、参数、返回结构。
*   **Swagger (Tools)**：
    *   **Swagger UI**：将 OpenAPI 文件渲染成可交互网页的工具（绿白界面）。
    *   **Swagger Editor**：编写规范的编辑器。

---

## 4. 现代 API 知识图谱

### 📝 描述规范 (Contract)
*   **OpenAPI**：RESTful 的事实标准。
*   **Protobuf**：gRPC 的二进制契约。
*   **Zod**：TypeScript 生态中“运行时校验+类型推断”的利器（本项目核心）。

### 🚀 进阶技术
*   **GraphQL**：由前端决定返回哪些字段，解决数据冗余问题。
*   **EJSON**：扩展 JSON，支持 Date、RegExp 等原生 JSON 不支持的类型。

---

## 5. 综合总结 (一句话串联)

> “我用 **TypeScript** 开发，底层走 **RESTful** (Hono)，上层写起来像 **RPC** (装饰器)，数据契约靠 **Zod**。为了生成文档，我会把 Zod 转换成 **OpenAPI** 规范，最后用 **Swagger UI** 呈现给前端。”

---

## 💡 费曼笔记：我的理解
*(此处留白，建议填入你自己的感悟)*
- *例如：OpenAPI 就是 API 的说明书标准，Swagger 是读说明书的阅读器。*

---

**保存建议**：
1.  在项目根目录创建 `docs/knowledge/` 文件夹。
2.  将上述内容保存为 `api-landscape.md`。
3.  以后遇到新的概念（如 Webhook, WebSocket），继续往里补充。