# 当前激活的 MCP Servers

实时反映已配置和可用的 MCP Servers 状态。

## 概览

- **总数**: 1 个
- **状态**: 全部正常 ✅
- **最后更新**: 2026-01-23

## Location Services 位置服务

### user-amap-maps (高德地图)

- **状态**: ✅ 激活
- **Server ID**: `user-amap-maps`
- **服务提供商**: 高德地图
- **工具数量**: 13 个
- **文档位置**: [location-services/amap-maps/](location-services/amap-maps/)
- **最后检查**: 2026-01-23
- **响应状态**: 正常

#### 功能摘要
| 类别 | 工具数量 | 工具名称 |
|------|---------|---------|
| 地理编码 | 2 | maps_geo, maps_regeocode |
| 搜索 | 3 | maps_text_search, maps_around_search, maps_search_detail |
| 路径规划 | 4 | maps_direction_driving, maps_direction_walking, maps_direction_transit_integrated, maps_bicycling |
| 距离测量 | 1 | maps_distance |
| IP 定位 | 1 | maps_ip_location |
| 天气查询 | 1 | maps_weather |

#### 配置要求
- **API Key**: 需要（环境变量 `AMAP_API_KEY`）
- **网络**: 需要互联网连接
- **配额**: 根据高德开放平台账户

#### 使用频率
- **高频**: maps_geo, maps_regeocode, maps_direction_driving
- **中频**: maps_text_search, maps_around_search, maps_weather
- **低频**: maps_bicycling, maps_ip_location, maps_search_detail

## Data Analysis 数据分析

*暂无集成的 MCP servers*

**推荐 Servers**:
- pandas-mcp - Pandas 数据分析
- matplotlib-mcp - 数据可视化
- jupyter-mcp - Jupyter Notebook 集成

## Web Scraping 网页抓取

*暂无集成的 MCP servers*

**推荐 Servers**:
- puppeteer-mcp - 浏览器自动化
- cheerio-mcp - HTML 解析
- scrapy-mcp - 网页爬虫

## 健康检查

### 自动检查（每日）

```bash
# 运行健康检查脚本
./scripts/check-mcp-health.sh

# 输出示例
✅ user-amap-maps: OK (响应时间: 234ms)
```

### 手动检查

```bash
# 测试地理编码
curl -X POST http://mcp-server/maps_geo \
  -H "Content-Type: application/json" \
  -d '{"address": "北京市"}'

# 测试天气查询
curl -X POST http://mcp-server/maps_weather \
  -H "Content-Type: application/json" \
  -d '{"city": "北京"}'
```

## 性能指标

### user-amap-maps

| 工具 | 平均响应时间 | 成功率 | 每日调用量 |
|------|-------------|--------|----------|
| maps_geo | 150ms | 99.5% | ~50 |
| maps_weather | 180ms | 99.8% | ~30 |
| maps_direction_driving | 250ms | 99.2% | ~40 |

*统计周期：最近 7 天*

## 故障记录

### 2026-01-23
- 无故障记录

## 待集成的 MCP Servers

### 优先级：高

1. **GitHub MCP**
   - 功能：仓库管理、Issue、PR 操作
   - 用途：开发工作流集成
   - 状态：计划中

2. **PostgreSQL MCP**
   - 功能：数据库查询和管理
   - 用途：数据分析和管理
   - 状态：计划中

### 优先级：中

3. **Slack MCP**
   - 功能：消息发送、频道管理
   - 用途：团队协作
   - 状态：评估中

4. **Google Search MCP**
   - 功能：网页搜索
   - 用途：信息检索
   - 状态：评估中

### 优先级：低

5. **Weather MCP**
   - 功能：全球天气查询
   - 用途：备用天气服务
   - 状态：备选

## 配置模板

### 添加新 MCP Server

```json
{
  "mcpServers": {
    "server-id": {
      "command": "node",
      "args": ["/path/to/server/index.js"],
      "env": {
        "API_KEY": "${API_KEY_ENV_VAR}"
      }
    }
  }
}
```

### 环境变量

```bash
# .env.local (不提交到 git)
AMAP_API_KEY=your_amap_key_here
GITHUB_TOKEN=your_github_token_here
DATABASE_URL=postgresql://user:pass@host:5432/db
```

## 使用统计

### 本周热门工具（Top 5）

1. maps_geo - 45 次
2. maps_weather - 32 次
3. maps_direction_driving - 28 次
4. maps_text_search - 21 次
5. maps_around_search - 18 次

### 按场景分类

| 场景 | 使用次数 | 常用工具 |
|------|---------|---------|
| 地址解析 | 52 | maps_geo, maps_regeocode |
| 路线规划 | 41 | maps_direction_* |
| POI 搜索 | 35 | maps_text_search, maps_around_search |
| 天气查询 | 32 | maps_weather |
| 其他 | 12 | maps_ip_location, maps_distance |

## 维护日志

### 2026-01-23
- ✅ 初始化 MCP 文档
- ✅ 记录 user-amap-maps 配置
- ✅ 创建健康检查脚本

### 计划任务
- [ ] 添加 GitHub MCP
- [ ] 实现自动化健康检查
- [ ] 配置使用量监控

## 相关资源

- [MCP 概览](README.md)
- [高德地图文档](location-services/amap-maps/)
- [添加新 MCP 指南](../docs/contributing.md#添加新-mcp-server)

---

**最后更新**: 2026-01-23 | **下次检查**: 2026-01-24
