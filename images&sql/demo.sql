-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-02-12 08:49:09
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

SET @IMAGE_BASE_URL = "YOUR_OWN_IMAGE_BASE_URL"; -- FOR EXAMPLE: https://*****.ap-shanghai.myqcloud.com/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cAuth`
--

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL,
  `content` varchar(511) CHARACTER SET utf8 DEFAULT NULL,
  `images` varchar(1023) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `order_user`
--

CREATE TABLE `order_user` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL COMMENT 'id',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `price` decimal(11,2) NOT NULL COMMENT '价格',
  `source` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `image`, `name`, `price`, `source`) VALUES
(1, CONCAT(@IMAGE_BASE_URL, 'product1.jpg'), '钱包', '132.00', '国内·广东'),
(2, CONCAT(@IMAGE_BASE_URL, 'product2.jpg'), '金色木吉他', '480.50', '国内·广东'),
(3, CONCAT(@IMAGE_BASE_URL, 'product3.jpg'), '红纹铁质装订机', '28.00', '国内·福建'),
(4, CONCAT(@IMAGE_BASE_URL, 'product4.jpg'), '新鲜有机青蔬', '30.90', '国内·江苏'),
(5, CONCAT(@IMAGE_BASE_URL, 'product5.jpg'), '仿铁盘创意时钟', '45.00', '海外·瑞典'),
(6, CONCAT(@IMAGE_BASE_URL, 'product6.jpg'), '新鲜采摘葡萄', '24.80', '国内·新疆'),
(7, CONCAT(@IMAGE_BASE_URL, 'product7.jpg'), '果蔬大礼包', '158.00', '海外·新西兰'),
(8, CONCAT(@IMAGE_BASE_URL, 'product8.jpg'), '红色复古轿车模型', '35.00', '海外·德国'),
(9, CONCAT(@IMAGE_BASE_URL, 'product9.jpg'), '风驰电掣小摩托', '249.00', '国内·浙江'),
(10, CONCAT(@IMAGE_BASE_URL, 'product10.jpg'), '筐装大红苹果', '29.80', '国内·山东'),
(11, CONCAT(@IMAGE_BASE_URL, 'product11.jpg'), '精装耐用男鞋', '335.00', '国内·广东'),
(12, CONCAT(@IMAGE_BASE_URL, 'product12.jpg'), '宗教圣地旅游纪念', '1668.00', '海外·印度'),
(13, CONCAT(@IMAGE_BASE_URL, 'product13.jpg'), '高品质原装泵', '2000.80', '国内·河北'),
(14, CONCAT(@IMAGE_BASE_URL, 'product14.jpg'), '金刚轱辘圈', '34.00', '国内·辽宁'),
(15, CONCAT(@IMAGE_BASE_URL, 'product15.jpg'), '万圣节南瓜', '29.90', '海外·美国');

-- --------------------------------------------------------

--
-- 表的结构 `trolley_user`
--

CREATE TABLE `trolley_user` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`,`product_id`) USING BTREE,
  ADD KEY `product_link` (`product_id`);

--
-- Indexes for table `order_user`
--
ALTER TABLE `order_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user-order` (`user`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trolley_user`
--
ALTER TABLE `trolley_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `order_user`
--
ALTER TABLE `order_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=19;
--
-- 限制导出的表
--

--
-- 限制表 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_link` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- 限制表 `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_link` FOREIGN KEY (`order_id`) REFERENCES `order_user` (`id`),
  ADD CONSTRAINT `product_link` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- 限制表 `trolley_user`
--
ALTER TABLE `trolley_user`
  ADD CONSTRAINT `trolley_link` FOREIGN KEY (`id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
