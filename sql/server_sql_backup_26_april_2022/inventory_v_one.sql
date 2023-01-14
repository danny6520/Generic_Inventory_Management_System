-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2022 at 02:52 PM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_v_one`
--

-- --------------------------------------------------------

--
-- Table structure for table `company_customer_mapping`
--

CREATE TABLE `company_customer_mapping` (
  `customer_mapping_id` varchar(50) NOT NULL,
  `company_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `c_mapping_updated_by` varchar(50) NOT NULL,
  `c_mapping_updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `company_id` varchar(500) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_type` varchar(50) NOT NULL,
  `company_details` varchar(500) NOT NULL,
  `company_head_office` varchar(50) NOT NULL,
  `company_email` varchar(50) NOT NULL,
  `company_website` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`company_id`, `company_name`, `company_type`, `company_details`, `company_head_office`, `company_email`, `company_website`, `created_by`, `updated_date_time`, `status`) VALUES
('Apex61f950ea98cc7', 'Apex Infotech', 'Head Office', 'Apex is an MNC', 'United States', 'getintouch@apex.com', 'www.apexinfotech.com', 'danny@gmail.com', '2022-02-01 15:25:30.625987', 'y'),
('Soft61f951179d34d', 'Soft Tech', 'Branch', 'Soft Tech Technologies and consulting', 'Bangalore', 'contact@softtech.com', 'www.softech.com', 'danny@gmail.com', '2022-02-01 15:26:15.644043', 'y'),
('Star61f95202acb4a', 'Starc Infotech', 'Head Office', 'Starc Infotech Private Limited and MNC', 'Pune', 'contactus@starcinfotech.com', 'www.starcinfotech.com', 'christofer@gmail.com', '2022-02-01 15:30:10.707542', 'y'),
('Mitc61f95243b846c', 'Mitchel Technologies', 'Branch', 'Mitchel Software providers', 'Hydrabad', 'queries@mitcheltech.com', 'www.mitcheltech.com', 'christofer@gmail.com', '2022-02-01 15:31:15.754851', 'y'),
('Pole61faa38b11448', 'Pole Star Technologies', 'Head Office', 'Largest Software Solution providers', 'Uttar Pradesh', 'polestarsupport@polestar.com', 'www.polestartech.com', 'christofer@gmail.com', '2022-02-02 15:30:19.070935', 'y'),
('Civi6235fbcb1d77f', 'Civil Engineers & Contractor', 'Head Office', 'Civil Engineers and Contractors', 'Karur', 'civil.engg@gmail.com', 'www.civileng.com', 'xavier@gmail.com', '2022-03-19 15:50:35.120856', 'y'),
('BPL 6262789e59e5f', 'BPL corp', 'Head Office', 'BPL corp', 'karur', 'admin@bpl.com', 'www.bpl.com', 'andrews@BPL.com', '2022-04-22 09:42:54.368269', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `company_product_mapping`
--

CREATE TABLE `company_product_mapping` (
  `mapping_id` varchar(50) NOT NULL,
  `company_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `mapping_updated_by` varchar(50) NOT NULL,
  `mapping_updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `customer_id` varchar(500) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_type` varchar(50) NOT NULL DEFAULT 'NA',
  `customer_details` varchar(500) NOT NULL DEFAULT 'NA',
  `customer_head_office` varchar(50) NOT NULL DEFAULT 'NA',
  `customer_email` varchar(50) NOT NULL,
  `customer_website` varchar(50) NOT NULL DEFAULT 'NA',
  `customer_mobile` varchar(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_user_company_id` varchar(50) NOT NULL,
  `updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`customer_id`, `customer_name`, `customer_type`, `customer_details`, `customer_head_office`, `customer_email`, `customer_website`, `customer_mobile`, `created_by`, `created_user_company_id`, `updated_date_time`, `status`) VALUES
('Wing61fa9357df1eb', 'Wings Tech', 'Head Office', 'Wings Softwares and Hardwares Providers', 'Gujarat', 'support@wingstech.com', 'www.wingstech.com', '', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-02 14:21:11.914059', 'y'),
('AGR 61fa93ab04923', 'AGR Hardwares', 'Branch', 'Hardware manufacturers', 'Patna', 'helpline@agr.com', 'www.agr.com', '', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-02 14:22:35.018997', 'y'),
('TPKS61faa64504614', 'TPKS Info Tech', 'Head Office', 'Hardware Vendors', 'Mumbai', 'contacttpks@tpks.com', 'www.tpkstech.com', '', 'dinesh@gmail.com', 'Star61f95202acb4a', '2022-02-02 15:41:57.018193', 'y'),
('Cami61faa7ecd0bf1', 'Camio Hardwares', 'Branch', 'Camio hardware suppliers', 'Nagpur', 'support@camio.com', 'www.camiohardwares.com', '', 'ganesh@gmail.com', 'Star61f95202acb4a', '2022-02-02 15:49:00.855079', 'y'),
('Phoe621641fa5cdd4', 'Phoenix Hardwares', 'Head Office', 'Leading manufacturers of Hardwares', 'Lucknow', 'connect@phoenix.com', 'www.phoenixhardwares.com', '', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-23 14:17:30.442013', 'y'),
('PKN621b359860bec', 'PKN', 'NA', 'NA', 'NA', 'pkn@gmail.com', 'NA', '9842273644', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-27 08:26:00.396435', 'y'),
('Raj 622488aa77f59', 'Raj Tech Park', 'NA', 'NA', 'NA', 'rajtech@techpark.com', 'NA', '1231231231', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-03-06 10:10:50.491584', 'y'),
('Leno62248dbe659d9', 'Lenovo Inc', 'NA', 'NA', 'NA', 'support@lenovo.com', 'NA', '1231231231', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-03-06 10:32:30.416316', 'y'),
('Fico622761e8ba6b1', 'Fico Info Tech', 'NA', 'NA', 'NA', 'fico@infotech.com', 'NA', '1231231231', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-03-08 14:02:16.809478', 'y'),
('Mr. 6235fd904a0b6', 'Mr. Kalaiyappan ( Contractor)', 'NA', 'NA', 'NA', 'kaliyappan@gmail.com', 'NA', '9080311182', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 15:58:08.303632', 'y'),
('Mr. 6235fde53a0dc', 'Mr. Pandiyan', 'NA', 'NA', 'NA', 'pandian@gmail.com', 'NA', '9943526330', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 15:59:33.238040', 'y'),
('v. p6235ff1ab92ee', 'V. Parthiben', 'NA', 'NA', 'NA', 'parthiban@gmail.com', 'NA', '9344957171', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:04:42.758625', 'y'),
('Er. 62388d4914550', 'Er. SEKAR CONTRACTOR', 'NA', 'NA', 'NA', 'sekar@gmail.com', 'NA', ' 9994524052', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:35:53.083368', 'y'),
('Mr. 6235ffbd26ce4', 'Mr. G. Ramesh', 'NA', 'NA', 'NA', 'ramesh@gmail.com', 'NA', '9787059576', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:07:25.159053', 'y'),
('Mr. 623600215a86c', 'Mr. T. Dinesh kumar', 'NA', 'NA', 'NA', 'dineshkumar@gmail.com', 'NA', '9843662598', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:09:05.370960', 'y'),
('Mr. 6236005687472', 'Mr. Renganathan', 'NA', 'NA', 'NA', 'renganathan@gmail.com', 'NA', '9894738852', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:09:58.554162', 'y'),
('Mr. 623600a088246', 'Mr. Appau', 'NA', 'NA', 'NA', 'appau@gmail.com', 'NA', '9655667558', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:11:12.557744', 'y'),
('Mr. 623603f6bcd69', 'Mr. Nallusamy', 'NA', 'NA', 'NA', 'nallusamy@gmail.com', 'NA', '9384445106', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:25:27.001309', 'y'),
('Mr. 62360428da0bc', 'Mr. Kumar', 'NA', 'NA', 'NA', 'kumar@gmail.com', 'NA', '8754242780', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:26:17.029414', 'y'),
('Mr. 6236045987a6c', 'Mr. Rajini', 'NA', 'NA', 'NA', 'rajini@gmail.com', 'NA', '9786008071', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:27:05.612871', 'y'),
('Mr. 6236049d7cfd3', 'Mr. Basha bhai', 'NA', 'NA', 'NA', 'bashabhai@gmail.com', 'NA', '9443742886', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:28:13.512102', 'y'),
('Mr. 623604cd64c07', 'Mr. Subramanian', 'NA', 'NA', 'NA', 'subramanian@gmail.com', 'NA', '9385876186', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:29:01.473541', 'y'),
(' Mr.623605bb15451', ' Mr. Eleamathi ', 'NA', 'NA', 'NA', 'eleamathi@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:32:59.137994', 'y'),
('Mr. 62360641e9a90', 'Mr. Marriyappan', 'NA', 'NA', 'NA', 'marriyappan@gmail.com', 'NA', '9786804479', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:35:13.957180', 'y'),
('Mr. 623606796fe50', 'Mr. Mani', 'NA', 'NA', 'NA', 'mani@gmail.com', 'NA', '9952540737', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:36:09.458592', 'y'),
('mr. 623606b142b69', 'Mr. Thangavel', 'NA', 'NA', 'NA', 'thangavel@gmail.com', 'NA', '9976482570', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:37:05.273433', 'y'),
('Mr. 623606f11ec17', 'Mr. Karthikayan', 'NA', 'NA', 'NA', 'karthikayan@gmail.com', 'NA', '9944553206', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:38:09.126180', 'y'),
('Mr. 623607410e39b', 'Mr. Muruganantham', 'NA', 'NA', 'NA', 'muruganantham@gmail.com', 'NA', '9361390289', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:39:29.058493', 'y'),
('Mr. 623607840bc03', 'Mr. Kumar', 'NA', 'NA', 'NA', 'kumar@gmail.com', 'NA', '8754242780', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:40:36.048298', 'y'),
('Mr. 623607b906b0d', 'Mr. Sakthi', 'NA', 'NA', 'NA', 'sakthi@gmail.com', 'NA', '9080823372', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:41:29.027622', 'y'),
('Mr B623608358f836', 'Mr Balu centering contractor', 'NA', 'NA', 'NA', 'balu@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:43:33.587927', 'y'),
('Mr. 6236089938f1e', 'Mr. Kumar', 'NA', 'NA', 'NA', 'kumar@gmail.com', 'NA', '6374050810', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:45:13.233341', 'y'),
('Mr. 623608dc6fb7e', 'Mr. Makendran', 'NA', 'NA', 'NA', 'mahendran@gmail.com', 'NA', '9789217438', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:46:20.457760', 'y'),
('Mr. 623609223c1e0', 'Mr. Jay kumar', 'NA', 'NA', 'NA', 'jaykumar@gmail.com', 'NA', '9994648019', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:47:30.246355', 'y'),
('Er. 6236097a7ddc4', 'Er. Prabakaran', 'NA', 'NA', 'NA', 'prabakaran@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:48:58.515603', 'y'),
('Mr. 623609c233bd3', 'Mr. RAJA', 'NA', 'NA', 'NA', 'raja@gmail.com', 'NA', '9865470813', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:50:10.212087', 'y'),
('Er T62360a19b94cb', 'Er Tamil vanan', 'NA', 'NA', 'NA', 'tamilvanan@gmail.com', 'NA', '9791410484', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:51:37.759099', 'y'),
('Er. 62360a592eed1', 'Er. Senthil ', 'NA', 'NA', 'NA', 'senthil@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:52:41.192290', 'y'),
('Mr. 62360a7e3c941', 'Mr. RAVI', 'NA', 'NA', 'NA', 'ravi@gmail.com', 'NA', '9952579110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:53:18.248283', 'y'),
('Er. 62360ac559c27', 'Er. Prabrakarn', 'NA', 'NA', 'NA', 'prabakaran@gmail.com', 'NA', '9384443975', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:54:29.372907', 'y'),
('Er. 62360b0b8a25d', 'Er. Uthaya kumar', 'NA', 'NA', 'NA', 'uthayakumar@gmail.com', 'NA', '9080331934', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:55:39.565935', 'y'),
('Mr. 62360b3ad7e0f', 'Mr. Murgaesh', 'NA', 'NA', 'NA', 'murugaesh@gmail.com', 'NA', '8220934983', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:56:26.884354', 'y'),
('Mr. 62360b6dd1e12', 'Mr. Sarathi', 'NA', 'NA', 'NA', 'sarathi@gmail.com', 'NA', '9943190444', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:57:17.909378', 'y'),
('Mr. 62360c09d9385', 'Mr. Veeramani', 'NA', 'NA', 'NA', 'veeramani@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 16:59:53.934023', 'y'),
('Er. 62360c62d0478', 'Er. Asfar', 'NA', 'NA', 'NA', 'asfar@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 17:01:22.853223', 'y'),
('Mr. 62360c96baa69', 'Mr. Vengatesh', 'NA', 'NA', 'NA', 'vengatesh@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 17:02:14.815255', 'y'),
('Walk6262cb100bdef', 'Walkin Custrome', 'NA', 'NA', 'NA', 'NA@BPL.COM', 'NA', '9444194441', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 15:34:40.048673', 'y'),
('Test626792a057b9e', 'Test1', 'NA', 'NA', 'NA', 'Test1@sureshcorp.com', 'NA', '9444104269', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-04-26 06:35:12.359372', 'y'),
('test626792c7242cd', 'testold', 'NA', 'NA', 'NA', 'testold@sureshcorp.com', 'NA', '9094862640', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-04-26 06:35:51.148236', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `inbound_transaction_details`
--

CREATE TABLE `inbound_transaction_details` (
  `inbound_transaction_id` varchar(50) NOT NULL,
  `itr_customer_id` varchar(50) NOT NULL,
  `itr_products_returned` varchar(50) NOT NULL,
  `itr_product_quantity` varchar(50) NOT NULL,
  `itr_updated_by` varchar(50) NOT NULL,
  `itr_updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `outbound_transaction_details`
--

CREATE TABLE `outbound_transaction_details` (
  `outbound_transaction_id` varchar(50) NOT NULL,
  `tr_customer_id` varchar(50) NOT NULL,
  `tr_products_selected` varchar(50) NOT NULL,
  `tr_product_quantity` varchar(50) NOT NULL,
  `tr_updated_by` varchar(50) NOT NULL,
  `tr_updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_detail` varchar(50) NOT NULL DEFAULT 'NA',
  `product_model` varchar(50) NOT NULL DEFAULT 'NA',
  `product_type` varchar(50) NOT NULL DEFAULT 'NA',
  `quantity` varchar(50) NOT NULL,
  `calculation_unit` varchar(50) NOT NULL DEFAULT 'Quantity',
  `current_rate` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_user_company_id` varchar(50) NOT NULL,
  `created_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_detail`, `product_model`, `product_type`, `quantity`, `calculation_unit`, `current_rate`, `created_by`, `created_user_company_id`, `created_date_time`, `status`) VALUES
('6265a5f86ef17', 'BARREL OIL', 'NA', 'NA', 'NA', '999000', 'Quantity', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-24 19:33:12.454460', 'y'),
('62632eda55de4', 'ADON D-SUPER', 'NA', 'NA', 'NA', '1000000', 'Quantity', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:40:26.351766', 'y'),
('62632ece61402', 'ADON D- SUPER', 'NA', 'NA', 'NA', '1000000', 'Quantity', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:40:14.398384', 'y'),
('62632ece24d54', 'ADON D- SUPER', 'NA', 'NA', 'NA', '1000000', 'Quantity', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:40:14.150909', 'd'),
('62632e6e1eb9c', 'DISTELLED WATER', 'NA', 'NA', 'NA', '1000000', 'Quantity', '25', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:38:38.125912', 'y'),
('6262a5cc080b3', '4T SERVO', 'NA', 'NA', 'NA', '999600', 'Quantity', '332', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 12:55:40.032994', 'y'),
('6262a592c481b', '4T SERVO', 'NA', 'NA', 'NA', '1000000', 'Quantity', '343', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 12:54:42.804941', 'y'),
('623f67581e6d2', 'Span 8\" 0\"', 'NA', 'NA', 'NA', '6100', 'Quantity', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-26 19:19:52.124674', 'y'),
('623f67330e7af', 'Span 10\" 0\"', 'NA', 'NA', 'NA', '0', 'Quantity', '5.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-26 19:19:15.059352', 'y'),
('623ca05a102e3', 'Span', 'NA', 'NA', 'NA', '9967', 'Quantity', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:46:18.066311', 'y'),
('623c9daf0334f', '36\"X24\" SHEET', 'NA', 'NA', 'NA', '9086', 'Quantity', '1.50', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:34:55.013176', 'y'),
('623c9d0cabcc0', '36\"X13\" SHEET', 'NA', 'NA', 'NA', '9992', 'Quantity', '1.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:32:12.703736', 'y'),
('623c9cd9ea695', '36\"X10\" SHEET', 'NA', 'NA', 'NA', '6385', 'Quantity', '1.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:31:21.960188', 'y'),
('623c9994ea014', 'Prop 2M', 'NA', 'NA', 'NA', '2000', 'Quantity', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:17:24.958531', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `register_admin`
--

CREATE TABLE `register_admin` (
  `admin_id` int NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_mobile` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `admin_last_updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register_admin`
--

INSERT INTO `register_admin` (`admin_id`, `admin_name`, `admin_mobile`, `admin_email`, `admin_password`, `admin_last_updated_date_time`) VALUES
(1, 'DANNY', '123123123', 'danny@gmail.com', 'danny', '2022-02-01 15:24:24.367439'),
(2, 'CHRISTOFER', '1231231231', 'christofer@gmail.com', 'christofer', '2022-02-01 15:29:03.850674'),
(3, 'XAVIER', '9834421275', 'xavier@gmail.com', 'xavier', '2022-03-19 15:49:10.741127'),
(4, 'andrews', '9444104269', 'andrews@BPL.com', 'bpl123#', '2022-04-22 09:41:49.283136');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_bill`
--

CREATE TABLE `transaction_bill` (
  `tr_bill_id` varchar(50) NOT NULL,
  `tr_bill_customer_id` varchar(50) NOT NULL,
  `tr_bill_product_id` varchar(50) NOT NULL,
  `tr_bill_outbound_quantity` varchar(50) NOT NULL,
  `tr_bill_outbound_date_time` varchar(50) NOT NULL,
  `tr_bill_inbound_quantity` varchar(50) NOT NULL DEFAULT 'Not Available',
  `tr_bill_inbound_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `tr_bill_updated_by` varchar(50) NOT NULL,
  `tr_bill_user_company_id` varchar(50) NOT NULL,
  `tr_bill_status` varchar(11) NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_bill`
--

INSERT INTO `transaction_bill` (`tr_bill_id`, `tr_bill_customer_id`, `tr_bill_product_id`, `tr_bill_outbound_quantity`, `tr_bill_outbound_date_time`, `tr_bill_inbound_quantity`, `tr_bill_inbound_date_time`, `tr_bill_updated_by`, `tr_bill_user_company_id`, `tr_bill_status`) VALUES
('62631d25a9a77', 'Mr. 623608dc6fb7e', '', '', '', '40', '2022-04-24 19:08:33.466405', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '52', '2022-04-22 21:25:19.031787', '50', '2022-04-24 19:08:33.465446', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '52', '2022-04-22 21:25:19.031787', '0', '2022-04-24 19:08:33.464408', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '', '', '', '40', '2022-04-24 19:08:33.229285', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '52', '2022-04-22 21:25:19.031787', '50', '2022-04-24 19:08:33.228237', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '52', '2022-04-22 21:25:19.031787', '0', '2022-04-24 19:08:33.227320', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '2022-04-14 11:37:13.069283', '50', '2022-04-22 22:28:10.964654', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('625d8ec446d9d', ' Mr.623605bb15451', '623f67581e6d2', '19', '2022-04-18 16:16:06.470444', '19', '2022-04-18 16:16:40.508813', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '', '', '', '25', '2021-10-25 10:32:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9994ea014', '25', '2021-10-07 10:29:00.000000', '10', '2021-10-25 10:32:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9daf0334f', '70', '2021-10-07 10:29:00.000000', '0', '2021-10-25 10:32:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `tr_id` varchar(50) NOT NULL,
  `tr_customer_id` varchar(50) NOT NULL,
  `tr_product_id` varchar(50) NOT NULL,
  `tr_product_quantity` varchar(50) NOT NULL,
  `tr_price` varchar(50) NOT NULL,
  `tr_updated_by` varchar(50) NOT NULL,
  `tr_user_company_id` varchar(50) NOT NULL,
  `tr_type` varchar(50) NOT NULL,
  `tr_updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `tr_status` varchar(50) NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`tr_id`, `tr_customer_id`, `tr_product_id`, `tr_product_quantity`, `tr_price`, `tr_updated_by`, `tr_user_company_id`, `tr_type`, `tr_updated_date_time`, `tr_status`) VALUES
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.069283', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.068452', 'a'),
('6257f30131ab7', 'Mr. 6235fd904a0b6', '623f67581e6d2', '23', '92', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:10:15.583904', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.961319', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.960766', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.960334', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.959902', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.959363', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.958877', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.958452', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.957983', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.957562', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.957006', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.956611', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.956227', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.955824', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.955291', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.954858', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.954378', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.953520', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '', '25', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-25 10:32:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9994ea014', '10', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-25 10:32:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9daf0334f', '0', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-25 10:32:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9994ea014', '25', '56.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:29:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9daf0334f', '70', '105', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:29:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623ca05a102e3', '10', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:29:00.000000', 'a'),
('625503455ea4e', 'Mr. 6235fd904a0b6', '623f67330e7af', '23', '115', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-12 04:42:57.335669', 'a'),
('625503455ea4e', 'Mr. 6235fd904a0b6', '623f67581e6d2', '12', '48', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-12 04:42:57.334156', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '0', '0', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 15:46:52.442118', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '0', '0', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 15:46:52.441329', 'a'),
('624dadd642dfd', 'Mr. 6235ffbd26ce4', '', '9', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 15:12:27.672369', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '2', '8', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 14:47:59.281747', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '3', '6.75', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 14:47:59.280915', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.735349', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.734968', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.734601', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.734162', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.733771', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.733332', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.732567', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-29 15:58:09.633327', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-29 15:58:09.632370', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '', '50', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '', '8', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623ca6bbe5767', 'Er. 62388d4914550', '623c9994ea014', '100', '225', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-25 01:01:00.000000', 'a'),
('623ca669110bc', 'Er. 62388d4914550', '623c9daf0334f', '100', '150', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-09 01:01:00.000000', 'a'),
('623ca669110bc', 'Er. 62388d4914550', '623ca05a102e3', '30', '120', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-09 01:01:00.000000', 'a'),
('623ca49bdcf07', 'Er. 62388d4914550', '623c9994ea014', '150', '337.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:10:00.000000', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623ca28d5651a', 'Er. 62388d4914550', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-01 10:10:00.000000', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-01 10:10:00.000000', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623ca1798e320', 'Er. 62388d4914550', '623c9daf0334f', '300', '450', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-09-20 10:20:00.000000', 'a'),
('623c9a338519b', 'Er. 62360ac559c27', '623c9994ea014', '77', '173.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-08-11 21:49:00.000000', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.069753', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.070565', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.070955', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.071467', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.071941', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.072396', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.072757', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.073338', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.073826', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.074250', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.074631', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.075036', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.075503', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.075883', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.076290', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.151275', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.151973', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.152392', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.152827', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.153226', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.153724', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.154108', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.154513', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.154938', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.155349', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.155739', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.156145', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.156513', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.157329', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.157746', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.158145', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.158552', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.446323', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.447241', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.447703', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.448126', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.448645', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.449049', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.449424', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.449838', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.450487', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.450853', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.451282', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.451653', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.452171', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.452558', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.452932', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.453314', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.453726', 'a'),
('62581af148b64', 'Mr. 623600a088246', '623c9994ea014', '29', '65.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 13:00:43.841820', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.311036', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.311873', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.312309', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.312761', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.313163', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.313576', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.313981', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.314370', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.314864', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.315293', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.315853', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.316390', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.316888', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.317280', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.317821', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.318371', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.318875', 'a'),
('625d8ec446d9d', ' Mr.623605bb15451', '623f67581e6d2', '19', '76', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-18 16:16:06.470444', 'a'),
('625d8ec446d9d', ' Mr.623605bb15451', '623f67581e6d2', '19', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-18 16:16:40.508071', 'a'),
('625d8f277e0ff', 'v. p6235ff1ab92ee', '623f67581e6d2', '18', '72', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-18 21:47:00.000000', 'a'),
('62614f55410d5', 'Mr. 623600a088246', '623c9994ea014', '1000', '2250', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 12:34:31.426023', 'a'),
('62614f738fb02', 'Mr. 6236005687472', '623c9994ea014', '2000', '4500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 12:35:04.098911', 'a'),
('626150e8dc16e', 'Mr. 6236045987a6c', '623c9cd9ea695', '3610', '4512.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 12:41:15.327156', 'a'),
('6261920598052', 'Mr. 623603f6bcd69', '623f67581e6d2', '901', '3604', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:19:06.252649', 'a'),
('6261920598052', 'Mr. 623603f6bcd69', '623f67330e7af', '937', '4685', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:19:06.253526', 'a'),
('62619280836b9', 'mr. 623606b142b69', '623f67581e6d2', '1000', '4000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:21:06.486374', 'a'),
('62619280836b9', 'mr. 623606b142b69', '623f67581e6d2', '1000', '4000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:21:06.730543', 'a'),
('6261934748c44', 'Mr. 623600215a86c', '623c9994ea014', '356', '801', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:24:35.648382', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '52', '208', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-22 21:25:19.031787', 'a'),
('626326d7550f6', 'Mr. 623609223c1e0', '623f67581e6d2', '25', '100', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-22 22:06:23.674762', 'a'),
('626326d7550f6', 'Mr. 623609223c1e0', '623f67330e7af', '35', '175', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-22 22:06:23.675507', 'a'),
('626327798743e', 'Mr. 623603f6bcd69', '623c9994ea014', '3000', '6750', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-20 03:08:00.000000', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-22 22:28:10.963860', 'a'),
('62632dc0b4140', 'Walk6262cb100bdef', '6262a5cc080b3', '400', '132800', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-22 22:35:47.652814', 'a'),
('62659f8e6e972', 'Mr. 623608dc6fb7e', '623f67581e6d2', '940', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-25 00:37:00.000000', 'a'),
('62659f8e6e972', 'Mr. 623608dc6fb7e', '623f67330e7af', '8973', '5.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-25 00:37:00.000000', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '0', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.226597', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '50', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.227825', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '', '40', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.228890', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '0', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.463686', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '50', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.464986', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '', '40', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.465975', 'a'),
('6265a2f158e43', 'Mr. 62360c96baa69', '623c9994ea014', '50', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-24 19:20:23.466093', 'a'),
('6265a33d54223', 'Mr. 62360c96baa69', '623c9994ea014', '1000', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-26 04:55:00.000000', 'a'),
('6265a618b1655', 'Walk6262cb100bdef', '6265a5f86ef17', '1000', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-24 19:33:46.841100', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `user_id` varchar(500) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `user_email` varchar(500) NOT NULL,
  `user_password` varchar(500) NOT NULL,
  `user_company_id` varchar(500) NOT NULL,
  `user_designation` varchar(500) NOT NULL,
  `user_role` varchar(500) NOT NULL,
  `user_updated_by` varchar(500) NOT NULL,
  `user_updated_date_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_name`, `user_email`, `user_password`, `user_company_id`, `user_designation`, `user_role`, `user_updated_by`, `user_updated_date_time`) VALUES
('61f95372cba71', 'John', 'john@gmail.com', 'john', 'Apex61f950ea98cc7', 'Administrator', 'Admin', 'danny@gmail.com', '2022-02-01 15:36:18.834334'),
('61faa4c12540b', 'Dinesh', 'dinesh@gmail.com', 'dinesh', 'Star61f95202acb4a', 'Manager', 'Admin', 'christofer@gmail.com', '2022-02-02 15:35:29.152803'),
('61f953e8dcb78', 'Vishal', 'vishal@gmail.com', 'vishal', 'Apex61f950ea98cc7', 'Manager', 'Viewer', 'danny@gmail.com', '2022-02-01 15:38:16.904143'),
('61faa4e5039ce', 'Ganesh', 'ganesh@gmail.com', 'ganesh', 'Star61f95202acb4a', 'Consultant', 'Admin', 'christofer@gmail.com', '2022-02-02 15:36:05.014907'),
('61faa58725eb7', 'Ramesh', 'ramesh@gmail.com', 'ramesh', 'Star61f95202acb4a', 'Employee', 'Viewer', 'christofer@gmail.com', '2022-02-02 15:38:47.155455'),
('61faa5b7ca571', 'Rajesh', 'rajesh@gmail.com', 'rajesh', 'Pole61faa38b11448', 'Accountant', 'Admin', 'christofer@gmail.com', '2022-02-02 15:39:35.828880'),
('6235f4ead45a4', 'Sindhu', 'sindhu@gmail.com', 'sindhu', 'Apex61f950ea98cc7', 'Administrator', 'Admin', 'danny@gmail.com', '2022-03-19 15:21:14.869951'),
('6235f5288ef62', 'Priya', 'priya@gmail.com', 'priya', 'Apex61f950ea98cc7', 'Manager', 'Viewer', 'danny@gmail.com', '2022-03-19 15:22:16.585842'),
('6235fbebc1447', 'Suresh', 'suresh@gmail.com', 'suresh', 'Civi6235fbcb1d77f', 'Manager', 'Admin', 'xavier@gmail.com', '2022-03-19 15:51:07.791773'),
('626278d9aae26', 'admin', 'admin@bpl.com', 'admin@123#', 'BPL 6262789e59e5f', 'Employee', 'Admin', 'andrews@BPL.com', '2022-04-22 09:43:53.699985');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `register_admin`
--
ALTER TABLE `register_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `register_admin`
--
ALTER TABLE `register_admin`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
