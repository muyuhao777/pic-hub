# Pic-Hub 艺术图像存储检索平台

Pic-Hub 是一个用于存储和检索艺术图像的平台，支持用户通过创作地区、内容主题和视觉特征进行图片检索，并提供用户登录、图片库管理等功能。

## 环境准备

- Java 17+
- MySQL 8.0+
- Redis 7.0+
- MinIO
- Nacos 2.0+

## 安装指南

### 1. 安装 Nacos
[Nacos 官网](https://nacos.io/zh-cn/)  
下载并安装 Nacos 服务器(推荐2.0.0及以上版本):
```bash
# Linux/Mac 示例
wget https://github.com/alibaba/nacos/releases/download/2.0.3/nacos-server-2.0.3.tar.gz
tar -zxvf nacos-server-2.0.3.tar.gz
cd nacos/bin
sh startup.sh -m standalone
```

### 2. 安装 Redis
[Redis 官网](https://redis.io/)  
安装 Redis (推荐7.0及以上版本):
```bash
# Ubuntu/Debian 系统
sudo apt update
sudo apt install redis-server
sudo systemctl enable redis-server
sudo systemctl start redis-server
```

### 3. 配置 Redis Sentinel
Redis Sentinel 已包含在 Redis 安装包中，通过编辑配置文件进行配置:
```bash
sudo nano /etc/redis/sentinel.conf
```
至少配置以下参数:
```
port 26379
sentinel monitor mymaster 127.0.0.1 6379 2
sentinel down-after-milliseconds mymaster 5000
sentinel failover-timeout mymaster 60000
```

### 4. 安装 MinIO
[MinIO 官网](https://min.io/)  
下载安装 MinIO 并创建名为 "pics" 的存储桶:
```bash
wget https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x minio
./minio server /data --console-address ":9001"

# 安装后访问Web控制台(默认端口9001)
# 创建名为 "pics" 的存储桶
```

### 5. 数据库初始化
执行 sql 文件夹中的脚本初始化数据库结构:
```bash
mysql -u root -p < /path/to/sql/init.sql
```

### 6. Nacos 配置
1. 访问 Nacos 控制台 (默认: http://localhost:8848/nacos)
2. 根据 nacos-config 文件夹中的文件创建配置
3. 修改数据库连接配置(用户名、密码、端口等)

### 7. 修改项目配置
更新以下配置文件中的环境设置:
- 各微服务中的 `application.yml`
- 网关配置文件
- 修改数据库连接、Redis地址、MinIO端点等

### 8. 启动项目
按顺序启动服务:
1. Nacos
2. Redis 和 Sentinel
3. MinIO
4. 数据库
5. 微服务和网关

```bash
# 启动Spring Boot应用示例
cd gateway && mvn spring-boot:run
cd ../service1 && mvn spring-boot:run
# 其他服务同理
```

## 项目结构
- `gateway/`: API网关服务
- `service1/`, `service2/`: 微服务模块
- `sql/`: 数据库初始化脚本
- `nacos-config/`: Nacos配置文件

## 常见问题排查
如遇问题请检查:
1. 确认所有服务已正常运行(Nacos、Redis、MinIO、MySQL)
2. 查看各服务日志
3. 确认配置文件中连接信息正确
4. 确保端口无冲突

如需更多帮助，请在项目仓库提交issue。
