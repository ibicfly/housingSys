-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2017 at 11:30 PM
-- Server version: 5.5.55-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
drop database easyHousing;
CREATE  DATABASE easyHousing character set utf8 ;
use easyHousing;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'easyHousing'
--

-- --------------------------------------------------------

--
-- Table structure for table 'Administrator'
--

CREATE TABLE IF NOT EXISTS Administrator (
  administratorDepartment varchar(64) DEFAULT NULL,
  administratorId int(11) NOT NULL AUTO_INCREMENT,
  administratorName varchar(15) NOT NULL,
  administratorPassword varchar(64) NOT NULL,
  administratorSex varchar(5) DEFAULT NULL,
  PRIMARY KEY (administratorName),
  UNIQUE KEY administratorId (administratorId)
) ;

--
-- Dumping data for table 'Administrator'
--

INSERT INTO Administrator (administratorDepartment,administratorId, administratorName, administratorPassword,administratorSex) VALUES
('测试机关',1,'admin','team632','女');

-- --------------------------------------------------------

--
-- Table structure for table 'Agent'
--

CREATE TABLE IF NOT EXISTS Agent (
  agentId int(11) NOT NULL,
  picUrl varchar(200) DEFAULT NULL,
  agentName varchar(64) DEFAULT NULL,
  agentEmail varchar(64) DEFAULT NULL,
  agentPhoneNumber varchar(64) DEFAULT NULL,
  agentSex varchar(15) DEFAULT NULL,
  PRIMARY KEY (agentId)
) ;

--
-- Dumping data for table 'Agent'
--

INSERT INTO Agent (agentId, picUrl, agentName, agentEmail, agentPhoneNumber, agentSex) VALUES
(1, '1421', 'sbgzy', '1231231@qq.com', '123124214', '男'),
(2132315, 'http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png', '213231231', '455354', '231231423', '男'),
(20141791, 'http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png', '梁先锋', 'lainglsdi@163.com', '18059739987', '男');

-- --------------------------------------------------------

--
-- Table structure for table 'BuildingDeal'
--

CREATE TABLE IF NOT EXISTS BuildingDeal (
  agentId int(11) DEFAULT NULL,
  buildingId int(11) DEFAULT NULL,
  userId int(11) DEFAULT NULL,
  buildingDealPerPrice int(11) DEFAULT NULL,
  buildingDealTotalPrice int(11) DEFAULT NULL,
  buildingDealId int(11) NOT NULL AUTO_INCREMENT,
  buildingDealTime datetime DEFAULT NULL,
  buildingLayout varchar(64) DEFAULT NULL,
  buildingArea int(11) DEFAULT NULL,
  PRIMARY KEY (buildingDealId)
);

--
-- Dumping data for table 'BuildingDeal'
--

INSERT INTO BuildingDeal (agentId, buildingId, userId, buildingDealPerPrice, buildingDealTotalPrice, buildingDealId, buildingDealTime, buildingLayout, buildingArea) VALUES
(20141791, 3, 2, 632, 632632632, 2, '2017-07-02 22:12:10', '1室0厅1厕', NULL);

-- --------------------------------------------------------

--
-- Table structure for table 'BuildingInfo'
--

CREATE TABLE IF NOT EXISTS BuildingInfo (
  buildingAddress varchar(200) NOT NULL,
  buildingId int(11) NOT NULL AUTO_INCREMENT,
  buildingName varchar(200) NOT NULL,
  buildingDecoration varchar(64) DEFAULT NULL,
  buildingMaxArea int(11) DEFAULT NULL,
  buildingMinArea int(11) DEFAULT NULL,
  buildingNeighbourhood varchar(50) DEFAULT NULL,
  buildingReferencePrice int(11) DEFAULT NULL,
  buildingSaleState varchar(50) DEFAULT NULL,
  buildingTimeHanded datetime DEFAULT NULL,
  PRIMARY KEY (buildingId)
)  ;

--
-- Dumping data for table 'BuildingInfo'
--

