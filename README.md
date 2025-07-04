# 🎯 Stage 抽奖系统

一个基于前后端分离的高并发抽奖系统，支持多用户并发参与抽奖活动，结合了 Redis 缓存、RabbitMQ 异步队列、分库分表的 MySQL 架构，以提升性能和系统可扩展性。

## 🛠 技术栈

- **前端**：Vue3 + Element Plus
- **后端**：Spring Boot 2.7.12 + ShardingSphere 5.2.1 + MyBatis
- **数据库**：MySQL 8.0（分库分表）
- **缓存中间件**：Redis（用于库存缓存、用户状态）
- **消息队列**：RabbitMQ（用于库存异步扣减、发奖处理）
- **容器化部署**：Docker + Docker Compose

## 📁 项目结构

```bash
├── backend/               # 后端 Spring Boot 项目
├── front/                 # 前端 Vue 项目
├── docker-compose.yml     # 一键部署容器配置
├── mysql/
│   ├── market.sql         # 主库初始化SQL
│   ├── market_01.sql      # 分库1初始化SQL
│   └── market_02.sql      # 分库2初始化SQL
└── README.md              # 项目说明文档
