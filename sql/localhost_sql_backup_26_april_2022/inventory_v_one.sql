-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2022 at 04:51 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `c_mapping_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
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
  `updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
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
('Civi6235fbcb1d77f', 'Civil Engineers & Contractor', 'Head Office', 'Civil Engineers and Contractors', 'Karur', 'civil.engg@gmail.com', 'www.civileng.com', 'xavier@gmail.com', '2022-03-19 15:50:35.120856', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `company_product_mapping`
--

CREATE TABLE `company_product_mapping` (
  `mapping_id` varchar(50) NOT NULL,
  `company_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `mapping_updated_by` varchar(50) NOT NULL,
  `mapping_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
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
  `updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
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
('Mr. 62360c96baa69', 'Mr. Vengatesh', 'NA', 'NA', 'NA', 'vengatesh@gmail.com', 'NA', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-19 17:02:14.815255', 'y');

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
  `itr_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
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
  `tr_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
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
  `created_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `product_detail`, `product_model`, `product_type`, `quantity`, `calculation_unit`, `current_rate`, `created_by`, `created_user_company_id`, `created_date_time`, `status`) VALUES
('61fa94bbe37c9', 'Keyboard', 'Basic keyboard for normal use', 'Dell Keyboard D527', 'Basic Model', '1142', 'Quantity', '600', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-02 14:27:07.931935', 'y'),
('61fa9509ec146', 'Mouse', 'Basic Mouse wired', 'Dell Mouse D102', 'Basic Model with mouse wheel', '1722', 'Quantity', '350', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-02 14:28:25.967175', 'y'),
('61faa695e3206', 'Dual Speaker', 'Speaker for computers', 'Sony Speakers', 'Wired speakers', '3000', 'Quantity', '750', 'dinesh@gmail.com', 'Star61f95202acb4a', '2022-02-02 15:43:17.930533', 'y'),
('61faa71157273', 'Microphone USB type', 'Normal Microphone for computers', 'JBL Microphones', 'Wired Mics', '3982', 'Quantity', '385', 'dinesh@gmail.com', 'Star61f95202acb4a', '2022-02-02 15:45:21.357682', 'y'),
('61faa857ba68f', 'Micro SD 64 GB', 'Sony Micro SD 8GG', 'Applicable for mobile and PCs', 'Normal USD', '830', 'Quantity', '690', 'ganesh@gmail.com', 'Star61f95202acb4a', '2022-02-02 15:50:47.763587', 'y'),
('621642cba2497', 'Barcode reader', 'Handy barcode reader', 'Bar5122', 'New model with bluetooth and wifi', '4776', 'Quantity', '2000', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-23 14:20:59.664877', 'y'),
('621b33d8432a5', 'USB Dongle', 'NA', 'NA', 'NA', '588', 'Quantity', '550', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-27 08:18:32.287435', 'y'),
('621cb1e4a0784', 'HDMI Cable', 'NA', 'NA', 'NA', '807', 'Quantity', '565', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-02-28 11:28:36.657622', 'n'),
('62248dd9c932b', 'HardDisc 660 HHD', 'NA', 'NA', 'NA', '4994', 'Quantity', '2300', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-03-06 10:32:57.824334', 'y'),
('622761fd26ef8', 'Touch Pen', 'NA', 'NA', 'NA', '42696', 'Quantity', '2550', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-03-08 14:02:37.181833', 'y'),
('622f46382794f', '36\"x24\" Sheet', 'NA', 'NA', 'NA', '500', 'Quantity', '250', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-03-14 13:42:16.162679', 'd'),
('6238898b57622', '36\"X24\" SHEET', 'NA', 'NA', 'NA', '1045', 'Quantity', '300', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:19:55.369797', 'y'),
('623889ad99397', '36\"X13\" SHEET', 'NA', 'NA', 'NA', '890', 'Quantity', '255', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:20:29.627789', 'y'),
('623889ccb97a4', '36\"X10\" SHEET', 'NA', 'NA', 'NA', '1020', 'Quantity', '550', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:21:00.759980', 'y'),
('623889fc7a983', '36\"X16\" SHEET', 'NA', 'NA', 'NA', '1241', 'Quantity', '634', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:21:48.502278', 'y'),
('62388a1f55f14', '36\"X9\" SHEET', 'NA', 'NA', 'NA', '805', 'Quantity', '200', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:22:23.352174', 'y'),
('62388a345aad0', 'Prop 2M', 'NA', 'NA', 'NA', '816', 'Quantity', '450', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:22:44.371520', 'y'),
('62388a4dc4d1f', 'Prop 3M', 'NA', 'NA', 'NA', '1112', 'Quantity', '650', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:23:09.806318', 'y'),
('62388a79c79d1', 'Span', 'NA', 'NA', 'NA', '884', 'Quantity', '340', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:23:53.817732', 'y'),
('62388ab594c12', 'Span 8\" 0\"', 'NA', 'NA', 'NA', '890', 'Quantity', '220', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:24:53.610536', 'y'),
('62388ad6509b7', 'Column Box 8\"', 'NA', 'NA', 'NA', '920', 'Quantity', '522', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-21 14:25:26.330321', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `register_admin`
--

CREATE TABLE `register_admin` (
  `admin_id` int(255) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_mobile` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `admin_last_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register_admin`
--

INSERT INTO `register_admin` (`admin_id`, `admin_name`, `admin_mobile`, `admin_email`, `admin_password`, `admin_last_updated_date_time`) VALUES
(1, 'DANNY', '123123123', 'danny@gmail.com', 'danny', '2022-02-01 15:24:24.367439'),
(2, 'CHRISTOFER', '1231231231', 'christofer@gmail.com', 'christofer', '2022-02-01 15:29:03.850674'),
(3, 'XAVIER', '9834421275', 'xavier@gmail.com', 'xavier', '2022-03-19 15:49:10.741127');

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
  `tr_bill_inbound_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `tr_bill_updated_by` varchar(50) NOT NULL,
  `tr_bill_user_company_id` varchar(50) NOT NULL,
  `tr_bill_status` varchar(11) NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_bill`
--

INSERT INTO `transaction_bill` (`tr_bill_id`, `tr_bill_customer_id`, `tr_bill_product_id`, `tr_bill_outbound_quantity`, `tr_bill_outbound_date_time`, `tr_bill_inbound_quantity`, `tr_bill_inbound_date_time`, `tr_bill_updated_by`, `tr_bill_user_company_id`, `tr_bill_status`) VALUES
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa857ba68f', '80', '2022-03-22 19:26:55.440062', '80', '2022-04-12 13:57:00.000000', 'dinesh@gmail.com', 'Star61f95202acb4a', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa71157273', '38', '2022-03-22 19:26:55.439789', '38', '2022-04-12 13:57:00.000000', 'dinesh@gmail.com', 'Star61f95202acb4a', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa695e3206', '44', '2022-03-22 19:26:55.439394', '44', '2022-04-12 13:57:00.000000', 'dinesh@gmail.com', 'Star61f95202acb4a', 'a'),
('6239d591583c2', 'TPKS61faa64504614', '61faa695e3206', '120', '2022-03-22 19:26:33.361557', '120', '2022-04-22 13:57:00.000000', 'dinesh@gmail.com', 'Star61f95202acb4a', 'a'),
('6239d591583c2', 'TPKS61faa64504614', '61faa71157273', '50', '2022-03-22 19:26:33.362188', '50', '2022-04-22 13:57:00.000000', 'dinesh@gmail.com', 'Star61f95202acb4a', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '62388a345aad0', '10', '2021-12-30 19:12:00.000000', '10', '2022-12-31 13:43:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '62388a1f55f14', '5', '2021-12-30 19:12:00.000000', '5', '2022-12-31 13:43:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ccb97a4', '70', '2021-12-30 19:12:00.000000', '70', '2022-12-31 13:43:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889fc7a983', '20', '2021-12-30 19:12:00.000000', '20', '2022-12-31 13:43:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ad99397', '30', '2021-12-30 19:12:00.000000', '30', '2022-12-31 13:43:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a4dc4d1f', '4', '2022-01-07 19:08:00.000000', '4', '2022-01-31 13:40:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '6238898b57622', '50', '2022-01-07 19:08:00.000000', '50', '2022-01-31 13:40:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a345aad0', '11', '2022-01-07 19:08:00.000000', '11', '2022-01-31 13:40:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d03dafa1a', 'Er. 62388d4914550', '62388a345aad0', '150', '2021-10-07 19:03:00.000000', '150', '2021-10-31 13:34:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d0ad7df44', 'Er. 62388d4914550', '62388a79c79d1', '30', '2021-10-09 19:05:00.000000', '30', '2021-10-31 13:36:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62388df38f064', 'Er. 62388d4914550', '6238898b57622', '300', '2021-09-20 20:07:00.000000', '300', '2021-10-31 14:54:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('622d8ce77e28b', 'Raj 622488aa77f59', '61fa9509ec146', '66', '2022-03-02 05:55:00.000000', '66', '2022-03-07 09:24:00.000000', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('622d7def9d4f7', 'PKN621b359860bec', '622761fd26ef8', '12', '2022-03-01 12:12:00.000000', '12', '2022-03-13 05:24:09.088317', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('622d8cc9bda15', 'Phoe621641fa5cdd4', '621642cba2497', '55', '2022-03-02 04:53:00.000000', '54', '2022-03-13 06:20:24.830845', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '622761fd26ef8', '30', '2022-03-08 20:09:58.347293', '19', '2022-03-08 14:45:07.477257', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '62248dd9c932b', '7', '2022-03-08 20:09:58.347009', '04', '2022-03-08 14:43:03.286458', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '621642cba2497', '20', '2022-03-08 20:09:58.346681', '3', '2022-03-08 14:43:03.286228', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('62276aa5f28a2', 'Leno62248dbe659d9', '621b33d8432a5', '47', '2022-03-08 20:09:33.993493', '40', '2022-03-08 14:42:16.948099', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('62276aa5f28a2', 'Leno62248dbe659d9', '62248dd9c932b', '16', '2022-03-08 20:09:33.993714', '11', '2022-03-08 14:42:16.948352', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('62276a7571828', 'Phoe621641fa5cdd4', '61fa94bbe37c9', '5', '2022-03-08 20:08:45.465033', '3', '2022-03-08 14:40:44.544582', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('62276a9226397', 'AGR 61fa93ab04923', '61fa9509ec146', '22', '2022-03-08 20:09:14.156621', '10', '2022-03-08 14:41:38.706153', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a4dc4d1f', '4', '2022-01-07 19:08:00.000000', '2', '2022-04-12 13:58:44.854553', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ccb97a4', '70', '2021-12-30 19:12:00.000000', '70', '2022-04-12 14:19:41.532656', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('625e83985878a', 'PKN621b359860bec', '61fa9509ec146', '5', '2022-04-17 15:10:00.000000', '5', '2022-04-19 09:41:05.232013', 'john@gmail.com', 'Apex61f950ea98cc7', 'a'),
('6259c9001ab92', 'Mr. 623606796fe50', '62388a345aad0', '5', '2022-02-11 01:05:00.000000', '5', '2022-04-24 12:04:38.845743', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6259c9001ab92', 'Mr. 623606796fe50', '62388a345aad0', '5', '2022-02-11 01:05:00.000000', '5', '2022-04-24 12:11:36.214750', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6265530297717', 'Mr. 6236049d7cfd3', '62388a345aad0', '8', '2022-04-20 19:08:00.000000', '8', '2022-04-24 13:40:25.804220', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6265530297717', 'Mr. 6236049d7cfd3', '62388ad6509b7', '4', '2022-04-20 19:08:00.000000', '3', '2022-04-24 13:41:27.341842', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6265530297717', 'Mr. 6236049d7cfd3', '62388ad6509b7', '4', '2022-04-20 19:08:00.000000', '1', '2022-04-24 13:42:06.082933', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62655642df7db', 'Mr. 623609223c1e0', '62388ad6509b7', '8', '2022-04-20 19:22:00.000000', '8', '2022-04-30 13:53:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62655642df7db', 'Mr. 623609223c1e0', '62388ad6509b7', '8', '2022-04-20 19:22:00.000000', '4', '2022-04-30 13:56:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('62655642df7db', 'Mr. 623609223c1e0', '62388a79c79d1', '4', '2022-04-20 19:22:00.000000', '4', '2022-04-30 13:56:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a'),
('6259c9001ab92', 'Mr. 623606796fe50', '62388a345aad0', '5', '2022-02-11 01:05:00.000000', '2', '2022-04-20 00:48:00.000000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'a');

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
  `tr_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `tr_status` varchar(50) NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`tr_id`, `tr_customer_id`, `tr_product_id`, `tr_product_quantity`, `tr_price`, `tr_updated_by`, `tr_user_company_id`, `tr_type`, `tr_updated_date_time`, `tr_status`) VALUES
('62276abe549fa', 'Fico622761e8ba6b1', '622761fd26ef8', '19', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-08 14:45:07.475411', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '62248dd9c932b', '4', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-08 14:43:03.286371', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '621642cba2497', '3', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-08 14:43:03.286034', 'a'),
('62276aa5f28a2', 'Leno62248dbe659d9', '62248dd9c932b', '11', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-08 14:42:16.948258', 'a'),
('62276aa5f28a2', 'Leno62248dbe659d9', '621b33d8432a5', '40', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-08 14:42:16.947890', 'a'),
('62276a9226397', 'AGR 61fa93ab04923', '61fa9509ec146', '10', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-08 14:41:38.705936', 'a'),
('62276a7571828', 'Phoe621641fa5cdd4', '61fa94bbe37c9', '3', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-08 14:40:44.543936', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '622761fd26ef8', '30', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-08 14:39:58.347293', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '62248dd9c932b', '7', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-08 14:39:58.347009', 'a'),
('62276abe549fa', 'Fico622761e8ba6b1', '621642cba2497', '20', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-08 14:39:58.346681', 'a'),
('62276aa5f28a2', 'Leno62248dbe659d9', '62248dd9c932b', '16', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-08 14:39:33.993714', 'a'),
('62276aa5f28a2', 'Leno62248dbe659d9', '621b33d8432a5', '47', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-08 14:39:33.993493', 'a'),
('62276a9226397', 'AGR 61fa93ab04923', '61fa9509ec146', '22', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-08 14:39:14.156621', 'a'),
('62276a7571828', 'Phoe621641fa5cdd4', '61fa94bbe37c9', '5', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-08 14:38:45.465033', 'a'),
('622d7def9d4f7', 'PKN621b359860bec', '622761fd26ef8', '12', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-01 06:42:00.000000', 'a'),
('622d7f8e0210e', 'Leno62248dbe659d9', '62248dd9c932b', '33', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-13 05:22:22.008697', 'a'),
('622d7def9d4f7', 'PKN621b359860bec', '622761fd26ef8', '12', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-13 05:24:09.065118', 'a'),
('622d8cc9bda15', 'Phoe621641fa5cdd4', '621642cba2497', '55', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-01 23:23:00.000000', 'a'),
('622d8ce77e28b', 'Raj 622488aa77f59', '61fa9509ec146', '66', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-02 00:25:00.000000', 'a'),
('622d8cc9bda15', 'Phoe621641fa5cdd4', '621642cba2497', '54', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-13 06:20:24.811485', 'a'),
('622d8ce77e28b', 'Raj 622488aa77f59', '61fa9509ec146', '66', '11', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-03-07 09:24:00.000000', 'a'),
('6235eefc61785', 'Leno62248dbe659d9', '61fa94bbe37c9', '5', '3000', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-19 14:55:56.399291', 'a'),
('6235eefc61785', 'Leno62248dbe659d9', '61fa9509ec146', '11', '3850', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-19 14:55:56.432537', 'a'),
('6235eefc61785', 'Leno62248dbe659d9', '621642cba2497', '3', '6000', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-19 14:55:56.432930', 'a'),
('6235eefc61785', 'Leno62248dbe659d9', '621b33d8432a5', '10', '5500', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-19 14:55:56.433194', 'a'),
('6235f19a5e31c', 'PKN621b359860bec', '621642cba2497', '15', '30000', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-01 15:06:00.000000', 'a'),
('6235f19a5e31c', 'PKN621b359860bec', '621b33d8432a5', '32', '17600', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-01 15:06:00.000000', 'a'),
('6235f19a5e31c', 'PKN621b359860bec', '622761fd26ef8', '11', '28050', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-01 15:06:00.000000', 'a'),
('62388df38f064', 'Er. 62388d4914550', '6238898b57622', '300', '90000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-09-20 14:37:00.000000', 'a'),
('62388df38f064', 'Er. 62388d4914550', '6238898b57622', '300', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-31 14:54:00.000000', 'a'),
('6239d03dafa1a', 'Er. 62388d4914550', '62388a345aad0', '150', '67500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 13:33:00.000000', 'a'),
('6239d03dafa1a', 'Er. 62388d4914550', '62388a345aad0', '150', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-31 13:34:00.000000', 'a'),
('6239d0ad7df44', 'Er. 62388d4914550', '62388a79c79d1', '30', '10200', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-09 13:35:00.000000', 'a'),
('6239d0ad7df44', 'Er. 62388d4914550', '62388a79c79d1', '30', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-31 13:36:00.000000', 'a'),
('6239d1350f103', 'Mr. 6235fd904a0b6', '623889ccb97a4', '30', '16500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-01-03 13:37:00.000000', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '6238898b57622', '50', '15000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-07 13:38:00.000000', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a345aad0', '11', '4950', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-07 13:38:00.000000', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a4dc4d1f', '4', '2600', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-07 13:38:00.000000', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '6238898b57622', '50', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-01-31 13:40:00.000000', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a345aad0', '11', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-01-31 13:40:00.000000', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a4dc4d1f', '4', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-01-31 13:40:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ad99397', '30', '7650', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-12-30 13:42:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ccb97a4', '70', '38500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-12-30 13:42:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889fc7a983', '20', '12680', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-12-30 13:42:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '62388a1f55f14', '5', '1000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-12-30 13:42:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '62388a345aad0', '10', '4500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-12-30 13:42:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ad99397', '30', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-12-31 13:43:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ccb97a4', '70', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-12-31 13:43:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889fc7a983', '20', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-12-31 13:43:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '62388a1f55f14', '5', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-12-31 13:43:00.000000', 'a'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '62388a345aad0', '10', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-12-31 13:43:00.000000', 'a'),
('6239d591583c2', 'TPKS61faa64504614', '61faa695e3206', '120', '90000', 'dinesh@gmail.com', 'Star61f95202acb4a', 'o', '2022-03-22 13:56:33.361557', 'a'),
('6239d591583c2', 'TPKS61faa64504614', '61faa71157273', '50', '19250', 'dinesh@gmail.com', 'Star61f95202acb4a', 'o', '2022-03-22 13:56:33.362188', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa695e3206', '44', '33000', 'dinesh@gmail.com', 'Star61f95202acb4a', 'o', '2022-03-22 13:56:55.439394', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa71157273', '38', '14630', 'dinesh@gmail.com', 'Star61f95202acb4a', 'o', '2022-03-22 13:56:55.439789', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa857ba68f', '80', '55200', 'dinesh@gmail.com', 'Star61f95202acb4a', 'o', '2022-03-22 13:56:55.440062', 'a'),
('6239d591583c2', 'TPKS61faa64504614', '61faa695e3206', '120', '10', 'dinesh@gmail.com', 'Star61f95202acb4a', 'i', '2022-04-22 13:57:00.000000', 'a'),
('6239d591583c2', 'TPKS61faa64504614', '61faa71157273', '50', '10', 'dinesh@gmail.com', 'Star61f95202acb4a', 'i', '2022-04-22 13:57:00.000000', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa695e3206', '44', '10', 'dinesh@gmail.com', 'Star61f95202acb4a', 'i', '2022-04-12 13:57:00.000000', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa71157273', '38', '10', 'dinesh@gmail.com', 'Star61f95202acb4a', 'i', '2022-04-12 13:57:00.000000', 'a'),
('6239d5a76b418', 'Cami61faa7ecd0bf1', '61faa857ba68f', '80', '10', 'dinesh@gmail.com', 'Star61f95202acb4a', 'i', '2022-04-12 13:57:00.000000', 'a'),
('623f116b0bd73', 'Er. 62360c62d0478', '62388a345aad0', '13', '5850', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-08 14:13:00.000000', 'i'),
('6239d27d24868', 'Mr. 6235fde53a0dc', '623889ccb97a4', '70', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-12 14:19:41.532184', 'a'),
('6243239902efb', 'Wing61fa9357df1eb', '622761fd26ef8', '93', '237150', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-29 15:20:45.252958', 'a'),
('6243239902efb', 'Wing61fa9357df1eb', '62248dd9c932b', '92', '211600', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-29 15:20:45.252668', 'a'),
('6243239902efb', 'Wing61fa9357df1eb', '621b33d8432a5', '91', '50050', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-03-29 15:20:45.252001', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a4dc4d1f', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-12 13:58:44.850786', 'a'),
('624a70cd8aba1', 'Mr. 6236045987a6c', '62388a345aad0', '4', '1800', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 14:32:25.838721', 'a'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a345aad0', '4', '1800', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 14:30:40.263182', 'a'),
('6239d1350f103', 'Mr. 6235fd904a0b6', '623889ccb97a4', '2', '1100', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 14:30:40.261771', 'a'),
('624a70cd8aba1', 'Mr. 6236045987a6c', '62388a79c79d1', '10', '3400', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-04 04:15:15.126849', 'a'),
('624a70cd8aba1', 'Mr. 6236045987a6c', '62388a345aad0', '5', '2250', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-04 04:15:15.126267', 'a'),
('623f116b0bd73', 'Er. 62360c62d0478', '62388a345aad0', '13', '5850', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 19:34:29.067887', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a4dc4d1f', '4', '2600', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 19:34:29.066345', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a345aad0', '11', '4950', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 19:34:29.064846', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '6238898b57622', '50', '15000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 19:34:29.063255', 'i'),
('6239d1350f103', 'Mr. 6235fd904a0b6', '623889ccb97a4', '30', '16500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 19:34:29.061298', 'i'),
('6239d1350f103', 'Mr. 6235fd904a0b6', '623889ccb97a4', '30', '16500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-13 14:10:53.034873', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '6238898b57622', '50', '15000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-13 14:10:53.035335', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a345aad0', '11', '4950', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-13 14:10:53.035648', 'i'),
('6239d197e3205', 'Mr. 6235fd904a0b6', '62388a4dc4d1f', '4', '2600', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-13 14:10:53.035956', 'i'),
('623f116b0bd73', 'Er. 62360c62d0478', '62388a345aad0', '13', '5850', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-13 14:10:53.036310', 'i'),
('6259c9001ab92', 'Mr. 623606796fe50', '62388a345aad0', '5', '2250', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-02-10 19:35:00.000000', 'i'),
('6259c9001ab92', 'Mr. 623606796fe50', '62388a345aad0', '5', '2250', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 19:35:55.892887', 'i'),
('6259c9a143981', 'Mr. 62360b6dd1e12', '62388a79c79d1', '7', '2380', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-19 19:37:00.000000', 'a'),
('6259c9c489aab', 'Mr. 62360b3ad7e0f', '62388a79c79d1', '17', '5780', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-02-06 19:38:00.000000', 'i'),
('6259c9c489aab', 'Mr. 62360b3ad7e0f', '62388a79c79d1', '17', '5780', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 19:38:58.947823', 'a'),
('625d14c1d7dcc', 'Er. 62388d4914550', '62388a345aad0', '3', '1350', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-05 07:35:00.000000', 'a'),
('625e83985878a', 'PKN621b359860bec', '61fa9509ec146', '5', '1750', 'john@gmail.com', 'Apex61f950ea98cc7', 'o', '2022-04-17 09:40:00.000000', 'a'),
('625e83985878a', 'PKN621b359860bec', '61fa9509ec146', '5', '10', 'john@gmail.com', 'Apex61f950ea98cc7', 'i', '2022-04-19 09:41:05.231649', 'a'),
('6259c9001ab92', 'Mr. 623606796fe50', '62388a345aad0', '5', '450', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 12:11:36.214453', 'a'),
('6259c9001ab92', 'Mr. 623606796fe50', '62388a345aad0', '2', '450', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-20 00:48:00.000000', 'a'),
('62655642df7db', 'Mr. 623609223c1e0', '62388a79c79d1', '4', '340', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-30 13:56:00.000000', 'a'),
('62655642df7db', 'Mr. 623609223c1e0', '62388ad6509b7', '4', '522', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-30 13:56:00.000000', 'a'),
('62655642df7db', 'Mr. 623609223c1e0', '62388ad6509b7', '8', '522', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-20 13:52:00.000000', 'a'),
('62655642df7db', 'Mr. 623609223c1e0', '62388a79c79d1', '4', '340', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-20 13:52:00.000000', 'a');

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
  `user_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
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
('6235fbebc1447', 'Suresh', 'suresh@gmail.com', 'suresh', 'Civi6235fbcb1d77f', 'Manager', 'Admin', 'xavier@gmail.com', '2022-03-19 15:51:07.791773');

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
  MODIFY `admin_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
