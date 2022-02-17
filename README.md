# open-xuehai

学海数据目录解析 & 数据导出。

项目名是为了致敬前人的一些研究，不过这里并不会提供结果的补充。

运行前，请将学海的数据目录 `xuehai` 置于同目录下，这个目录通常位于设备的 `/storage/emulated/0/xuehai`。

### Usage

#### 构建

1. 将 `config.sample.yml` 拷贝为 `config.yml` 并配置
2. 执行 `python build.py`

#### HTTP 服务器

1. 执行 `python server.py`（推荐）
2. 或者使用任意 Simple HTTP Server 工具，以项目目录为根目录启动服务

### Feature

- [x] 响应数据导出
- [x] 云课堂数据导出
- [x] 云作业数据导出
- [ ] 学海题舟数据导出
- [x] 前端