INSERT INTO BuildingInfo (buildingAddress, buildingId, buildingName, buildingDecoration, buildingMaxArea, buildingMinArea, buildingNeighbourhood, buildingReferencePrice, buildingSaleState, buildingTimeHanded) VALUES
('福州大学', 2, '至诚校区', '精修', 111, 110, 'huxi', 305, '待售', '2017-06-27 00:00:00'),
('福州市沙坪坝区重庆大学虎溪校区松园3栋', 3, '松三', '简修', 20, 100, NULL, 632, '已售', '2011-11-10 00:00:00'),
('金州大道重光立交', 4, '恒大世纪城', '精装', 116, 63, '', 110, '在售', '2019-06-30 00:00:00'),
('照母山植物园旁', 5, '融创凡尔赛花园', '精装', 306, 306, '融创凡尔赛花园', 270, '在售', '2017-06-30 00:00:00'),
('金州大道北侧', 6, '北大资源博雅', '精装', 133, 133, NULL, 266, '在售', '2018-04-30 00:00:00'),
('渝北区空港大道', 7, '桥达蓝湾半岛', '精装', 73, 73, NULL, 61, '在售', '2018-12-30 00:00:00'),
('石桥铺石杨路附近', 8, '金辉优步大道', '精装', 78, 78, NULL, 125, '在售', '2018-12-27 00:00:00'),
('龙腾大道（陈家坪展览中心正对面）', 9, '通用晶城', '精装', 55, 58, NULL, 84, '在售', '2017-07-28 00:00:00'),
('西部新城陶家商圈', 10, '旭城公园府邸', '精装', 78, 78, NULL, 40, '在售', '2017-10-27 00:00:00'),
('北京城建龙樾湾', 11, '松三', '简修', NULL, NULL, NULL, 632, '已售', '2011-11-10 00:00:00'),
('西海岸', 12, '龙腾大道（陈家坪展览中心正对面）', '精装', 46, 88, NULL, 84, '在售', '2017-11-17 00:00:00'),
('九龙坡-石桥铺石杨路附近（原啤酒厂地块，永辉超市对面）', 13, '华宇锦绣花城', '精装', 78, 88, NULL, 130, '在售', '2018-05-11 00:00:00'),
('九龙坡-西部新城陶家商圈（陶家百可广场旁，陶家老街站）', 14, '旭城公园府邸', '精装', 55, 100, NULL, 120, '在售', '2017-07-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table 'BuildingLayout'
--

CREATE TABLE IF NOT EXISTS BuildingLayout (
  buildingId int(11) NOT NULL,
  buildingLayoutPicUrl varchar(200) DEFAULT NULL,
  buildingLayoutReferencePrice int(11) DEFAULT NULL,
  buildingLayout varchar(64) NOT NULL,
  buildingLayoutSoldOut tinyint(1) NOT NULL,
  buildingLayoutPerPrice int(11) NOT NULL,
  PRIMARY KEY (buildingId,buildingLayout)
) ;

-- --------------------------------------------------------

--
-- Table structure for table 'BuildingPic'
--

CREATE TABLE IF NOT EXISTS BuildingPic (
  buildingId int(11) DEFAULT NULL,
  buildingPicInsertTime datetime DEFAULT NULL,
  buildingPicUrl varchar(200)  DEFAULT '',
  buildingPicType varchar(64) DEFAULT NULL,
  picId int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (picId)
)  ;

--
-- Dumping data for table 'BuildingPic'
--

INSERT INTO BuildingPic (buildingId, buildingPicInsertTime, buildingPicUrl, buildingPicType, picId) VALUES
(15, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 97),
(13, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 98),
(13, '2017-07-02 16:33:35', 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 99),
(12, '2017-07-02 17:14:13', 'http://oxnvfyqo7.bkt.clouddn.com/y4.jpg', NULL, 100),
(11, '2017-07-02 17:20:07', 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 101),
(10, '2017-07-03 21:07:12', 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 102),
(9, '2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 103),
(8, '2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/y4.jpg', NULL, 104),
(5, '2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 105),
(4, '2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 106),
(3, '2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 107),
(2, '2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/y4.jpg', NULL, 108),
(1, '2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 109),
(1, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 179),
(2, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 180),
(3, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 181),
(4, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y4.jpg', NULL, 182),
(5, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 183),
(6, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 184),
(7, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 185),
(8, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y4.jpg', NULL, 186),
(9, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 187),
(10, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 188),
(11, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 189),
(12, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y4.jpg', NULL, 190),
(13, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 191),
(14, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 192),
(15, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 193),
(1, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y1.jpg', NULL, 194),
(2, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y2.jpg', NULL, 195),
(3, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y3.jpg', NULL, 196),
(4, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/y4.jpg', NULL, 197),
(1, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png', '卧室', 198),
(1, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png', 'woshi', 199),
(0, NULL, 'http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png', NULL, 200);

-- --------------------------------------------------------

--
-- Table structure for table 'BuyHouseComment'
--

CREATE TABLE IF NOT EXISTS BuyHouseComment (
  buildingId int(11) DEFAULT NULL,
  userId int(11) NOT NULL,
  buyHouseCommentId int(11) NOT NULL AUTO_INCREMENT,
  userComment varchar(300) NOT NULL,
  userCommentDate datetime NOT NULL,
  PRIMARY KEY (buyHouseCommentId)
);

--
-- Dumping data for table 'BuyHouseComment'
--

INSERT INTO BuyHouseComment (buildingId, userId, buyHouseCommentId, userComment, userCommentDate) VALUES
(3, 2, 3, '可惜没有电梯', '2017-07-04 10:22:01'),
(14, 2, 4, '来看看', '2017-07-05 15:28:25'),
(14, 2, 5, '接着看看', '2017-07-05 15:28:45'),
(5, 2, 6, '房子很好', '2017-07-05 19:35:23');

-- --------------------------------------------------------

--
-- Table structure for table 'Characteristics'
--

CREATE TABLE IF NOT EXISTS Characteristics (
  characteristicsId int(11) NOT NULL,
  description varchar(64) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table 'Community'
--

CREATE TABLE IF NOT EXISTS Community (
  communityId int(11) NOT NULL AUTO_INCREMENT,
  communityBuildingNum int(11) DEFAULT NULL,
  communityBuildTime datetime DEFAULT NULL,
  communityDeveloper varchar(100) DEFAULT NULL,
  communityHouseNum int(11) DEFAULT NULL,
  communityPrice float NOT NULL,
  communityPropertyCompany varchar(100) DEFAULT NULL,
  communityPropertyFee float DEFAULT NULL,
  communityName varchar(50) DEFAULT NULL,
  communityAddress varchar(100) DEFAULT NULL,
  PRIMARY KEY (communityId),
  KEY communityId (communityId)
)  ;

--
-- Dumping data for table 'Community'
--

INSERT INTO Community (communityId, communityBuildingNum, communityBuildTime, communityDeveloper, communityHouseNum, communityPrice, communityPropertyCompany, communityPropertyFee, communityName, communityAddress) VALUES
(2, 0, NULL, NULL, 0, 0, NULL, 0, '66666小区', NULL);

-- --------------------------------------------------------

--
-- Table structure for table 'OrderBuilding'
--

CREATE TABLE IF NOT EXISTS OrderBuilding (
  buildingId int(11) NOT NULL,
  userId int(11) NOT NULL,
  orderId int(11) NOT NULL AUTO_INCREMENT,
  orderTime varchar(50) NOT NULL,
  agentId int(11) NOT NULL,
  orderStatus varchar(64) NOT NULL,
  userPhoneNumber varchar(64) NOT NULL,
  PRIMARY KEY (orderId)
) ;

--
-- Dumping data for table 'OrderBuilding'
--

INSERT INTO OrderBuilding (buildingId, userId, orderId, orderTime, agentId, orderStatus, userPhoneNumber) VALUES
(2, 6, 2, '2017-06-26 17:11:39', 1, '未处理', '18059739987');

-- --------------------------------------------------------

--
-- Table structure for table 'OrderRentHouse'
--

CREATE TABLE IF NOT EXISTS OrderRentHouse (
  agentId int(11) DEFAULT NULL,
  orderId int(11) NOT NULL AUTO_INCREMENT,
  orderTime varchar(50) DEFAULT NULL,
  rentHouseId int(11) NOT NULL,
  userId int(11) NOT NULL,
  orderStatus varchar(64) DEFAULT NULL,
  userPhoneNumber varchar(64) NOT NULL,
  PRIMARY KEY (orderId)
);

--
-- Dumping data for table 'OrderRentHouse'
--

INSERT INTO OrderRentHouse (agentId, orderId, orderTime, rentHouseId, userId, orderStatus, userPhoneNumber) VALUES
(20141791, 2, '2017-06-26 17:30:18', 6, 2, '未处理', '18059739987'),
(0, 3, '2017-07-08 00:00:00', 0, 2, NULL, '18059739987'),
(0, 4, '2017-07-08 00:00:00', 5, 2, '未处理', '18059739987');

-- --------------------------------------------------------

--
-- Table structure for table 'RentHouse'
--

CREATE TABLE IF NOT EXISTS RentHouse (
  rentHouseId int(11) NOT NULL AUTO_INCREMENT,
  communityId int(11) DEFAULT NULL,
  rentHouseAddress varchar(100) DEFAULT NULL,
  rentHouseArea float DEFAULT NULL,
  rentHouseBuildTime datetime DEFAULT NULL,
  rentHouseFloor int(11) DEFAULT NULL,
  rentHouseFloorAttribute varchar(64) DEFAULT NULL,
  rentHouseHall int(11) DEFAULT NULL,
  rentHouseRoom int(11) DEFAULT NULL,
  rentHouseSubway varchar(100) DEFAULT NULL,
  rentHouseToilet int(11) DEFAULT NULL,
  rentHouseToward varchar(10) DEFAULT NULL,
  rentHousePrice int(11) DEFAULT NULL,
  rentHouseProvince varchar(64) DEFAULT NULL,
  rentHouseRegion varchar(64) DEFAULT NULL,
  rentHouseAllFloor int(11) DEFAULT NULL,
  communityName varchar(50) DEFAULT NULL,
  rentHouseUnitNumber varchar(64) DEFAULT NULL,
  rentHousePublishTime datetime DEFAULT NULL,
  PRIMARY KEY (rentHouseId)
);

--
-- Dumping data for table 'RentHouse'
--

INSERT INTO RentHouse (rentHouseId, communityId, rentHouseAddress, rentHouseArea, rentHouseBuildTime, rentHouseFloor, rentHouseFloorAttribute, rentHouseHall, rentHouseRoom, rentHouseSubway, rentHouseToilet, rentHouseToward, rentHousePrice, rentHouseProvince, rentHouseRegion, rentHouseAllFloor, communityName, rentHouseUnitNumber, rentHousePublishTime) VALUES
(5, 0, '重庆市渝北区加州城市花园', 182, '2016-01-04 00:00:00', 1, '低楼层', 2, 4, '6号线', 2, '西南', 4000, '重庆市', '渝北', 26, '加州城市花园', '5', '2017-07-02 00:00:00'),
(6, 0, '重庆市江北区华立天地豪园', 171, '2002-03-13 00:00:00', 21, '高楼层', 2, 4, NULL, 2, '南', 2400, '重庆市', '江北', 35, '华立天地豪园', '4', '2017-07-02 00:00:00'),
(7, 0, '重庆市渝北区北城国际中心', 83, '2017-02-28 00:00:00', 5, '低楼层', 1, 2, NULL, 1, NULL, 2500, '', '', 0, '', '', '2017-07-03 00:00:00'),
(8, 1, '重庆市南岸国际社区官邸三组团', 83, '2017-03-20 00:00:00', 15, '中楼层', 2, 2, NULL, 1, '东南', 2200, '重庆市', '南岸', 30, '', '', '2017-07-02 00:00:00'),
(9, 43, '重庆市江津朗苑', 41, '2017-03-28 00:00:00', 14, '中楼层', 1, 1, NULL, 1, '北', 900, '重庆市', '江津', 31, '', '', '2017-07-02 00:00:00'),
(10, 12, '重庆市巴南典雅龙海港湾', 58, '2017-01-24 00:00:00', 10, '中楼层', 1, 1, NULL, 1, '西', 1400, '重庆市', '巴南', 20, '', '', '2017-06-05 00:00:00'),
(23, 0, '江北机场路10号', 22, '2017-04-12 00:00:00', 3, '中楼层', 1, 2, '3号线', 1, '南', 1800, '重庆市', '江北区', 6, '江北机场', '45', '2017-07-02 00:00:00'),
(26, 1, '重庆市南岸四公里', 72.21, '2017-07-05 00:00:00', 14, '低楼层', 1, 2, '6号线', 1, '西北', 3000, '重庆市', '南岸', 20, '花园小区', '13', '2017-07-02 00:00:00'),
(27, 2, '重庆市巴南龙洲湾', 110, '2017-07-03 00:00:00', 11, '高楼层', 2, 3, '4号线', 1, '南', 5000, '重庆市', '巴南', 30, '典雅龙湾', '10', '2017-06-01 00:00:00'),
(28, 1, '重庆市江北观音桥', 86, '2017-07-05 00:00:00', 16, '高楼层', 2, 3, '3号线', 1, '北', 4500, '重庆市', '江北', 40, '东方家园', '94', '2017-06-16 00:00:00'),
(29, 1, '重庆市渝中大坪', 86, '2017-07-03 00:00:00', 6, '低层', 2, 2, '2号线', 1, '南', 3200, '重庆市', '渝中', 30, '龙湖花园', '111', '2017-06-05 00:00:00'),
(30, 580, '重庆渝北汽博中心融创紫枫郡 ', 94, '2014-03-15 00:00:00', 26, '高楼层', 1, 3, '3号线', 1, '西北', 3600, '重庆市', '渝北', 33, '融创紫枫郡', '22', '2017-06-28 00:00:00'),
(31, 107, '重庆市渝北汽博中心', 105, '2015-04-25 00:00:00', 6, '低楼层', 2, 2, '3号线', 1, '南', 3200, '重庆市', '渝北', 33, '奥林匹克花园新亚洲', '4', '2017-06-19 00:00:00'),
(32, 301, '重庆市南岸区四公里', 72.21, '2013-09-10 00:00:00', 3, '低楼层', 1, 2, NULL, 1, '北', 2000, '重庆市', '南岸区', 33, '华城国际 ', '2', '2017-06-04 00:00:00'),
(33, 268, '重庆市渝北区嘉州', 182.54, '2003-10-17 00:00:00', 15, '中楼层', 2, 4, NULL, 2, '西南', 4000, '重庆市', '渝北区', 26, '加州城市花园', '4', '2017-06-25 00:00:00'),
(34, 19, '重庆市江津老城区', 50, '2015-05-02 00:00:00', 5, '低楼层', 1, 1, NULL, 1, '东南', 1200, '重庆市', '江津', 32, '明月香山', '142', '2017-03-24 00:00:00'),
(35, 152, '重庆市渝中化龙桥', 61, '2017-07-04 00:00:00', 9, '中楼层', 1, 1, '4号线', 1, '西北', 2600, '重庆市', '渝中', 15, '天地雍江翠湖 ', '114', '2017-07-05 00:00:00'),
(36, 56, '重庆市江北区黄泥磅', 89, '2008-09-19 00:00:00', 24, '高楼层', 2, 2, '6号线', 1, '东南', 2800, '重庆市', '江北区', 33, '御景天成', '5', '2017-06-20 00:00:00'),
(38, 34, '重庆市渝北嘉州', 135, '2012-07-13 00:00:00', 6, '低楼层', 2, 3, '3号线', 2, '西', 7000, '重庆市', '渝北区', 32, '中渝山顶道国宾城 ', '5', '2017-06-05 00:00:00'),
(39, 12, '重庆大渡口', 0, '2017-07-06 00:00:00', 3, '低楼层', 3, 2, '6号线', 1, '南', 2321, '重庆', '大渡口', 12, '12345', '12', '2017-07-21 00:00:00'),
(40, 342, '重庆市渝北区人和', 213, '2013-05-04 00:00:00', 3, '低楼层', 2, 4, NULL, 2, '西南', 13000, '重庆市', '渝北区', 11, '棕榈泉三期', '2', '2017-05-09 00:00:00'),
(41, 34, '重庆渝北人和', 181, '2014-04-09 00:00:00', 14, '中层楼', 2, 3, NULL, 2, '西南', 15000, '重庆市', '渝北区', 33, '棕榈泉四期', '2', '2017-02-08 00:00:00'),
(42, 5, '重庆江北观音桥', 315, '2000-12-08 00:00:00', 14, '高楼层', 3, 7, '6号线', 4, '东南', 8500, '重庆市', '江北', 16, '望海花园', '21', '2016-08-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table 'RentHouseComment'
--

CREATE TABLE IF NOT EXISTS RentHouseComment (
  rentHouseId int(11) NOT NULL,
  userComment varchar(300) NOT NULL,
  userId int(11) NOT NULL,
  userCommentDate datetime NOT NULL,
  rentHouseCommentId int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (rentHouseCommentId)
);

--
-- Dumping data for table 'RentHouseComment'
--

INSERT INTO RentHouseComment (rentHouseId, userComment, userId, userCommentDate, rentHouseCommentId) VALUES
(5, '喜欢~', 2, '2017-07-03 16:35:00', 6),
(5, '评论框有毒啊~', 2, '2017-07-03 12:22:31', 8),
(5, 'hello', 2, '2017-07-05 15:24:09', 18),
(5, '可以', 2, '2017-07-05 19:40:10', 20);

-- --------------------------------------------------------

--
-- Table structure for table 'RentHouseDeal'
--

CREATE TABLE IF NOT EXISTS RentHouseDeal (
  agentId int(11) NOT NULL,
  rentHouseId int(11) NOT NULL,
  userId int(11) NOT NULL,
  rentTime datetime NOT NULL,
  rentId int(11) NOT NULL AUTO_INCREMENT,
  rentPrice float NOT NULL,
  rentHouseDay int(11) NOT NULL,
  PRIMARY KEY (rentId)
)  ;

--
-- Dumping data for table 'RentHouseDeal'
--

INSERT INTO RentHouseDeal (agentId, rentHouseId, userId, rentTime, rentId, rentPrice, rentHouseDay) VALUES
(1, 6, 2, '2017-06-02 20:47:46', 2, 2000, 33);

-- --------------------------------------------------------

--
-- Table structure for table 'RentHousePic'
--

CREATE TABLE IF NOT EXISTS RentHousePic (
  insertTime datetime DEFAULT NULL,
  picUrl varchar(200) NOT NULL,
  rentHouseId int(11) NOT NULL,
  rentHousePicId int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (rentHousePicId),
  UNIQUE KEY rentHousePicId (rentHousePicId)
) ;

--
-- Dumping data for table 'RentHousePic'
--

INSERT INTO RentHousePic (insertTime, picUrl, rentHouseId, rentHousePicId) VALUES
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 32, 0),
('2017-07-08 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.png', 5, 1),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.png', 5, 2),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.png', 5, 3),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.png', 5, 4),
('2017-07-02 16:33:35', 'http://oxnvfyqo7.bkt.clouddn.com/28.png', 21, 5),
('2017-07-02 17:14:13', 'http://oxnvfyqo7.bkt.clouddn.com/28.png',22, 6),
('2017-07-02 17:20:07', 'http://oxnvfyqo7.bkt.clouddn.com/28.png', 23, 7),
('2017-07-03 21:07:12', 'http://oxnvfyqo7.bkt.clouddn.com/28.png', 24, 8),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 26, 9),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 27, 10),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 28, 11),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 30, 12),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 27, 13),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 27, 14),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 27, 15),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 26, 16),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 26, 17),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 26, 18),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 28, 19),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 28, 20),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 32, 21),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 28, 22),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 32, 23),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 32, 24),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 30, 25),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 30, 26),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 30, 27),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 31, 28),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 33, 29),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 33, 30),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 33, 31),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 33, 32),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 34, 33),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 34, 34),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 34, 35),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 36, 36),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 36, 37),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 35, 38),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 35, 39),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 35, 40),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 35, 41),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 6, 43),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 6, 44),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 6, 45),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 6, 46),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 7, 47),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 7, 48),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 7, 49),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 7, 50),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 8, 51),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 8, 52),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 8, 53),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 8, 54),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 9, 55),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 9, 56),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 9, 57),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 9, 58),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 10, 59),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 10, 60),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 10, 61),
('2017-07-04 00:00:00', 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 10, 62),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 37, 63),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 37, 64),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 37, 65),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 37, 66),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 38, 67),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 38, 68),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 38, 69),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 40, 73),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 40, 74),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 40, 75),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 40, 76),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 41, 77),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 41, 78),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 41, 79),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 41, 80),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 42, 81),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 42, 82),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 42, 83),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 42, 84),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 42, 85),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 31, 88),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 31, 89),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 31, 90),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 34, 91),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 36, 92),
(NULL, 'http://oxnvfyqo7.bkt.clouddn.com/28.jpg', 36, 93);

