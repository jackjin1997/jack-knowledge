# 高德地图 MCP (amap-maps)

高德地图 API 服务集成，提供地理编码、搜索、路径规划等 13 个强大工具。

## 概述

**Server ID**: `user-amap-maps`
**服务提供商**: 高德地图 (AutoNavi)
**工具数量**: 13 个
**API 文档**: https://lbs.amap.com/api

## 功能总览

### 🗺️ 地理编码 (2 个工具)
- **maps_geo** - 地址 → 坐标
- **maps_regeocode** - 坐标 → 地址

### 🔍 搜索 (3 个工具)
- **maps_text_search** - 关键词搜索 POI
- **maps_around_search** - 周边搜索
- **maps_search_detail** - POI 详情查询

### 🚗 路径规划 (4 个工具)
- **maps_direction_driving** - 驾车路径
- **maps_direction_walking** - 步行路径
- **maps_direction_transit_integrated** - 公交路径
- **maps_bicycling** - 骑行路径

### 📏 其他功能 (3 个工具)
- **maps_distance** - 距离测量
- **maps_ip_location** - IP 定位
- **maps_weather** - 天气查询

## 快速开始

### 在 Cursor 中使用

```
"使用高德地图把'北京市朝阳区'转换为坐标"
→ 使用 maps_geo

"搜索附近 2 公里内的加油站"
→ 使用 maps_around_search

"规划从北京到上海的驾车路线"
→ 使用 maps_direction_driving

"查询北京今天的天气"
→ 使用 maps_weather
```

## 工具详解

### 1. 地理编码 (maps_geo)

**将地址转换为经纬度坐标**

#### 参数
- `address` (必需): 结构化地址信息
- `city` (可选): 城市名称，提高精确度

#### 使用场景
- 将用户输入的地址转换为坐标
- 地图标记点定位
- 地址验证

#### 示例

```
在 Cursor 中：
"把'北京市海淀区中关村大街1号'转换为坐标"
```

**返回数据**：
```json
{
  "formatted_address": "北京市海淀区中关村大街1号",
  "location": "116.310003,39.992467",
  "level": "门牌号"
}
```

#### 注意事项
- 地址越详细，结果越精确
- 可以识别地标、建筑物名称
- 建议指定城市参数

---

### 2. 逆地理编码 (maps_regeocode)

**将坐标转换为地址信息**

#### 参数
- `location` (必需): 经纬度坐标，格式："经度,纬度"

#### 使用场景
- GPS 定位后获取地址
- 地图点击获取位置信息
- 位置数据分析

#### 示例

```
在 Cursor 中：
"查询坐标 116.310003,39.992467 的地址"
```

**返回数据**：
```json
{
  "formatted_address": "北京市海淀区中关村大街1号",
  "province": "北京市",
  "city": "北京市",
  "district": "海淀区",
  "township": "燕园街道",
  "street": "中关村大街",
  "streetnum": "1号"
}
```

---

### 3. 关键词搜索 (maps_text_search)

**根据关键词搜索相关 POI**

#### 参数
- `keywords` (必需): 搜索关键词
- `city` (可选): 限定城市
- `types` (可选): POI 类型，如 "加油站|充电站"

#### 使用场景
- 搜索附近的餐厅、商店
- 查找特定类型的地点
- 地点推荐

#### 示例

```
在 Cursor 中：
"在北京搜索星巴克"
"搜索加油站"
```

**返回数据**：
```json
{
  "pois": [
    {
      "id": "B000A7BD6C",
      "name": "星巴克(国贸店)",
      "type": "餐饮服务;咖啡厅;星巴克",
      "location": "116.462715,39.910034",
      "address": "建国门外大街1号国贸商城北区",
      "tel": "010-65051527"
    }
  ]
}
```

---

### 4. 周边搜索 (maps_around_search)

**搜索指定坐标周边的 POI**

#### 参数
- `location` (必需): 中心点坐标 "经度,纬度"
- `keywords` (可选): 搜索关键词
- `radius` (可选): 搜索半径（米），默认 1000

#### 使用场景
- 搜索当前位置附近的服务
- 查找最近的便利店、ATM
- 周边设施分析

#### 示例

```
在 Cursor 中：
"搜索坐标 116.310003,39.992467 附近 500 米内的餐厅"
```

**返回数据**：
```json
{
  "pois": [
    {
      "name": "麦当劳",
      "location": "116.311234,39.993456",
      "distance": "234", // 距离中心点的米数
      "address": "中关村大街15号"
    }
  ]
}
```

---

### 5. POI 详情查询 (maps_search_detail)

**查询 POI ID 的详细信息**

