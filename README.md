# Pic-Hub 艺术图像存储检索平台

Pic-Hub 是一个用于存储和检索艺术图像的平台，支持用户通过创作地区、内容主题和视觉特征进行图片检索，并提供用户登录、图片库管理等功能。

## 环境准备

- Java 17+
- MySQL 8.0+
- Redis 
- MinIO
- Nacos 

## 安装指南

### 1. 安装 Nacos
[Nacos 官网](https://nacos.io/zh-cn/)  

### 2. 安装 Redis
[Redis 官网](https://redis.io/)  

### 3. 下载 Sentinel 控制台
Sentinel 提供了一个独立的控制台模块，用于管理和监控规则。您可以从 Sentinel 的官方 GitHub 仓库下载最新版本的控制台代码：
[Sentinel 官网](https://github.com/alibaba/Sentinel/releases/tag/1.8.6)

### 4. 安装 MinIO
[MinIO 官网](https://min.io/)  
下载安装 MinIO 并创建名为 "pics" 的存储桶

# 安装后访问Web控制台(默认端口9001)
# 创建名为 "pics" 的存储桶
```

### 5. 数据库初始化
执行 sql 文件夹中的脚本初始化数据库结构:
```bash
mysql -u root -p < /sql/pichub-login.sql
mysql -u root -p < /sql/pichub-pic.sql
mysql -u root -p < /sql/pichub-user-insert.sql
```

### 6. Nacos 配置
1. 访问 Nacos 控制台 (默认: http://localhost:8848/nacos)
2. 根据 nacos-config 文件夹中的文件创建配置
3. 修改数据库连接配置(用户名、密码、端口等)

### 7. 修改项目配置
更新以下配置文件中的环境设置:
- 各微服务中的 `application.yml`或`application.properties`
- 网关配置文件
- 修改数据库连接、Redis地址、MinIO端点等

### 8. 启动项目
按顺序启动服务:
1. Nacos
2. Redis 和 Sentinel
3. MinIO
4. 数据库
5. 微服务和网关

## 项目结构
- `common-jwt`: JWT配置
- `gateway/`: API网关服务
- `model/`: 类定义
- `services/`: 微服务模块
- `sql/`: 数据库初始化脚本
- `nacos-config/`: Nacos配置文件

## 常见问题排查
如遇问题请检查:
1. 确认所有服务已正常运行(Nacos、Redis、MinIO、MySQL)
2. 查看各服务日志
3. 确认配置文件中连接信息正确
4. 确保端口无冲突

如需更多帮助，请在项目仓库提交issue。
