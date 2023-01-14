-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2022 at 09:02 AM
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
  `itr_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_master`
--

CREATE TABLE `inventory_master` (
  `inv_id` varchar(50) NOT NULL,
  `inv_supplier_id` varchar(50) NOT NULL,
  `inv_product_id` varchar(50) NOT NULL,
  `inv_product_quantity` varchar(50) NOT NULL,
  `inv_price` varchar(50) NOT NULL,
  `inv_updated_by` varchar(50) NOT NULL,
  `inv_user_company_id` varchar(50) NOT NULL,
  `inv_type` varchar(50) NOT NULL,
  `inv_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `inv_status` varchar(50) NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_entory_master`
--

CREATE TABLE `inv_entory_master` (
  `inv_id` varchar(50) NOT NULL,
  `inv_supplier_id` varchar(50) NOT NULL,
  `inv_product_id` varchar(50) NOT NULL,
  `inv_product_quantity` varchar(50) NOT NULL,
  `inv_price` varchar(50) NOT NULL,
  `inv_updated_by` varchar(50) NOT NULL,
  `inv_user_company_id` varchar(50) NOT NULL,
  `inv_type` varchar(50) NOT NULL,
  `inv_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `inv_status` varchar(50) NOT NULL DEFAULT 'a'
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
('6265a5f86ef17', 'BARREL OIL', 'NA', 'NA', 'NA', '997996', 'Quantity', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-24 19:33:12.454460', 'y'),
('62632eda55de4', 'ADON D-SUPER 100 ML', 'NA', '100 ML', 'ADON', '999682', 'Quantity', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:40:26.351766', 'y'),
('62632ece61402', 'ADON D-SUPER 250 ML', 'NA', '250 ML', 'ADON', '999943', 'Quantity', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:40:14.398384', 'y'),
('62632ece24d54', 'ADON D- BOTTLE 100 ML\r\n', 'NA', '100 ML', 'ADON', '999732', 'Quantity', '160', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:40:14.150909', 'y'),
('62632e6e1eb9c', 'DISTELLED WATER', 'NA', 'NA', 'NA', '999973', 'Quantity', '25', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 22:38:38.125912', 'y'),
('6262a5cc080b3', '4T SERVO', 'NA', 'NA', 'NA', '999583', 'Quantity', '332', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 12:55:40.032994', 'y'),
('6262a592c481b', '4T SERVO', 'NA', 'NA', 'NA', '999892', 'Quantity', '343', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-04-22 12:54:42.804941', 'y'),
('623f67581e6d2', 'Span 8\" 0\"', 'NA', 'NA', 'NA', '6094', 'Quantity', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-26 19:19:52.124674', 'y'),
('623f67330e7af', 'Span 10\" 0\"', 'NA', 'NA', 'NA', '0', 'Quantity', '5.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-26 19:19:15.059352', 'y'),
('623ca05a102e3', 'Span', 'NA', 'NA', 'NA', '9964', 'Quantity', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:46:18.066311', 'y'),
('623c9daf0334f', '36\"X24\" SHEET', 'NA', 'NA', 'NA', '9082', 'Quantity', '1.50', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:34:55.013176', 'y'),
('623c9d0cabcc0', '36\"X13\" SHEET', 'NA', 'NA', 'NA', '9987', 'Quantity', '1.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:32:12.703736', 'y'),
('623c9cd9ea695', '36\"X10\" SHEET', 'NA', 'NA', 'NA', '6379', 'Quantity', '1.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:31:21.960188', 'y'),
('623c9994ea014', 'Prop 2M', 'NA', 'NA', 'NA', '1993', 'Quantity', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', '2022-03-24 16:17:24.958531', 'y'),
('626f8e1368ed8', '4T SERVO', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '305', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 07:53:55.429838', 'y'),
('626fdf7d6d874', 'ADON-D 40 ML', 'NA', '40 ML', 'ADON', '9999', 'Quantity', '56', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 13:41:17.448679', 'y'),
('626fdfa5c8e29', 'ADON-D 20 ML', 'NA', '20 ML', 'ADON', '9999', 'Quantity', '20', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 13:41:57.822865', 'y'),
('626fdffc65a17', 'ADON-D 10 ML', 'NA', '10 ML', 'ADON', '9999', 'Quantity', '15', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 13:43:24.416327', 'y'),
('626fe082489a1', 'ADON-P 5 ML', 'NA', '5 ML', 'ADON', '9999', 'Quantity', '5', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 13:45:38.297429', 'y'),
('626fe0b0bea1e', 'ADON-P 20 ML', 'NA', '20 ML', 'ADON', '9999', 'Quantity', '40', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 13:46:24.780883', 'y'),
('626fe104e507d', 'ADON-P 100 ML', 'NA', '100 ML', 'ADON', '9999', 'Quantity', '175', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 13:47:48.938170', 'y'),
('626fefcd7cb84', '4T SERVO', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '305', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:50:53.510904', 'y'),
('626fefed37f01', '4T SERVO 20 W', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '354', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:51:25.229181', 'y'),
('626ff011020a7', '4T SERVO 40 W', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '354', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:52:01.008394', 'y'),
('626ff02466e8b', '4T SERVO 20W/40 W', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '354', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:52:20.421561', 'y'),
('626ff04ea7bec', 'SCOOTOMATIC', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '280', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:53:02.687137', 'y'),
('626ff0770b941', '4T SERVO HONDA JOSH', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '310', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:53:43.047462', 'y'),
('626ff1122a616', 'MULTY', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '134', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:56:18.173642', 'y'),
('626ff13150867', 'MULTY 20W', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '134', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:56:49.329897', 'y'),
('626ff147bd244', 'MULTY 40W', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '119', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:57:11.774780', 'y'),
('626ff18a93ff3', '2T OIL SUPREME', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '147', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:58:18.606232', 'y'),
('626ff1a65273a', 'SERVO GEAR OIL HP 90', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '248', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:58:46.337770', 'y'),
('626ff1cee1e78', 'TRANSFUID SRTING OIL', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '252', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:59:26.925345', 'y'),
('626ff1ed7b42f', 'FUTURAG', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '1655', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 14:59:57.504917', 'y'),
('626ff243f4055', 'KOOL PLUS', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '275', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:01:23.999545', 'y'),
('626ff2947f08b', 'BREAK OIL', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '94', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:02:44.520370', 'y'),
('626ff2ae92e52', 'PRIME', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '264', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:03:10.601720', 'y'),
('626ff2bd862fc', 'PRIME 15W', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '264', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:03:25.549674', 'y'),
('626ff2d05159c', 'PRIME 40W', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '264', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:03:44.333256', 'y'),
('626ff2ed3ae73', '4T SYNTHTIC', 'NA', 'NA', 'PACKET OIL', '9999', 'Quantity', '422', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:04:13.241305', 'y'),
('626ff3947d25a', 'BARREL OIL', 'NA', 'NA', 'BARREL OIL', '9999', 'Quantity', '280', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:07:00.512646', 'y'),
('626ff3da755c6', 'DISTELLED WATER', 'NA', 'NA', 'DISTELLED WATER', '9999', 'Quantity', '25', 'admin@bpl.com', 'BPL 6262789e59e5f', '2022-05-02 15:08:10.480754', 'y'),
('62776908a68d5', 'Silver sheet', 'NA', 'NA', '', '800', 'Quantity', '140', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-05-08 06:54:00.682362', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `product_pricing`
--

CREATE TABLE `product_pricing` (
  `product_pricing_id` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_detail` varchar(50) NOT NULL DEFAULT 'NA',
  `product_model` varchar(50) NOT NULL DEFAULT 'NA',
  `product_type` varchar(50) NOT NULL DEFAULT 'NA',
  `quantity` varchar(50) NOT NULL,
  `calculation_unit` varchar(50) NOT NULL DEFAULT 'Quantity',
  `current_rate` varchar(50) NOT NULL,
  `purchase_price` varchar(50) NOT NULL DEFAULT 'NA',
  `mrp` varchar(50) NOT NULL DEFAULT 'NA',
  `created_by` varchar(50) NOT NULL,
  `created_user_company_id` varchar(50) NOT NULL,
  `created_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `status` varchar(50) NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_pricing`
--

INSERT INTO `product_pricing` (`product_pricing_id`, `product_name`, `product_detail`, `product_model`, `product_type`, `quantity`, `calculation_unit`, `current_rate`, `purchase_price`, `mrp`, `created_by`, `created_user_company_id`, `created_date_time`, `status`) VALUES
('62776908a68d5', 'Silver sheet', 'NA', 'NA', '', '800', 'Quantity', '140', 'NA', 'NA', 'john@gmail.com', 'Apex61f950ea98cc7', '2022-05-08 06:54:00.682801', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `register_admin`
--

CREATE TABLE `register_admin` (
  `admin_id` int(11) NOT NULL,
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
  `tr_bill_inbound_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
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
  `tr_updated_date_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `tr_status` varchar(50) NOT NULL DEFAULT 'a'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`tr_id`, `tr_customer_id`, `tr_product_id`, `tr_product_quantity`, `tr_price`, `tr_updated_by`, `tr_user_company_id`, `tr_type`, `tr_updated_date_time`, `tr_status`) VALUES
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.069283', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.068452', 'i'),
('6257f30131ab7', 'Mr. 6235fd904a0b6', '623f67581e6d2', '23', '92', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:10:15.583904', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.961319', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.960766', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.960334', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.959902', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.959363', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.958877', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.958452', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.957983', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.957562', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.957006', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.956611', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.956227', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.955824', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.955291', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.954858', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.954378', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 10:09:39.953520', 'i'),
('62550783b8e6e', 'Er T62360a19b94cb', '', '25', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-25 10:32:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9994ea014', '10', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-25 10:32:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9daf0334f', '0', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2021-10-25 10:32:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9994ea014', '25', '56.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:29:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623c9daf0334f', '70', '105', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:29:00.000000', 'a'),
('62550783b8e6e', 'Er T62360a19b94cb', '623ca05a102e3', '10', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:29:00.000000', 'a'),
('625503455ea4e', 'Mr. 6235fd904a0b6', '623f67330e7af', '23', '115', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-12 04:42:57.335669', 'i'),
('625503455ea4e', 'Mr. 6235fd904a0b6', '623f67581e6d2', '12', '48', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-12 04:42:57.334156', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '0', '0', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 15:46:52.442118', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '0', '0', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 15:46:52.441329', 'i'),
('624dadd642dfd', 'Mr. 6235ffbd26ce4', '', '9', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 15:12:27.672369', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '2', '8', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 14:47:59.281747', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '3', '6.75', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-06 14:47:59.280915', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.735349', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.734968', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.734601', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.734162', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.733771', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.733332', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-30 07:36:30.732567', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-29 15:58:09.633327', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-29 15:58:09.632370', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '', '50', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '', '8', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'a'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'i'),
('623ca6bbe5767', 'Er. 62388d4914550', '623c9994ea014', '100', '225', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-25 01:01:00.000000', 'a'),
('623ca669110bc', 'Er. 62388d4914550', '623c9daf0334f', '100', '150', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-09 01:01:00.000000', 'a'),
('623ca669110bc', 'Er. 62388d4914550', '623ca05a102e3', '30', '120', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-09 01:01:00.000000', 'a'),
('623ca49bdcf07', 'Er. 62388d4914550', '623c9994ea014', '150', '337.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-07 10:10:00.000000', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'i'),
('623ca28d5651a', 'Er. 62388d4914550', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-10-01 10:10:00.000000', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-01 10:10:00.000000', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-01-20 10:10:00.000000', 'i'),
('623ca1798e320', 'Er. 62388d4914550', '623c9daf0334f', '300', '450', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-09-20 10:20:00.000000', 'a'),
('623c9a338519b', 'Er. 62360ac559c27', '623c9994ea014', '77', '173.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2021-08-11 21:49:00.000000', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.069753', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.070565', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.070955', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.071467', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.071941', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.072396', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.072757', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.073338', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.073826', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.074250', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.074631', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.075036', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.075503', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.075883', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:13.076290', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.151275', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.151973', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.152392', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.152827', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.153226', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.153724', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.154108', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.154513', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.154938', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.155349', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.155739', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.156145', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.156513', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.157329', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.157746', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.158145', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 11:37:30.158552', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.446323', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.447241', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.447703', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.448126', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.448645', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.449049', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.449424', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.449838', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.450487', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.450853', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.451282', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.451653', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.452171', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.452558', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.452932', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.453314', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 12:54:50.453726', 'i'),
('62581af148b64', 'Mr. 623600a088246', '623c9994ea014', '29', '65.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-14 13:00:43.841820', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.311036', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.311873', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.312309', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.312761', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.313163', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.313576', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.313981', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.314370', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.314864', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.315293', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.315853', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.316390', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.316888', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.317280', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.317821', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.318371', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-15 09:59:08.318875', 'i'),
('625d8ec446d9d', ' Mr.623605bb15451', '623f67581e6d2', '19', '76', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-18 16:16:06.470444', 'i'),
('625d8ec446d9d', ' Mr.623605bb15451', '623f67581e6d2', '19', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-18 16:16:40.508071', 'a'),
('625d8f277e0ff', 'v. p6235ff1ab92ee', '623f67581e6d2', '18', '72', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-18 21:47:00.000000', 'i'),
('62614f55410d5', 'Mr. 623600a088246', '623c9994ea014', '1000', '2250', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 12:34:31.426023', 'i'),
('62614f738fb02', 'Mr. 6236005687472', '623c9994ea014', '2000', '4500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 12:35:04.098911', 'i'),
('626150e8dc16e', 'Mr. 6236045987a6c', '623c9cd9ea695', '3610', '4512.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 12:41:15.327156', 'i'),
('6261920598052', 'Mr. 623603f6bcd69', '623f67581e6d2', '901', '3604', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:19:06.252649', 'i'),
('6261920598052', 'Mr. 623603f6bcd69', '623f67330e7af', '937', '4685', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:19:06.253526', 'i'),
('62619280836b9', 'mr. 623606b142b69', '623f67581e6d2', '1000', '4000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:21:06.486374', 'i'),
('62619280836b9', 'mr. 623606b142b69', '623f67581e6d2', '1000', '4000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:21:06.730543', 'i'),
('6261934748c44', 'Mr. 623600215a86c', '623c9994ea014', '356', '801', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-21 17:24:35.648382', 'i'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '52', '208', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-22 21:25:19.031787', 'i'),
('626326d7550f6', 'Mr. 623609223c1e0', '623f67581e6d2', '25', '100', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-22 22:06:23.674762', 'i'),
('626326d7550f6', 'Mr. 623609223c1e0', '623f67330e7af', '35', '175', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-22 22:06:23.675507', 'i'),
('626327798743e', 'Mr. 623603f6bcd69', '623c9994ea014', '3000', '6750', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-20 03:08:00.000000', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', 'NA', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-22 22:28:10.963860', 'a'),
('62632dc0b4140', 'Walk6262cb100bdef', '6262a5cc080b3', '400', '132800', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-22 22:35:47.652814', 'a'),
('62659f8e6e972', 'Mr. 623608dc6fb7e', '623f67581e6d2', '940', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-25 00:37:00.000000', 'i'),
('62659f8e6e972', 'Mr. 623608dc6fb7e', '623f67330e7af', '8973', '5.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-25 00:37:00.000000', 'i'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '0', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.226597', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '50', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.227825', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '', '40', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.228890', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '0', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.463686', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '50', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.464986', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '', '40', '', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'i', '2022-04-24 19:08:33.465975', 'a'),
('6265a2f158e43', 'Mr. 62360c96baa69', '623c9994ea014', '50', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-24 19:20:23.466093', 'i'),
('6265a33d54223', 'Mr. 62360c96baa69', '623c9994ea014', '1000', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-03-26 04:55:00.000000', 'i'),
('6265a618b1655', 'Walk6262cb100bdef', '6265a5f86ef17', '1000', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-24 19:33:46.841100', 'a'),
('6268165cc0dfa', 'Walk6262cb100bdef', '6265a5f86ef17', '1', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-26 15:57:19.274412', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623f67581e6d2', '1', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-26 16:02:25.530581', 'i'),
('6268178e5b1d0', 'test626792c7242cd', '623f67330e7af', '0', '5.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-26 16:02:25.531366', 'i'),
('6268178e5b1d0', 'test626792c7242cd', '623ca05a102e3', '3', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-26 16:02:25.532015', 'i'),
('6268178e5b1d0', 'test626792c7242cd', '623c9daf0334f', '4', '1.50', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-26 16:02:25.532470', 'i'),
('6268178e5b1d0', 'test626792c7242cd', '623c9d0cabcc0', '5', '1.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-26 16:02:25.532907', 'i'),
('6268178e5b1d0', 'test626792c7242cd', '623c9cd9ea695', '6', '1.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-26 16:02:25.533383', 'i'),
('6268178e5b1d0', 'test626792c7242cd', '623c9994ea014', '7', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-04-26 16:02:25.533778', 'i'),
('62683dafabdc8', 'Walk6262cb100bdef', '6265a5f86ef17', '12', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-26 18:45:06.097881', 'a'),
('626e2959d3021', 'Walk6262cb100bdef', '6265a5f86ef17', '90', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 06:31:57.491639', 'a'),
('626e2959d3021', 'Walk6262cb100bdef', '62632eda55de4', '90', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 06:31:57.492438', 'a'),
('626e2959d3021', 'Walk6262cb100bdef', '62632ece61402', '09', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 06:31:57.492936', 'a'),
('626e2959d3021', 'Walk6262cb100bdef', '62632e6e1eb9c', '09', '25', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 06:31:57.493373', 'a'),
('626e2959d3021', 'Walk6262cb100bdef', '6262a5cc080b3', '09', '332', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 06:31:57.493750', 'a'),
('626e2959d3021', 'Walk6262cb100bdef', '6262a592c481b', '90', '343', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 06:31:57.494158', 'a'),
('626ed65049971', 'Walk6262cb100bdef', '6265a5f86ef17', '2', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 18:49:55.123940', 'a'),
('626ed6ab8c16b', 'Walk6262cb100bdef', '6265a5f86ef17', '1', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 18:51:27.089983', 'a'),
('626ed70c3e36a', 'Walk6262cb100bdef', '62632e6e1eb9c', '10', '25', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 18:53:05.420827', 'a'),
('626ee253006fe', 'Walk6262cb100bdef', '6262a592c481b', '1', '343', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 19:41:09.560275', 'a'),
('626ee279bc27c', 'Walk6262cb100bdef', '6262a592c481b', '9', '343', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-01 19:41:48.009854', 'a'),
('626f67e98ddd2', 'Walk6262cb100bdef', '6265a5f86ef17', '1', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-30 10:40:00.000000', 'a'),
('626f67e98ddd2', 'Walk6262cb100bdef', '62632eda55de4', '2', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-30 10:40:00.000000', 'a'),
('626f67e98ddd2', 'Walk6262cb100bdef', '62632ece61402', '3', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-30 10:40:00.000000', 'a'),
('626f67e98ddd2', 'Walk6262cb100bdef', '62632ece24d54', '4', '160', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-30 10:40:00.000000', 'a'),
('626f67e98ddd2', 'Walk6262cb100bdef', '62632e6e1eb9c', '5', '25', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-30 10:40:00.000000', 'a'),
('626f67e98ddd2', 'Walk6262cb100bdef', '6262a5cc080b3', '6', '332', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-30 10:40:00.000000', 'a'),
('626f67e98ddd2', 'Walk6262cb100bdef', '6262a592c481b', '7', '343', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-04-30 10:40:00.000000', 'a'),
('626f73e29397a', 'Walk6262cb100bdef', '6265a5f86ef17', '7', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 06:02:14.058429', 'a'),
('626f73e29397a', 'Walk6262cb100bdef', '62632eda55de4', '6', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 06:02:14.059259', 'a'),
('626f73e29397a', 'Walk6262cb100bdef', '62632ece61402', '5', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 06:02:14.059725', 'a'),
('626f73e29397a', 'Walk6262cb100bdef', '62632ece24d54', '4', '160', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 06:02:14.060123', 'a'),
('626f73e29397a', 'Walk6262cb100bdef', '62632e6e1eb9c', '3', '25', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 06:02:14.060571', 'a'),
('626f73e29397a', 'Walk6262cb100bdef', '6262a5cc080b3', '2', '332', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 06:02:14.061136', 'a'),
('626f73e29397a', 'Walk6262cb100bdef', '6262a592c481b', '1', '343', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 06:02:14.061578', 'a'),
('626f846c6cc10', 'Walk6262cb100bdef', '62632eda55de4', '10', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:12:49.264862', 'a'),
('626f846c6cc10', 'Walk6262cb100bdef', '62632ece61402', '20', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:12:49.265901', 'a'),
('626f846c6cc10', 'Walk6262cb100bdef', '62632ece24d54', '30', '160', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:12:49.266791', 'a'),
('626f846c6cc10', 'Walk6262cb100bdef', '62632eda55de4', '10', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:12:52.910576', 'a'),
('626f846c6cc10', 'Walk6262cb100bdef', '62632ece61402', '20', '350', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:12:52.911639', 'a'),
('626f846c6cc10', 'Walk6262cb100bdef', '62632ece24d54', '30', '160', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:12:52.912144', 'a'),
('626f88a0a5d17', 'Walk6262cb100bdef', '62632eda55de4', '200', '150', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:30:47.430022', 'a'),
('626f88a0a5d17', 'Walk6262cb100bdef', '62632ece24d54', '200', '160', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 07:30:47.430860', 'a'),
('626f8becc9dd6', 'Test626792a057b9e', '623f67581e6d2', '5', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:44:47.034392', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.957223', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.959519', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.961716', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.963893', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.966215', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.971373', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.973380', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.975277', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.977269', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.978917', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.980569', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.982201', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.984004', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.985560', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.987103', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.989356', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.991154', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.992908', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.994744', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.996449', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.998037', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:17.999602', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.001386', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.002969', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.004524', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.006141', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.010766', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.012388', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.013915', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.015657', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.017399', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.019056', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.021270', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.023201', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.024939', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.026635', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.028272', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.030209', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.032134', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.033876', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.035671', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.037341', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.039098', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.040851', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.042636', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.044385', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.046199', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.047976', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.049839', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.051590', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.053269', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.055118', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.056867', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.058549', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.060290', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.062194', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.063963', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.065707', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.067431', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.069609', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.071441', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.073216', 'i'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.075191', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '3', '6.75', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.077008', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '2', '8', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.078782', 'a'),
('625503455ea4e', 'Mr. 6235fd904a0b6', '623f67581e6d2', '12', '48', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.080524', 'a'),
('625503455ea4e', 'Mr. 6235fd904a0b6', '623f67330e7af', '23', '115', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.082348', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.084169', 'i'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.085984', 'i'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.087797', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9cd9ea695', '5', '6.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.089635', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9d0cabcc0', '4', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.091360', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9daf0334f', '4', '6', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.093147', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623ca05a102e3', '3', '12', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.094999', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67330e7af', '2', '10', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.096849', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.098620', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67330e7af', '8', '40', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.100447', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623f67581e6d2', '1', '4', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.102414', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.104150', 'a'),
('623f6a23596f2', 'Mr. 6235fd904a0b6', '623f67581e6d2', '17', '68', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.105917', 'a'),
('6257f30131ab7', 'Mr. 6235fd904a0b6', '623f67581e6d2', '23', '92', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.107616', 'a'),
('624408666b568', 'Mr. 6235fd904a0b6', '623c9994ea014', '6', '13.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.109506', 'a'),
('623f6a2367ed5', 'Mr. 6235fd904a0b6', '623c9994ea014', '50', '112.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.111236', 'a'),
('625d8f277e0ff', 'v. p6235ff1ab92ee', '623f67581e6d2', '18', '72', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.112896', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.114751', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.116546', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.118437', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.120225', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.121958', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.123690', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.125604', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.127319', 'i'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.129101', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.131000', 'i'),
('623f6aad32b95', 'v. p6235ff1ab92ee', '623c9994ea014', '17', '38.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.132804', 'a'),
('623f697a8c8fc', 'v. p6235ff1ab92ee', '623c9daf0334f', '140', '210', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.134589', 'a'),
('6261934748c44', 'Mr. 623600215a86c', '623c9994ea014', '356', '801', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.136325', 'a'),
('62614f738fb02', 'Mr. 6236005687472', '623c9994ea014', '2000', '4500', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.138183', 'a'),
('62614f55410d5', 'Mr. 623600a088246', '623c9994ea014', '1000', '2250', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.139934', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.141819', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.143736', 'i'),
('62581af148b64', 'Mr. 623600a088246', '623c9994ea014', '29', '65.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.145575', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.147630', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.149427', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.151223', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.153106', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.155133', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.157252', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.159205', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.161735', 'i'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '0', '0', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.164343', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '0', '0', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.166850', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67330e7af', '22', '110', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.171561', 'a'),
('62432c8939f43', 'Mr. 623600a088246', '623f67581e6d2', '11', '44', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.173724', 'a'),
('626327798743e', 'Mr. 623603f6bcd69', '623c9994ea014', '3000', '6750', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.175673', 'a'),
('6261920598052', 'Mr. 623603f6bcd69', '623f67330e7af', '937', '4685', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.177645', 'a'),
('6261920598052', 'Mr. 623603f6bcd69', '623f67581e6d2', '901', '3604', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.179554', 'a'),
('626150e8dc16e', 'Mr. 6236045987a6c', '623c9cd9ea695', '3610', '4512.5', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.181623', 'a'),
('625d8ec446d9d', ' Mr.623605bb15451', '623f67581e6d2', '19', '76', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.183463', 'a'),
('62619280836b9', 'mr. 623606b142b69', '623f67581e6d2', '1000', '4000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.185352', 'i'),
('62619280836b9', 'mr. 623606b142b69', '623f67581e6d2', '1000', '4000', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.187420', 'a'),
('62659f8e6e972', 'Mr. 623608dc6fb7e', '623f67330e7af', '8973', '5.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.189339', 'a'),
('62659f8e6e972', 'Mr. 623608dc6fb7e', '623f67581e6d2', '940', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.191214', 'a'),
('62631d25a9a77', 'Mr. 623608dc6fb7e', '623f67581e6d2', '52', '208', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.193110', 'a'),
('626326d7550f6', 'Mr. 623609223c1e0', '623f67330e7af', '35', '175', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.195090', 'a'),
('626326d7550f6', 'Mr. 623609223c1e0', '623f67581e6d2', '25', '100', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.196981', 'a'),
('6265a33d54223', 'Mr. 62360c96baa69', '623c9994ea014', '1000', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.198818', 'a'),
('6265a2f158e43', 'Mr. 62360c96baa69', '623c9994ea014', '50', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.200706', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623c9994ea014', '7', '2.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.202605', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623c9cd9ea695', '6', '1.25', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.204564', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623c9d0cabcc0', '5', '1.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.206597', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623c9daf0334f', '4', '1.50', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.208714', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623ca05a102e3', '3', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.210601', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623f67330e7af', '0', '5.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.212503', 'a'),
('6268178e5b1d0', 'test626792c7242cd', '623f67581e6d2', '1', '4.00', 'suresh@gmail.com', 'Civi6235fbcb1d77f', 'o', '2022-05-02 07:48:18.214532', 'a'),
('626f9906963a5', 'Walk6262cb100bdef', '6265a5f86ef17', '890', '2000', 'admin@bpl.com', 'BPL 6262789e59e5f', 'o', '2022-05-02 08:40:40.812858', 'a');

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
('6235fbebc1447', 'Suresh', 'suresh@gmail.com', 'suresh', 'Civi6235fbcb1d77f', 'Manager', 'Admin', 'xavier@gmail.com', '2022-03-19 15:51:07.791773'),
('626278d9aae26', 'admin', 'admin@bpl.com', 'admin@123#', 'BPL 6262789e59e5f', 'Employee', 'Admin', 'andrews@BPL.com', '2022-04-22 09:43:53.699985');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_pricing`
--
ALTER TABLE `product_pricing`
  ADD PRIMARY KEY (`product_pricing_id`);

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
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