#### 参数
- `id` (必需): POI 的唯一标识符

#### 使用场景
- 获取搜索结果的完整信息
- 显示地点详情页
- 数据补充

#### 示例

```
在 Cursor 中：
"查询 POI ID B000A7BD6C 的详细信息"
```

**返回数据**：
```json
{
  "id": "B000A7BD6C",
  "name": "星巴克(国贸店)",
  "type": "餐饮服务;咖啡厅;星巴克",
  "location": "116.462715,39.910034",
  "address": "建国门外大街1号国贸商城北区",
  "tel": "010-65051527",
  "business_time": "周一至周日 07:00-22:00",
  "photos": [...]
}
```

---

### 6. 驾车路径规划 (maps_direction_driving)

**规划小客车/轿车通勤方案**

#### 参数
- `origin` (必需): 起点坐标 "经度,纬度"
- `destination` (必需): 终点坐标 "经度,纬度"

#### 使用场景
- 导航路线规划
- 行程时间估算
- 多路线对比

#### 示例

```
在 Cursor 中：
"规划从北京(116.310003,39.992467)到上海(121.473662,31.230372)的驾车路线"
```

**返回数据**：
```json
{
  "route": {
    "distance": "1213456", // 米
    "duration": "43200", // 秒
    "paths": [
      {
        "distance": "1213456",
        "duration": "43200",
        "steps": [
          {
            "instruction": "沿中关村大街向南行驶230米",
            "distance": "230",
            "duration": "45"
          }
        ]
      }
    ]
  }
}
```

---

### 7. 步行路径规划 (maps_direction_walking)

**规划 100km 以内的步行方案**

#### 参数
- `origin` (必需): 起点坐标 "经度,纬度"
- `destination` (必需): 终点坐标 "经度,纬度"

#### 使用场景
- 短距离导航
- 最后一公里配送
- 步行时间估算

#### 示例

```
在 Cursor 中：
"规划从公司到地铁站的步行路线"
```

---

### 8. 公交路径规划 (maps_direction_transit_integrated)

**规划综合公共交通方案（火车、公交、地铁）**

#### 参数
- `origin` (必需): 起点坐标 "经度,纬度"
- `destination` (必需): 终点坐标 "经度,纬度"
- `city` (必需): 起点城市
- `cityd` (必需): 终点城市

#### 使用场景
- 城市内公交出行
- 跨城市出行规划
- 公共交通推荐

#### 示例

```
在 Cursor 中：
"规划从北京到上海的公交路线（包含高铁）"
```

**返回数据**：
```json
{
  "transits": [
    {
      "cost": "553.00",
      "duration": "21600", // 秒
      "segments": [
        {
          "transit": {
            "vehicle_type": "RAILWAY",
            "name": "G1次",
            "departure_stop": "北京南站",
            "arrival_stop": "上海虹桥站"
          }
        }
      ]
    }
  ]
}
```

---

### 9. 骑行路径规划 (maps_bicycling)

**规划骑行方案，考虑天桥、单行线等**

#### 参数
- `origin` (必需): 起点坐标 "经度,纬度"
- `destination` (必需): 终点坐标 "经度,纬度"

#### 使用场景
- 共享单车导航
- 骑行健身路线
- 环保出行规划

#### 示例

```
在 Cursor 中：
"规划骑行路线从家到公司"
```

---

### 10. 距离测量 (maps_distance)

**测量两个或多个坐标之间的距离**

#### 参数
- `origins` (必需): 起点坐标，多个用 "|" 分隔
- `destination` (必需): 终点坐标
- `type` (可选): 
  - 1 = 驾车距离（考虑道路）
  - 0 = 直线距离
  - 3 = 步行距离

#### 使用场景
- 距离计算
- 运费估算
- 服务范围判断

#### 示例

```
在 Cursor 中：
"计算从北京到上海的驾车距离"
```

**返回数据**：
```json
{
  "results": [
    {
      "origin": "116.310003,39.992467",
      "destination": "121.473662,31.230372",
      "distance": "1213456", // 米
      "duration": "43200" // 秒（如果是驾车/步行）
    }
  ]
}
```

---

### 11. IP 定位 (maps_ip_location)

**根据 IP 地址定位位置**

#### 参数
- `ip` (必需): IP 地址

#### 使用场景
- 访客位置分析
- 内容地域化
- 防欺诈检测

#### 示例

```
在 Cursor 中：
"查询 IP 地址 223.5.5.5 的位置"
```

**返回数据**：
```json
{
  "province": "北京市",
  "city": "北京市",
  "adcode": "110000",
  "rectangle": "116.0119343,39.66127144;116.7829835,40.2164962"
}
```