-- --------------------------------------------------------

--
-- Table structure for table 'RentHouse_Characteristics'
--

CREATE TABLE IF NOT EXISTS RentHouse_Characteristics (
  rentHouseId int(11) NOT NULL,
  characteristicsId int(11) NOT NULL,
  PRIMARY KEY (rentHouseId,characteristicsId)
);

--
-- Dumping data for table 'RentHouse_Characteristics'
--

INSERT INTO RentHouse_Characteristics (rentHouseId, characteristicsId) VALUES
(23, 6);

-- --------------------------------------------------------

--
-- Table structure for table 'RentHouse_Community'
--

CREATE TABLE IF NOT EXISTS RentHouse_Community (
  communityId int(11) NOT NULL,
  rentHouseId int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table 'User'
--

CREATE TABLE IF NOT EXISTS User (
  userId int(11) NOT NULL AUTO_INCREMENT,
  username varchar(15) NOT NULL,
  name varchar(30) DEFAULT '',
  userPassword varchar(15) NOT NULL,
  userSex varchar(8) DEFAULT NULL,
  userEmail varchar(30) DEFAULT '',
  userPhoneNumber varchar(30) DEFAULT '',
  userPhoto varchar(200) NOT NULL,
  PRIMARY KEY (userId),
  UNIQUE KEY username (username),
  UNIQUE KEY userEmail (userEmail),
  UNIQUE KEY userPhoneNumber (userPhoneNumber)
) ;

--
-- Dumping data for table 'User'
--

INSERT INTO User (userId, username, name, userPassword, userSex, userEmail, userPhoneNumber, userPhoto) VALUES
(2, 'zdn2', 'zdn2', 'zdn', '男', '97123123@qq.com', '18200000', 'http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png'),
(3, 'zdn', 'wcc', 'zdn', '男', '972115233@qq.com', '18300000', 'http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png');

-- --------------------------------------------------------

--
-- Table structure for table 'UserCollectBuilding'
--

CREATE TABLE IF NOT EXISTS UserCollectBuilding (
  userId int(11) NOT NULL,
  buildingId int(11) NOT NULL,
  collectTime datetime DEFAULT NULL
);

--
-- Dumping data for table 'UserCollectBuilding'
--

INSERT INTO UserCollectBuilding (userId, buildingId, collectTime) VALUES
(2, 2, '2017-07-05 01:05:43'),
(2, 14, '2017-07-05 15:28:49');

-- --------------------------------------------------------

--
-- Table structure for table 'UserCollectRentHouse'
--

CREATE TABLE IF NOT EXISTS UserCollectRentHouse (
  userId int(11) NOT NULL,
  rentHouseId int(11) NOT NULL,
  collectTime datetime DEFAULT NULL,
  PRIMARY KEY (userId,rentHouseId)
);

--
-- Dumping data for table 'UserCollectRentHouse'
--

INSERT INTO UserCollectRentHouse (userId, rentHouseId, collectTime) VALUES
(2, 5, NULL),
(2, 6, '2017-07-01 00:00:00'),
(3, 9, NULL),
(2, 23, NULL),
(3, 5, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
