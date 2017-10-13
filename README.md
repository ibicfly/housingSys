# EasyHousing

## 概况

此项目为实训项目，基于SSM框架开发。实训时间：2017.06.19——2017.07.06

## 开发平台和环境

开发平台eclipse 4.6.3；数据库MySQL 5.5.55；Web服务器tomcat 7.0.78；数据库配置参见config目录下的`bean.xml`文件

## 功能点

- [x] 用户注册、登录
- [x] 个人中心（头像修改、信息修改、评论管理、收藏管理、委托出租、成交记录）
- [x] 管理员（各种信息的管理，入口页面为`/WebContent/jsp/html/SystemUser/homepage.jsp`）
- [x] 楼盘/租房 详情显示
- [x] 楼盘/租房 评论
- [x] 楼盘/租房 收藏
- [x] 楼盘/租房 列表显示（能够分页，对关键字，价格进行查询）
- [x] 发送邮件提醒
- [ ] 找回密码
- [x] 地图找房
- [ ] 用户数据分析
- [ ] 各种信息审核

## 相关目录概述

```
.
|--- WebContent 网页文件所在
|--- backup 数据库备份&简化Dao模板代码的程序
|--- config SSM配置文件
|--- src 程序源代码
```