---

### 12. 天气查询 (maps_weather)

**查询城市天气信息**

#### 参数
- `city` (必需): 城市名称或城市编码

#### 使用场景
- 天气预报显示
- 出行建议
- 活动规划

#### 示例

```
在 Cursor 中：
"查询北京今天的天气"
"上海的天气怎么样"
```

**返回数据**：
```json
{
  "city": "北京市",
  "weather": "晴",
  "temperature": "15",
  "winddirection": "东北",
  "windpower": "≤3",
  "humidity": "45",
  "reporttime": "2026-01-23 14:00:00"
}
```

---

## 使用场景集合

### 场景 1：外卖配送应用

```
流程：
1. 用户输入地址 → maps_geo (转坐标)
2. 搜索附近商家 → maps_around_search
3. 选择商家后规划路线 → maps_direction_driving
4. 计算配送距离 → maps_distance
5. 显示预计时间 → 使用 direction 返回的 duration
```

### 场景 2：旅行规划助手

```
流程：
1. 查询目的地天气 → maps_weather
2. 搜索景点 → maps_text_search
3. 规划路线 → maps_direction_walking / maps_direction_transit_integrated
4. 查找附近餐厅 → maps_around_search
5. 获取 POI 详情 → maps_search_detail
```

### 场景 3：用户数据分析

```
流程：
1. 收集用户 IP → maps_ip_location (获取城市)
2. 用户提供地址 → maps_geo (获取精确坐标)
3. 计算用户分布 → maps_regeocode (批量坐标转地址)
4. 分析服务覆盖 → maps_distance (计算到服务点距离)
```

### 场景 4：智能推荐系统

```
流程：
1. 获取用户位置 → maps_regeocode
2. 搜索周边 POI → maps_around_search
3. 获取详情 → maps_search_detail
4. 计算距离排序 → maps_distance
5. 提供路线 → maps_direction_walking
```

## 配置说明

### API Key 获取

1. 访问 [高德开放平台](https://lbs.amap.com/)
2. 注册/登录账号
3. 进入"控制台" → "应用管理"
4. 创建新应用
5. 添加 Key（选择"Web服务"类型）
6. 获取 Key

### 环境变量配置

```bash
# .env.local (不要提交到 git)
AMAP_API_KEY=your_key_here
```

### 使用限额

**免费额度**（个人开发者）：
- 每日调用量：10,000 次
- QPS：并发量限制

**付费方案**：
- 根据调用量阶梯计费
- 详见：https://lbs.amap.com/api/pricing

## 最佳实践

### 1. 缓存策略

```
频繁查询的数据建议缓存：
- 天气信息：缓存 1-2 小时
- POI 详情：缓存 24 小时
- 地理编码：缓存 7 天（地址变化不频繁）
```

### 2. 批量操作

```
使用批量接口减少 API 调用：
- maps_distance 支持多个起点到一个终点
- 一次性获取多个 POI 详情
```

### 3. 错误处理

```
在 Cursor 中：
"查询天气，如果失败则返回默认值"
"搜索 POI，如果结果为空则扩大搜索范围"
```

### 4. 参数优化

```
- 地理编码：尽量提供城市参数提高精度
- 周边搜索：根据场景合理设置半径
- 路径规划：选择合适的出行方式
```

## 限制和注意事项

### API 限制
- 免费版每日 10,000 次调用
- QPS（每秒查询数）限制
- 部分功能需要特定套餐

### 数据准确性
- 地图数据定期更新，可能存在延迟
- 实时路况信息可能不够准确
- 跨境路线规划支持有限

### 隐私保护
- 不要存储用户的精确位置
- 遵守数据使用协议
- 用户数据加密传输

## 故障排查

### API 调用失败

```
问题：返回错误码
排查：
1. 检查 API Key 是否正确
2. 验证参数格式
3. 确认 API 配额未超限
4. 查看错误码文档
```

### 结果不准确

```
问题：地址解析不准确
解决：
1. 提供更详细的地址信息
2. 指定城市参数
3. 使用地标或建筑物名称
```

### 响应超时

```
问题：API 响应慢
解决：
1. 减少返回数据量
2. 使用批量接口
3. 实现缓存机制
4. 设置合理的超时时间
```

## 相关资源

- [高德开放平台](https://lbs.amap.com/)
- [API 文档](https://lbs.amap.com/api/webservice/summary)
- [错误码说明](https://lbs.amap.com/api/webservice/guide/tools/info)
- [MCP 总览](../../README.md)
- [活跃 Servers](../../active-servers.md)

---

**开始使用**: 在 Cursor 中直接描述需求，AI 会自动选择合适的工具！
