# MCP 资源库

Model Context Protocol (MCP) 集成，扩展 AI 能力调用外部服务和工具。

## 📋 MCP 总览

当前集成 **1 个 MCP Server**，提供 **13+ 个工具**。

### 已集成的 MCP Servers

- **[高德地图 (amap-maps)](location-services/amap-maps/)** - 13 个地理位置相关工具

### 按服务类型浏览

- **[Location Services 位置服务](#location-services-位置服务)** - 地理编码、搜索、路径规划
- **Data Analysis 数据分析** - 待集成
- **Web Scraping 网页抓取** - 待集成

## Location Services 位置服务

### 高德地图 (amap-maps)

**Server ID**: `user-amap-maps`
**工具数量**: 13 个
**详细文档**: [amap-maps/](location-services/amap-maps/)

**核心功能**：
- 🗺️ 地理编码（地址 ⇄ 坐标）
- 🔍 POI 搜索（关键词、周边）
- 🚗 路径规划（驾车、步行、公交、骑行）
- 📏 距离测量
- 🌐 IP 定位
- ☁️ 天气查询

**快速开始**：
```
在 Cursor 中：
"使用高德地图查询北京到上海的驾车路线"
"搜索附近的加油站"
"查询当前位置的天气"
```

## 🎯 MCP 是什么

**Model Context Protocol (MCP)** 是一种协议，让 AI 能够安全地调用外部工具和服务。

### MCP 的价值

1. **扩展能力**：AI 可以调用真实的 API 和服务
2. **实时数据**：获取最新的信息（天气、地图、新闻等）
3. **执行操作**：不仅是对话，还能实际执行任务
4. **模块化**：每个 MCP Server 独立，易于添加和管理

### MCP vs Skills

| 特性 | MCP | Skills |
|------|-----|--------|
| 本质 | 外部工具/API | 知识和工作流 |
| 运行 | 调用外部服务 | 提供指导信息 |
| 实时性 | 实时数据 | 静态知识 |
| 示例 | 查询天气、搜索地点 | 代码规范、工作流程 |

**选择建议**：
- 需要实时数据或外部服务 → MCP
- 需要工作流指导 → Skills
- 两者互补使用

## 🔧 使用 MCP

### 在 Cursor 中使用

**直接对话**：
```
"使用高德地图查询北京天气"
"搜索附近 3 公里内的餐厅"
"规划从公司到家的最快路线"
```

**引用文档**：
```
@mcp/location-services/amap-maps/
```

### 查看可用工具

```bash
# 查看活跃的 MCP servers
cat mcp/active-servers.md

# 查看特定 server 的工具
ls mcp/location-services/amap-maps/
```

## 📚 MCP 文档结构

每个 MCP Server 包含：

```
server-name/
├── README.md              # 服务概览
├── tools.md              # 所有工具列表
├── [category].md         # 按功能分类的详细文档
└── examples.md           # 使用示例
```

## 🌐 活跃的 MCP Servers

详细列表参见：[active-servers.md](active-servers.md)

### user-amap-maps

- **状态**: ✅ 激活
- **服务**: 高德地图 API
- **工具数**: 13 个
- **文档**: [location-services/amap-maps/](location-services/amap-maps/)
- **最后更新**: 2026-01-23

## 🎯 使用场景

### 场景 1：位置相关应用

```
"我要开发一个外卖配送应用，需要：
1. 地址转坐标
2. 搜索附近商家
3. 规划配送路线
4. 计算配送距离"

→ 使用 amap-maps 的：
- maps_geo (地理编码)
- maps_around_search (周边搜索)
- maps_direction_driving (路线规划)
- maps_distance (距离测量)
```

### 场景 2：出行规划

```
"帮我规划明天去北京的行程：
1. 查询北京天气
2. 从酒店到景点的路线
3. 附近的餐厅推荐"

→ 使用 amap-maps 的：
- maps_weather (天气查询)
- maps_direction_walking (步行路线)
- maps_around_search (餐厅搜索)
```

### 场景 3：数据分析

```
"分析用户访问位置数据：
1. IP 地址定位到城市
2. 查询 POI 详情
3. 计算用户分布"

→ 使用 amap-maps 的：
- maps_ip_location (IP 定位)
- maps_search_detail (POI 详情)
- maps_regeocode (逆地理编码)
```

## 🔐 配置和认证

### API 密钥管理

大多数 MCP servers 需要 API 密钥。**不要将密钥提交到 git！**

```bash
# 使用环境变量
export AMAP_API_KEY=your_key_here

# 或使用 .env 文件（已在 .gitignore 中）
echo "AMAP_API_KEY=your_key_here" > .env.local
```

### 高德地图 API Key

1. 访问 [高德开放平台](https://lbs.amap.com/)
2. 注册并创建应用
3. 获取 API Key
4. 配置到环境变量

## 📖 发现新 MCP Servers

### 官方资源
- [MCP 协议文档](https://modelcontextprotocol.io/)
- [MCP Servers 目录](https://github.com/modelcontextprotocol/servers)

### 社区资源
- GitHub 搜索："mcp server"
- [Awesome MCP](https://github.com/punkpeye/awesome-mcp)

### 推荐 MCP Servers

**数据和搜索**：
- Google Search MCP
- Wikipedia MCP
- News API MCP

**开发工具**：
- GitHub MCP
- Jira MCP
- Linear MCP

**数据库**：
- PostgreSQL MCP
- MongoDB MCP
- Redis MCP

**通信**：
- Slack MCP
- Discord MCP
- Email MCP

## 🚀 添加新 MCP Server

### 1. 安装和配置

按照 MCP Server 的官方文档安装。

### 2. 创建文档

```bash
# 创建目录
mkdir -p mcp/category/server-name/

# 创建文档
touch mcp/category/server-name/README.md
```

### 3. 更新活跃列表

编辑 `mcp/active-servers.md` 添加新 server。

### 4. 测试

在 Cursor 中测试新 MCP 的功能。

详细指南：[../docs/contributing.md](../docs/contributing.md)

## 📊 MCP 统计

- **已集成**: 1 个 server
- **可用工具**: 13+ 个
- **覆盖领域**: 位置服务
- **待扩展**: 数据分析、网页抓取、通信等

## 🔄 维护

### 同步配置

```bash
# 使用同步脚本
./scripts/sync-resources.sh

# 手动检查
cat mcp/active-servers.md
```

### 更新文档

MCP API 变更时，及时更新文档。

### 监控状态

定期检查 MCP servers 的可用性和响应时间。

## 💡 最佳实践

### 1. 安全使用

- ✅ 使用环境变量存储 API 密钥
- ✅ 不将密钥提交到 git
- ✅ 定期轮换密钥
- ❌ 不在代码中硬编码密钥

### 2. 错误处理

```
在 Cursor 中：
"查询天气，如果失败则使用备用数据源"
"搜索 POI，限制结果数量防止超时"
```

### 3. 性能优化

- 缓存频繁查询的结果
- 批量请求减少 API 调用
- 设置合理的超时时间

### 4. 成本控制

- 了解 API 的计费规则
- 设置使用限额
- 监控 API 调用量

## 🆘 故障排查

### MCP Server 不响应

```
问题：调用 MCP 工具无响应
排查：
1. 检查 server 是否运行
2. 验证 API 密钥
3. 检查网络连接
4. 查看错误日志
```

### API 调用失败

```
问题：API 返回错误
排查：
1. 验证参数格式
2. 检查 API 配额
3. 确认 API 版本
4. 查看服务状态
```

### 文档与实际不符

```
问题：文档说明与实际行为不一致
解决：
1. 查看 MCP server 的官方文档
2. 更新本地文档
3. 提交 issue 到 server 仓库
```

## 相关资源

- [高德地图文档](location-services/amap-maps/)
- [MCP 协议文档](https://modelcontextprotocol.io/)
- [活跃 Servers](active-servers.md)
- [贡献指南](../docs/contributing.md)

---

**开始使用**: 在 Cursor 中直接描述需求，AI 会自动调用合适的 MCP 工具！
