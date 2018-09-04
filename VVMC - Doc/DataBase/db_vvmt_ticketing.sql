-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 27, 2018 at 05:26 PM
-- Server version: 5.5.60-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_vvmt_ticketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `daily_list`
--

CREATE TABLE IF NOT EXISTS `daily_list` (
  `fldi_conductor_id` int(10) DEFAULT NULL,
  `fldv_etm_number` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `fldi_trip_no` int(10) DEFAULT NULL,
  `fldi_route_no` int(10) DEFAULT NULL,
  `flddt_ticket_date` date DEFAULT NULL,
  `count(*)` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newtable`
--

CREATE TABLE IF NOT EXISTS `newtable` (
  `fldv_conductor_employee_code` varchar(100) CHARACTER SET utf8 NOT NULL,
  `flddt_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `routeno`
--

CREATE TABLE IF NOT EXISTS `routeno` (
  `routeno` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rpstagedetails`
--

CREATE TABLE IF NOT EXISTS `rpstagedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rpsd_routeno` int(100) NOT NULL DEFAULT '0',
  `rp_bustype` varchar(100) NOT NULL DEFAULT '',
  `rpsd_triangleno` varchar(100) NOT NULL DEFAULT '',
  `rpsd_stgcode` varchar(100) NOT NULL DEFAULT '',
  `rpsd_stgnamee` varchar(100) NOT NULL DEFAULT '',
  `rpsd_stgnamem` varchar(100) NOT NULL DEFAULT '',
  `rpsd_km` varchar(100) NOT NULL DEFAULT '',
  `rpsd_stgno` varchar(100) NOT NULL DEFAULT '',
  `rpsd_sub` varchar(100) NOT NULL DEFAULT '',
  `rpsd_intrsstg` varchar(100) NOT NULL DEFAULT '',
  `rpsd_farenormal` double(10,2) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(10) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_allocate_type_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_allocate_type_mst` (
  `fldi_allocate_type_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_allocate_type_name` varchar(50) DEFAULT NULL,
  `fldi_user_id` bigint(60) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_allocate_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus_route_details`
--

CREATE TABLE IF NOT EXISTS `tbl_bus_route_details` (
  `fldv_id` int(10) NOT NULL AUTO_INCREMENT,
  `fldv_busstand_id` int(10) NOT NULL,
  `fldv_route_id` int(5) NOT NULL,
  `fldv_from_stage` varchar(200) NOT NULL,
  `fldv_to_stage` varchar(200) NOT NULL,
  `fldv_from_time_hr` varchar(10) NOT NULL,
  `fldv_from_time_min` varchar(10) NOT NULL,
  `fldv_to_time_hr` varchar(10) NOT NULL,
  `fldv_to_time_min` varchar(10) NOT NULL,
  `fldv_bus_name` varchar(10) NOT NULL,
  `flddt_date_time` datetime NOT NULL,
  `fldt_date` date NOT NULL,
  `fldv_ip` varchar(25) NOT NULL,
  `fldi_updated_flag` char(1) NOT NULL DEFAULT 'N',
  `fldi_cancel_flag` char(1) NOT NULL,
  `fldv_remarks` varchar(200) NOT NULL,
  `flddt_last_date_time` datetime NOT NULL,
  `fldi_duty_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fldv_id`,`fldv_busstand_id`,`fldv_route_id`,`fldv_bus_name`,`flddt_date_time`),
  KEY `Status` (`fldi_updated_flag`),
  KEY `Duty` (`fldi_duty_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=125614 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus_route_details_bkp`
--

CREATE TABLE IF NOT EXISTS `tbl_bus_route_details_bkp` (
  `fldv_id` int(10) NOT NULL AUTO_INCREMENT,
  `fldv_busstand_id` int(10) NOT NULL,
  `fldv_route_id` int(5) NOT NULL,
  `fldv_bus_name` varchar(10) NOT NULL,
  `flddt_date_time` datetime NOT NULL,
  `fldv_ip` varchar(25) NOT NULL,
  `fldi_updated_flag` char(1) NOT NULL DEFAULT 'N',
  `flddt_last_date_time` datetime NOT NULL,
  PRIMARY KEY (`fldv_id`,`fldv_busstand_id`,`fldv_route_id`,`fldv_bus_name`,`flddt_date_time`),
  KEY `Status` (`fldi_updated_flag`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=119951 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus_route_details_copy`
--

CREATE TABLE IF NOT EXISTS `tbl_bus_route_details_copy` (
  `fldv_id` int(10) NOT NULL AUTO_INCREMENT,
  `fldv_busstand_id` int(10) NOT NULL,
  `fldv_route_id` int(5) NOT NULL,
  `fldv_from_stage` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `fldv_to_stage` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) CHARACTER SET ucs2 DEFAULT NULL,
  `fldv_from_time_min` varchar(10) CHARACTER SET ucs2 DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `fldv_to_time_min` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `fldc_status` char(1) CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `fldv_bus_name` varchar(10) NOT NULL,
  `flddt_date_time` datetime NOT NULL,
  `fldv_ip` varchar(25) NOT NULL,
  `fldt_date` date NOT NULL,
  `fldi_updated_flag` char(1) NOT NULL DEFAULT 'N',
  `fldi_cancel_flag` char(1) NOT NULL DEFAULT 'N',
  `fldv_remarks` varchar(200) DEFAULT NULL,
  `flddt_last_date_time` datetime NOT NULL,
  `fldi_duty_id` bigint(20) NOT NULL,
  PRIMARY KEY (`fldv_id`,`fldv_busstand_id`,`fldv_route_id`,`fldv_bus_name`,`flddt_date_time`),
  KEY `Status` (`fldi_updated_flag`),
  KEY `date` (`fldt_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=116083 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus_type_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_bus_type_mst` (
  `fldi_bus_type_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_bus_type` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_bus_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus_type_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_bus_type_mst_log` (
  `fldi_bus_type_id` int(5) DEFAULT NULL,
  `fldv_bus_type` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cab_depot`
--

CREATE TABLE IF NOT EXISTS `tbl_cab_depot` (
  `fldi_cab_id` int(5) NOT NULL,
  `fldv_cab_name` varchar(50) NOT NULL,
  `fldi_depot_id` int(5) NOT NULL,
  `fldi_user_id` int(4) NOT NULL,
  KEY `fldi_depot_id` (`fldi_depot_id`,`fldi_cab_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cab_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_cab_mst` (
  `fldi_cab_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_cab_name` varchar(50) DEFAULT NULL,
  `fldv_imei_number` varchar(50) DEFAULT NULL,
  `fldv_chassis_no` varchar(100) NOT NULL,
  `fldv_engine_no` varchar(100) NOT NULL,
  `fldv_device_phone` varchar(50) DEFAULT NULL,
  `fldv_latitude` varchar(100) DEFAULT NULL,
  `fldv_longitude` varchar(100) DEFAULT NULL,
  `fldv_prev_latitude` varchar(100) NOT NULL,
  `fldv_prev_longitude` varchar(100) NOT NULL,
  `fldi_city_id` int(10) NOT NULL,
  `fldi_driver_id` int(3) NOT NULL,
  `flddt_device_data_updated` datetime DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_depot_id` int(5) NOT NULL,
  `fldi_user_id` int(4) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_ip_address` varchar(50) NOT NULL,
  `flddt_gmt_date` date NOT NULL,
  `fldv_gmt_time` varchar(100) NOT NULL,
  `fldi_last_stage` int(11) NOT NULL,
  `fldc_gps_avilability` char(1) NOT NULL,
  `fldv_ignition` int(1) NOT NULL,
  `fldv_current_trip_distance` varchar(25) NOT NULL,
  `fldv_gsm_reg` int(10) NOT NULL,
  `fldv_internal_battery` int(10) NOT NULL,
  `fldv_external_battery` int(10) NOT NULL,
  `fldv_speed` int(20) NOT NULL,
  PRIMARY KEY (`fldi_cab_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=569 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cab_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_cab_mst_log` (
  `fldi_cab_id` int(5) DEFAULT NULL,
  `fldv_cab_name` varchar(50) DEFAULT NULL,
  `fldv_imei_number` varchar(50) DEFAULT NULL,
  `fldv_chassis_no` varchar(100) NOT NULL,
  `fldv_engine_no` varchar(100) NOT NULL,
  `fldv_device_phone` varchar(50) DEFAULT NULL,
  `fldv_latitude` varchar(100) DEFAULT NULL,
  `fldv_longitude` varchar(100) DEFAULT NULL,
  `fldi_city_id` int(10) NOT NULL,
  `fldi_driver_id` int(3) NOT NULL,
  `flddt_device_data_updated` datetime DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(4) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cab_type_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_cab_type_mst` (
  `fldi_cab_type_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_cab_type_name` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_cab_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_card_data_log`
--

CREATE TABLE IF NOT EXISTS `tbl_card_data_log` (
  `fldi_transaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldv_name` varchar(200) NOT NULL,
  `flddt_dob` date NOT NULL,
  `fldi_contact_num_mob` varchar(100) NOT NULL,
  `fldi_contact_num_land` varchar(100) NOT NULL,
  `fldv_from_stage` varchar(100) NOT NULL,
  `fldv_to_stage` varchar(100) NOT NULL,
  `fldi_amount` bigint(20) NOT NULL,
  `flddt_valid_upto` datetime NOT NULL,
  `fldv_entered_by` varchar(200) NOT NULL,
  `flddt_entered_date` datetime NOT NULL,
  `fldv_img` varchar(500) NOT NULL,
  `fldv_gender` varchar(10) NOT NULL,
  `fldc_send_to_print` char(1) NOT NULL DEFAULT 'N',
  `flddt_sent_to_printer_date` datetime NOT NULL,
  `fldc_recv_from_print` char(1) NOT NULL DEFAULT 'N',
  `flddt_recv_from_print_date` datetime NOT NULL,
  `fldc_send_to_cust` char(1) NOT NULL DEFAULT 'N',
  `flddt_sent_to_cust_date` datetime NOT NULL,
  `fldi_pass_num` bigint(20) NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  `fldv_address` varchar(500) NOT NULL,
  `fldv_school_name` varchar(200) NOT NULL,
  `fldv_school_address` varchar(500) NOT NULL,
  `fldv_standard` varchar(200) NOT NULL,
  `fldv_sc_period` varchar(500) NOT NULL,
  `fldv_cn_period` varchar(500) NOT NULL,
  `fldv_card_entry_type` varchar(200) NOT NULL,
  `fldv_issuing_centre` varchar(200) NOT NULL,
  PRIMARY KEY (`fldi_transaction_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5635 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_city_mst` (
  `fldi_city_id` int(10) NOT NULL AUTO_INCREMENT,
  `fldv_city_name` varchar(200) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_city_mst_log` (
  `fldi_city_id` int(10) NOT NULL,
  `fldv_city_name` varchar(200) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_combo_duty`
--

CREATE TABLE IF NOT EXISTS `tbl_combo_duty` (
  `fldi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldv_date` date NOT NULL,
  `fldi_duty` int(4) NOT NULL,
  `fldi_combo_id` int(20) NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=148178 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conductor_collection_amount`
--

CREATE TABLE IF NOT EXISTS `tbl_conductor_collection_amount` (
  `fldi_conductor_collection_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldv_driver_name` varchar(100) DEFAULT NULL,
  `fldv_vehicle_number` varchar(25) DEFAULT NULL,
  `fldv_division_name` varchar(100) DEFAULT NULL,
  `fldv_division_code` varchar(5) DEFAULT NULL,
  `fldv_depot_name` varchar(100) DEFAULT NULL,
  `fldv_depot_code` varchar(5) DEFAULT NULL,
  `fldv_schedule` varchar(10) DEFAULT NULL,
  `fldv_etm_number` varchar(5) DEFAULT NULL,
  `flddt_collection_date` datetime DEFAULT NULL,
  `fldv_collection_1000_count` varchar(25) DEFAULT NULL,
  `fldf_collection_1000_amt` double DEFAULT NULL,
  `fldv_collection_500_count` varchar(25) DEFAULT NULL,
  `fldf_collection_500_amt` double DEFAULT NULL,
  `fldv_collection_100_count` varchar(25) DEFAULT NULL,
  `fldf_collection_100_amt` double DEFAULT NULL,
  `fldv_collection_50_count` varchar(25) DEFAULT NULL,
  `fldf_collection_50_amt` double DEFAULT NULL,
  `fldv_collection_20_count` varchar(25) DEFAULT NULL,
  `fldf_collection_20_amt` double DEFAULT NULL,
  `fldv_collection_10_count` varchar(25) DEFAULT NULL,
  `fldf_collection_10_amt` double DEFAULT NULL,
  `fldv_collection_5_count` varchar(25) DEFAULT NULL,
  `fldf_collection_5_amt` double DEFAULT NULL,
  `fldv_collection_2_count` varchar(25) DEFAULT NULL,
  `fldf_collection_2_amt` double DEFAULT NULL,
  `fldv_collection_1_count` varchar(25) DEFAULT NULL,
  `fldf_collection_1_amt` double DEFAULT NULL,
  `fldv_collection_10_ps_count` varchar(25) DEFAULT NULL,
  `fldf_collection_10_ps_amt` double DEFAULT NULL,
  `fldv_collection_5_ps_count` varchar(25) DEFAULT NULL,
  `fldf_collection_5_ps_amt` double DEFAULT NULL,
  `fldv_collection_2_ps_count` varchar(25) DEFAULT NULL,
  `fldf_collection_2_ps_amt` double DEFAULT NULL,
  `fldv_collection_1_ps_count` varchar(25) DEFAULT NULL,
  `fldf_collection_1_ps_amt` double DEFAULT NULL,
  `fldv_collection_5ps_ps_count` varchar(25) DEFAULT NULL,
  `fldf_collection_5ps_ps_amt` double DEFAULT NULL,
  `fldf_collection_total_amt` double DEFAULT NULL,
  `fldv_collection_date` varchar(15) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_amount_difference` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`fldi_conductor_collection_id`),
  KEY `idWaybillNumber` (`fldv_waybill_no`),
  KEY `idx_cashier` (`fldi_user_id`,`flddt_last_upd_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=470934 ;

--
-- Dumping data for table `tbl_conductor_collection_amount`
--

INSERT INTO `tbl_conductor_collection_amount` (`fldi_conductor_collection_id`, `fldv_waybill_no`, `fldv_conductor_name`, `fldv_driver_name`, `fldv_vehicle_number`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `flddt_collection_date`, `fldv_collection_1000_count`, `fldf_collection_1000_amt`, `fldv_collection_500_count`, `fldf_collection_500_amt`, `fldv_collection_100_count`, `fldf_collection_100_amt`, `fldv_collection_50_count`, `fldf_collection_50_amt`, `fldv_collection_20_count`, `fldf_collection_20_amt`, `fldv_collection_10_count`, `fldf_collection_10_amt`, `fldv_collection_5_count`, `fldf_collection_5_amt`, `fldv_collection_2_count`, `fldf_collection_2_amt`, `fldv_collection_1_count`, `fldf_collection_1_amt`, `fldv_collection_10_ps_count`, `fldf_collection_10_ps_amt`, `fldv_collection_5_ps_count`, `fldf_collection_5_ps_amt`, `fldv_collection_2_ps_count`, `fldf_collection_2_ps_amt`, `fldv_collection_1_ps_count`, `fldf_collection_1_ps_amt`, `fldv_collection_5ps_ps_count`, `fldf_collection_5ps_ps_amt`, `fldf_collection_total_amt`, `fldv_collection_date`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`, `fldv_amount_difference`) VALUES
(470926, '0487405', 'Sainath Balaji Gaikwad', 'Sunil Tanaji Gaikwad', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '70  ', '564', '2018-07-19 18:49:49', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '35', 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, '2018/07/19 18:4', 'Y', 39, '0000-00-00 00:00:00', '0'),
(470925, '0487546', 'Ramesh Sarichand Rathod', '', '          ', 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '564', '2018-07-19 18:46:29', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '21', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, '2018/07/19 18:4', 'Y', 83, '0000-00-00 00:00:00', '0'),
(470924, '0487526', 'Shravan Baburao Wagh', 'Rajendra Narayan Khedekar', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '2018-07-19 18:17:52', '', 0, '', 0, '', 0, '1', 50, '', 0, '', 0, '', 0, '', 0, '6', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, '2018/07/19 18:1', 'Y', 28, '0000-00-00 00:00:00', '0'),
(470927, '0487664', 'Sunil Shantaram Ghadi', 'Dipesh Ramchandra Mokashi', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '151 ', '470', '2018-07-19 19:34:45', '1', 1000, '1', 500, '1', 100, '1', 50, '1', 20, '1', 10, '1', 5, '1', 2, '1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1688, '2018/07/19 19:3', 'Y', 19, '0000-00-00 00:00:00', '-1653'),
(470928, '0487664', 'Sunil Shantaram Ghadi', 'Dipesh Ramchandra Mokashi', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '151 ', '564', '2018-07-19 19:40:33', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '14', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, '2018/07/19 19:4', 'Y', 19, '0000-00-00 00:00:00', '0'),
(470929, '0487620', 'Mahadu Manglya Bhoye', 'Ganesh Baburao Vaze', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '2018-07-20 13:53:03', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '18', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, '2018/07/20 13:5', 'Y', 37, '0000-00-00 00:00:00', '10'),
(470930, '0487620', 'Mahadu Manglya Bhoye', 'Ganesh Baburao Vaze', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '2018-07-20 13:55:53', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '28', 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, '2018/07/20 13:5', 'Y', 37, '0000-00-00 00:00:00', '0'),
(470931, '0487620', 'Mahadu Manglya Bhoye', 'Ganesh Baburao Vaze', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '2018-07-20 13:57:20', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '28', 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, '2018/07/20 13:5', 'Y', 37, '0000-00-00 00:00:00', '0'),
(470932, '0487691', 'Suresh Dattaram Rasam', '', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '2018-07-20 14:45:30', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '21', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, '2018/07/20 14:4', 'C', 15, '0000-00-00 00:00:00', '0'),
(470933, '0487526', 'Shravan Baburao Wagh', 'Rajendra Narayan Khedekar', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '2018-07-25 15:12:28', '', 0, '', 0, '', 0, '', 0, '1', 20, '1', 10, '2', 10, '', 0, '2', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, '2018/07/25 15:1', 'Y', 28, '0000-00-00 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conductor_coupon_collection`
--

CREATE TABLE IF NOT EXISTS `tbl_conductor_coupon_collection` (
  `fldi_conductor_id` int(10) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldv_employee_code` varchar(8) NOT NULL,
  `fldi_coupon_id` bigint(60) DEFAULT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldi_coupon_amount` double(10,2) DEFAULT NULL,
  `fldi_coupon_start_number` bigint(60) DEFAULT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldv_total_amount` varchar(50) NOT NULL,
  `fldi_no_of_tickets` int(5) NOT NULL,
  `flddt_date` datetime NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  KEY `idx_coupon_date` (`flddt_last_upd_date`,`fldc_status`),
  KEY `idx_coupon_waybill` (`fldv_waybill_no`,`fldc_status`),
  KEY `Coupon_Collection` (`fldv_employee_code`,`flddt_date`,`fldi_coupon_amount`,`fldi_coupon_start_number`,`fldv_coupon_blok_no`),
  KEY `Status` (`fldc_status`,`flddt_date`,`fldi_no_of_tickets`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conductor_coupon_collection_dummy`
--

CREATE TABLE IF NOT EXISTS `tbl_conductor_coupon_collection_dummy` (
  `fldi_conductor_id` int(10) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldv_employee_code` varchar(100) NOT NULL,
  `fldi_coupon_id` bigint(60) DEFAULT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldi_coupon_amount` double(10,2) DEFAULT NULL,
  `fldi_coupon_start_number` bigint(60) DEFAULT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldv_total_amount` varchar(50) NOT NULL,
  `fldi_no_of_tickets` int(5) NOT NULL,
  `flddt_date` datetime NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  KEY `index` (`fldc_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conductor_coupon_serial_number`
--

CREATE TABLE IF NOT EXISTS `tbl_conductor_coupon_serial_number` (
  `fldi_conductor_id` int(10) NOT NULL,
  `fldv_conductor_name` varchar(100) NOT NULL,
  `fldi_coupon_id` bigint(60) NOT NULL,
  `fldi_coupon_amount` int(3) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conductor_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_conductor_mst` (
  `fldi_conductor_id` int(10) NOT NULL AUTO_INCREMENT,
  `fldv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_mob_no` varchar(20) NOT NULL,
  `fldv_conductor_name` varchar(200) NOT NULL,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldv_division_code` varchar(2) NOT NULL,
  `fldv_depot_name` varchar(100) NOT NULL,
  `fldv_depot_code` varchar(100) NOT NULL,
  `fldv_etim_no` varchar(10) NOT NULL,
  `fldv_cash_bag_no` varchar(100) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_badge_no` varchar(50) NOT NULL,
  `fldv_rto_circle_no` varchar(100) NOT NULL,
  `fldv_tray_no` varchar(100) NOT NULL,
  `fldi_division_id` int(5) NOT NULL,
  `fldi_depot_id` int(5) NOT NULL,
  `fldi_rto_id` bigint(10) NOT NULL,
  `fldm_address1` mediumtext NOT NULL,
  `fldm_address2` mediumtext NOT NULL,
  `fldm_address3` mediumtext NOT NULL,
  `flddt_joining_date` date NOT NULL,
  `fldv_emp_photo` varchar(50) NOT NULL,
  PRIMARY KEY (`fldi_conductor_id`),
  KEY `EmployeeCode` (`fldi_conductor_id`,`fldv_employee_code`,`fldv_conductor_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=990 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conductor_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_conductor_mst_log` (
  `fldi_conductor_id` int(10) NOT NULL,
  `fldv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_mob_no` varchar(20) NOT NULL,
  `fldv_conductor_name` varchar(200) NOT NULL,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldv_division_code` varchar(2) NOT NULL,
  `fldv_depot_name` varchar(100) NOT NULL,
  `fldv_depot_code` varchar(100) NOT NULL,
  `fldv_etim_no` varchar(10) NOT NULL,
  `fldv_cash_bag_no` varchar(100) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_badge_no` varchar(50) NOT NULL,
  `fldv_rto_circle_no` varchar(100) NOT NULL,
  `fldv_tray_no` varchar(100) NOT NULL,
  `fldi_division_id` int(5) NOT NULL,
  `fldi_depot_id` int(5) NOT NULL,
  `fldi_rto_id` bigint(10) NOT NULL,
  `fldm_address1` mediumtext NOT NULL,
  `fldm_address2` mediumtext NOT NULL,
  `fldm_address3` mediumtext NOT NULL,
  `flddt_joining_date` date NOT NULL,
  `fldv_emp_photo` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conversion_data`
--

CREATE TABLE IF NOT EXISTS `tbl_conversion_data` (
  `fldi_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fldv_vehicle_no` varchar(50) NOT NULL,
  `fldv_company` varchar(100) NOT NULL,
  `fldv_route_no` varchar(50) NOT NULL,
  `fldv_device_id` varchar(30) NOT NULL,
  `fldv_latitude` double NOT NULL,
  `fldv_longitude` double NOT NULL,
  `fldv_acc` varchar(30) NOT NULL,
  `flddt_date` date NOT NULL,
  `flddt_time` time NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_vehicle_no` (`fldv_vehicle_no`,`fldv_company`,`fldv_route_no`,`fldv_device_id`,`flddt_date`,`flddt_last_updated`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=178246419 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_allocation_data`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_allocation_data` (
  `fldi_coupon_allocation_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_issue_clerk_allocation_id` bigint(60) NOT NULL,
  `fldi_coupon_id` bigint(60) NOT NULL,
  `fldi_conductor_id` int(10) NOT NULL,
  `fldv_employee_code` varchar(100) NOT NULL,
  `fldv_conductor_name` varchar(100) NOT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldv_coupon_type` varchar(50) NOT NULL,
  `fldi_coupon_amt_id` int(2) NOT NULL,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldi_coupon_next_number` bigint(60) NOT NULL,
  `fldc_coupon_completed` char(1) NOT NULL DEFAULT 'N',
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldv_waybill_no` varchar(20) NOT NULL,
  `flddt_waybill_completed_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_coupon_allocation_id`),
  KEY `idAmount` (`fldi_coupon_amount`),
  KEY `idConductorEmpCode` (`fldv_employee_code`,`fldv_coupon_blok_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41954 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_allocation_data_log`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_allocation_data_log` (
  `fldi_coupon_allocation_id` bigint(60) NOT NULL,
  `fldi_issue_clerk_allocation_id` bigint(60) NOT NULL,
  `fldi_coupon_id` bigint(60) NOT NULL,
  `fldi_conductor_id` int(10) NOT NULL,
  `fldv_employee_code` varchar(100) NOT NULL,
  `fldv_conductor_name` varchar(100) NOT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldv_coupon_type` varchar(50) NOT NULL,
  `fldi_coupon_amt_id` int(2) NOT NULL,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldi_coupon_next_number` bigint(60) NOT NULL,
  `fldc_coupon_completed` char(1) NOT NULL DEFAULT 'N',
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_amount_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_amount_mst` (
  `fldi_coupon_amt_id` int(2) NOT NULL AUTO_INCREMENT,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldm_amount_marathi` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldv_nutrition_tax` varchar(100) NOT NULL,
  PRIMARY KEY (`fldi_coupon_amt_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_amount_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_amount_mst_log` (
  `fldi_coupon_amt_id` int(2) NOT NULL,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldm_amount_marathi` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldv_nutrition_tax` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_issue_clerk`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_issue_clerk` (
  `fldi_coupon_allocation_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_coupon_id` bigint(60) NOT NULL,
  `fldi_issue_user_id` int(5) NOT NULL,
  `fldv_user_name` varchar(100) NOT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldv_coupon_type` varchar(50) NOT NULL,
  `fldi_coupon_amt_id` int(2) NOT NULL,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldi_coupon_next_number` bigint(60) NOT NULL,
  `fldc_coupon_completed` char(1) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_coupon_allocation_id`),
  KEY `idAmount` (`fldi_coupon_amount`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41561 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_issue_clerk_log`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_issue_clerk_log` (
  `fldi_coupon_allocation_id` bigint(60) NOT NULL,
  `fldi_coupon_id` bigint(60) NOT NULL,
  `fldi_issue_user_id` int(5) NOT NULL,
  `fldv_user_name` varchar(100) NOT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldv_coupon_type` varchar(50) NOT NULL,
  `fldi_coupon_amt_id` int(2) NOT NULL,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldi_coupon_next_number` bigint(60) NOT NULL,
  `fldc_coupon_completed` char(1) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_mst` (
  `fldi_coupon_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldv_coupon_block_type` char(1) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldv_coupon_type` varchar(50) NOT NULL,
  `fldi_coupon_bunch_number` int(10) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldc_completed` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldi_coupon_id`),
  KEY `idAmount` (`fldi_coupon_amount`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51090 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_mst_log` (
  `fldi_coupon_id` bigint(60) NOT NULL,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldv_coupon_block_type` char(1) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldv_coupon_type` varchar(50) NOT NULL,
  `fldi_coupon_bunch_number` int(10) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_mst_old`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_mst_old` (
  `fldi_coupon_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_coupon_amount` double(10,2) NOT NULL,
  `fldv_coupon_blok_no` varchar(10) NOT NULL,
  `fldv_coupon_block_type` char(1) NOT NULL,
  `fldi_coupon_start_number` bigint(60) NOT NULL,
  `fldi_coupon_end_number` bigint(60) NOT NULL,
  `fldv_coupon_type` varchar(50) NOT NULL,
  `fldi_coupon_bunch_number` int(10) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldc_completed` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldi_coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21141 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_multi_block_log`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_multi_block_log` (
  `fldi_coupon_amount` double(10,2) DEFAULT NULL,
  `fldv_coupon_blok_no` varchar(10) DEFAULT NULL,
  `fldv_series_start_no` varchar(10) DEFAULT NULL,
  `fldi_no_of_blocks` int(3) DEFAULT NULL,
  `fldv_coupon_type` varchar(50) DEFAULT NULL,
  `fldi_coupon_bunch_number` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon_type_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_coupon_type_mst` (
  `fldi_coupon_type_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_coupon_type_name` varchar(50) DEFAULT NULL,
  `fldv_coupon_type_char` varchar(50) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_coupon_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_department_mst` (
  `fldi_department_id` int(2) NOT NULL AUTO_INCREMENT,
  `fldv_department_text` varchar(100) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(4) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_depot_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_depot_mst` (
  `fldi_depot_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_depot_name` varchar(100) DEFAULT NULL,
  `fldv_depot_code` varchar(20) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_depot_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_device_camera_data`
--

CREATE TABLE IF NOT EXISTS `tbl_device_camera_data` (
  `fldv_imei_no` varchar(25) NOT NULL,
  `fldv_image_name` varchar(200) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(4) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_device_collection_data`
--

CREATE TABLE IF NOT EXISTS `tbl_device_collection_data` (
  `fldv_collection_data` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_division_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_division_mst` (
  `fldi_division_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldv_division_code` varchar(20) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_division_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_address_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_address_details` (
  `fldi_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(20) NOT NULL,
  `fldv_perm_build_name` varchar(100) NOT NULL,
  `fldv_perm_street_name` varchar(100) NOT NULL,
  `fldv_perm_area_name` varchar(100) NOT NULL,
  `fldv_perm_landmark` varchar(100) NOT NULL,
  `fldv_perm_city` varchar(50) NOT NULL,
  `fldv_perm_pc` varchar(10) NOT NULL,
  `fldv_pres_build_name` varchar(100) NOT NULL,
  `fldv_pres_area_name` varchar(100) NOT NULL,
  `fldv_pres_street_name` varchar(100) NOT NULL,
  `fldv_pres_landmark` varchar(100) NOT NULL,
  `fldv_pres_city` varchar(50) NOT NULL,
  `fldv_pres_pc` varchar(10) NOT NULL,
  `fldv_nom_build_name` varchar(100) NOT NULL,
  `fldv_nom_street_name` varchar(100) NOT NULL,
  `fldv_nom_area_name` varchar(100) NOT NULL,
  `fldv_nom_landmark` varchar(100) NOT NULL,
  `fldv_nom_city` varchar(50) NOT NULL,
  `fldv_nom_pc` varchar(10) NOT NULL,
  `fldv_nat_build_name` varchar(100) NOT NULL,
  `fldv_nat_street_name` varchar(100) NOT NULL,
  `fldv_nat_area_name` varchar(100) NOT NULL,
  `fldv_nat_landmark` varchar(100) NOT NULL,
  `fldv_nat_city` varchar(50) NOT NULL,
  `fldv_nat_pc` varchar(10) NOT NULL,
  `fldv_ref1_build_name` varchar(100) NOT NULL,
  `fldv_ref1_street_name` varchar(100) NOT NULL,
  `fldv_ref1_area_name` varchar(100) NOT NULL,
  `fldv_ref1_landmark` varchar(100) NOT NULL,
  `fldv_ref1_city` varchar(50) NOT NULL,
  `fldv_ref1_pc` varchar(10) NOT NULL,
  `fldv_ref2_build_name` varchar(100) NOT NULL,
  `fldv_ref2_street_name` varchar(100) NOT NULL,
  `fldv_ref2_area_name` varchar(100) NOT NULL,
  `fldv_ref2_landmark` varchar(100) NOT NULL,
  `fldv_ref2_city` varchar(50) NOT NULL,
  `fldv_ref2_pc` varchar(10) NOT NULL,
  `fldv_dl_no` varchar(30) NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=238 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_conductor_combo`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_conductor_combo` (
  `fldi_id` int(20) NOT NULL AUTO_INCREMENT,
  `fldi_conductor` int(11) NOT NULL,
  `fldi_driver` int(11) NOT NULL,
  `flddt_start_date` date NOT NULL,
  `flddt_end_date` date NOT NULL,
  `fldc_active` char(1) NOT NULL DEFAULT 'Y',
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4195 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_details` (
  `fldi_driver_id` int(10) NOT NULL AUTO_INCREMENT,
  `fldv_driver_name` varchar(100) NOT NULL,
  `fldv_driver_rfid_code` varchar(25) NOT NULL,
  `fldi_vendor_id` int(30) NOT NULL,
  `fldv_driver_mob` varchar(15) NOT NULL,
  `fldv_driver_temp_mob` varchar(15) NOT NULL,
  `fldm_driver_present_address` mediumtext NOT NULL,
  `fldv_driver_present_address_city` varchar(50) NOT NULL,
  `fldv_driver_present_address_pincode` varchar(20) NOT NULL,
  `fldm_driver_permanent_address` mediumtext NOT NULL,
  `fldv_driver_permanent_address_city` varchar(50) NOT NULL,
  `fldv_driver_permanent_address_pincode` varchar(20) NOT NULL,
  `fldv_driver_license_no` varchar(100) NOT NULL,
  `fldv_badge_no` varchar(30) NOT NULL,
  `fldv_application_no` varchar(30) NOT NULL,
  `fldv_cab_number` varchar(25) NOT NULL,
  `fldv_cab_type_name` varchar(100) NOT NULL,
  `fldi_ref_driver_id` int(10) NOT NULL,
  `fldv_ref_other` varchar(30) NOT NULL,
  `fldc_driver_address_verification_status` char(1) NOT NULL,
  `fldv_driver_ref_code` varchar(100) NOT NULL,
  `fldc_agreement_status` varchar(1) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(4) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldv_password` varchar(50) NOT NULL,
  `fldv_profile_picture` varchar(500) NOT NULL,
  `fldv_employee_ID` varchar(100) NOT NULL,
  `fldc_driver_conductor_flag` char(1) NOT NULL,
  `fldi_experience` int(2) NOT NULL,
  `flddt_date_of_joining` date NOT NULL,
  `flddt_date_of_leaving` date NOT NULL,
  `flddt_date_of_rejoin` date NOT NULL,
  `fldv_name_of_rejoin_approval_auth` date NOT NULL,
  `fldv_remark` varchar(200) NOT NULL,
  PRIMARY KEY (`fldi_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_domicile_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_domicile_details` (
  `fldi_id` int(15) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(20) NOT NULL,
  `flddt_domicile_date` date NOT NULL,
  `fldv_cert_no` varchar(30) NOT NULL,
  `fldv_tehsildar_office` varchar(100) NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_finance_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_finance_details` (
  `fldi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(30) NOT NULL,
  `fldv_booking_type` varchar(50) NOT NULL,
  `fldv_investor_type` varchar(30) NOT NULL,
  `fldv_permit_no` varchar(30) NOT NULL,
  `fldv_car_no` varchar(30) NOT NULL,
  `flddt_perm_agree_from` date NOT NULL,
  `flddt_perm_agree_to` date NOT NULL,
  `fldv_individual_amount` varchar(20) NOT NULL,
  `flddt_bank_dt` date NOT NULL,
  `flddt_scheme_agree_frm` date NOT NULL,
  `flddt_scheme_agree_to` date NOT NULL,
  `fldv_investor_amt` varchar(20) NOT NULL,
  `fldv_bank_name` varchar(100) NOT NULL,
  `fldv_branch_name` varchar(100) NOT NULL,
  `fldv_acc_no` varchar(20) NOT NULL,
  `fldv_ifsc_code` varchar(20) NOT NULL,
  `fldv_policy_type` varchar(100) NOT NULL,
  `fldv_total_amount` varchar(20) NOT NULL,
  `fldv_adv_pay` varchar(20) NOT NULL,
  `fldv_pay_mode_city` varchar(20) NOT NULL,
  `fldv_mon_emi` varchar(20) NOT NULL,
  `fldv_loan_amt` varchar(20) NOT NULL,
  `fldv_loan_bank` varchar(100) NOT NULL,
  `fldv_bank_emi` varchar(20) NOT NULL,
  `flddt_emi_dt` date NOT NULL,
  `flddt_loan_due_dt` date NOT NULL,
  `fldv_taxi_no` varchar(20) NOT NULL,
  `fldv_car_model` varchar(100) NOT NULL,
  `fldv_scheme_type` varchar(100) NOT NULL,
  `fldv_amt_paid` varchar(20) NOT NULL,
  `flddt_chq_dt` date NOT NULL,
  `fldv_pay_mode_call` varchar(20) NOT NULL,
  `fldv_pay_mode_rent` varchar(20) NOT NULL,
  `fldv_chq_no` varchar(20) NOT NULL,
  `fldc_amt_paid_flag` char(1) NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_license_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_license_details` (
  `fldi_id` int(15) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(20) NOT NULL,
  `fldv_rto_name` varchar(200) NOT NULL,
  `flddt_issue_date` date NOT NULL,
  `flddt_dob` date NOT NULL,
  `flddt_lmv_cab_date` date NOT NULL,
  `flddt_expiry_date` date NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_mst` (
  `fldi_driver_id` int(10) NOT NULL AUTO_INCREMENT,
  `fldv_driver_name` varchar(200) DEFAULT NULL,
  `fldv_driver_mob_no` varchar(15) NOT NULL,
  `fldv_employee_code` varchar(100) NOT NULL,
  `fldv_badge_no` varchar(100) NOT NULL,
  `fldi_rto_id` bigint(10) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldi_division_id` int(5) NOT NULL,
  `fldv_division_code` varchar(2) NOT NULL,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldi_depot_id` int(5) NOT NULL,
  `fldv_depot_code` varchar(2) NOT NULL,
  `fldv_depot_name` varchar(100) NOT NULL,
  `fldm_address1` mediumtext NOT NULL,
  `fldm_address2` mediumtext NOT NULL,
  `fldm_address3` mediumtext NOT NULL,
  `flddt_joining_date` date NOT NULL,
  `fldv_emp_photo` varchar(50) NOT NULL,
  PRIMARY KEY (`fldi_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1035 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_mst_log` (
  `fldi_driver_id` int(10) NOT NULL,
  `fldv_driver_name` varchar(200) DEFAULT NULL,
  `fldv_driver_mob_no` varchar(15) NOT NULL,
  `fldv_employee_code` varchar(100) NOT NULL,
  `fldv_badge_no` varchar(100) NOT NULL,
  `fldi_rto_id` bigint(10) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldi_division_id` int(5) NOT NULL,
  `fldv_division_code` varchar(2) NOT NULL,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldi_depot_id` int(5) NOT NULL,
  `fldv_depot_code` varchar(2) NOT NULL,
  `fldv_depot_name` varchar(100) NOT NULL,
  `fldm_address1` mediumtext NOT NULL,
  `fldm_address2` mediumtext NOT NULL,
  `fldm_address3` mediumtext NOT NULL,
  `flddt_joining_date` date NOT NULL,
  `fldv_emp_photo` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_personal_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_personal_details` (
  `fldi_id` int(15) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(20) NOT NULL,
  `fldv_license_no` varchar(30) NOT NULL,
  `fldv_badge_no` varchar(30) NOT NULL,
  `fldv_application_no` varchar(30) NOT NULL,
  `fldv_winner_no` varchar(30) NOT NULL,
  `fldv_full_name` varchar(100) NOT NULL,
  `fldv_mother_name` varchar(100) NOT NULL,
  `fldv_marital_status` varchar(20) NOT NULL,
  `fldv_wife_name` varchar(100) NOT NULL,
  `fldv_contact_no` varchar(10) NOT NULL,
  `fldv_residential_no` varchar(10) NOT NULL,
  `fldv_email_id` varchar(100) NOT NULL,
  `flddt_dob` date NOT NULL,
  `fldv_qualification` varchar(50) NOT NULL,
  `fldv_pan_no` varchar(20) NOT NULL,
  `fldv_adhar_no` varchar(30) NOT NULL,
  `fldv_ration_no` varchar(30) NOT NULL,
  `fldv_passport_no` varchar(30) NOT NULL,
  `fldv_voter_no` varchar(20) NOT NULL,
  `fldv_fingerprint` varchar(500) NOT NULL,
  `fldv_no_of_docs` int(10) NOT NULL,
  `fldv_age_proof` varchar(50) NOT NULL,
  `fldv_address_proof` varchar(50) NOT NULL,
  `fldv_other_add_proof` varchar(100) NOT NULL,
  `fldv_other_age_proof` varchar(100) NOT NULL,
  `fldv_nominee` varchar(100) NOT NULL,
  `fldv_nominee_photo` varchar(500) NOT NULL,
  `fldv_nominee_contact_no` varchar(10) NOT NULL,
  `fldv_nominee_relation` varchar(20) NOT NULL,
  `fldv_ref1_name` varchar(100) NOT NULL,
  `fldv_ref1_contact_no` varchar(10) NOT NULL,
  `fldv_ref2_name` varchar(100) NOT NULL,
  `fldv_ref2_contact_no` varchar(10) NOT NULL,
  `fldv_driver_image` varchar(500) NOT NULL,
  `fldv_upload_address_proof` varchar(500) NOT NULL,
  `fldv_upload_age_proof` varchar(500) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldv_perm_address` varchar(250) NOT NULL,
  `fldv_present_address` varchar(250) NOT NULL,
  `fldv_nominee_address` varchar(250) NOT NULL,
  `fldv_native_address` varchar(250) NOT NULL,
  `fldv_ref1_add` varchar(250) NOT NULL,
  `fldv_ref2_add` varchar(250) NOT NULL,
  `fldv_gender_type` varchar(20) NOT NULL,
  `fldv_rto_license` varchar(200) NOT NULL,
  `fldv_rto_residence` varchar(200) NOT NULL,
  `fldv_visible_mark` varchar(50) NOT NULL,
  `fldv_height` double NOT NULL,
  `fldv_weight` double NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  `fldv_caste` varchar(25) NOT NULL,
  `fldv_place_of_birth` varchar(100) NOT NULL,
  `fldc_computer_knowledge` char(1) NOT NULL,
  `fldv_languages_known` varchar(100) NOT NULL,
  `fldv_blood_group` varchar(20) NOT NULL,
  `fldi_chest_size` int(2) NOT NULL,
  `fldv_employment_number` varchar(10) NOT NULL,
  `fldv_EPF_member_id` varchar(20) NOT NULL,
  `fldv_UAN` varchar(25) NOT NULL,
  `fldv_ESIC_no` varchar(20) NOT NULL,
  `fldv_bank_account_no` varchar(20) NOT NULL,
  `fldv_ISF_code` varchar(20) NOT NULL,
  `fldv_upload_cancelled_cheque` varchar(500) NOT NULL,
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_police_verif_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_police_verif_details` (
  `fldi_id` int(15) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(20) NOT NULL,
  `fldv_char_cert` varchar(500) NOT NULL,
  `fldv_cert_no` varchar(30) NOT NULL,
  `fldv_police_station` varchar(50) NOT NULL,
  `flddt_issue` date NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_training_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_training_details` (
  `fldi_id` int(15) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(20) NOT NULL,
  `fldv_trainer_name` varchar(50) NOT NULL,
  `flddt_training_date` date NOT NULL,
  `flddt_training_comp_date` date NOT NULL,
  `fldv_remarks` varchar(200) NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver_upload_details`
--

CREATE TABLE IF NOT EXISTS `tbl_driver_upload_details` (
  `fldi_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `fldv_driver_id` varchar(30) NOT NULL,
  `fldv_dl_upload` varchar(500) NOT NULL,
  `fldv_badge_upload` varchar(500) NOT NULL,
  `fldv_pan_upload` varchar(500) NOT NULL,
  `fldv_adhar_upload` varchar(500) NOT NULL,
  `fldv_election_upload` varchar(500) NOT NULL,
  `fldv_passport_upload` varchar(500) NOT NULL,
  `fldv_lcbc_upload` varchar(500) NOT NULL,
  `fldv_lightbill_upload` varchar(500) NOT NULL,
  `fldv_waterbill_upload` varchar(500) NOT NULL,
  `fldv_leave_upload` varchar(500) NOT NULL,
  `fldv_taxrc_upload` varchar(500) NOT NULL,
  `fldv_owner_upload` varchar(500) NOT NULL,
  `fldv_rent_upload` varchar(500) NOT NULL,
  `fldv_soc_upload` varchar(500) NOT NULL,
  `fldv_shop_upload` varchar(500) NOT NULL,
  `fldv_domicile_upload` varchar(500) NOT NULL,
  `fldv_police_upload` varchar(500) NOT NULL,
  `fldv_other_upload` varchar(500) NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  `fldc_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_driver_id` (`fldv_driver_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_allocation`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_allocation` (
  `flddt_duty_date` date DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldv_from_time_hr` varchar(2) DEFAULT NULL,
  `fldv_from_time_min` varchar(2) DEFAULT NULL,
  `fldv_from_time` varchar(5) DEFAULT NULL,
  `fldv_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_driver_name` varchar(200) DEFAULT NULL,
  `fldi_driver_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldc_sub_driver_flg` char(1) DEFAULT NULL,
  `fldv_sub_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_sub_driver_name` varchar(200) DEFAULT NULL,
  `fldi_sub_driver_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldv_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldi_conductor_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldc_sub_conductor_flg` char(1) DEFAULT NULL,
  `fldv_sub_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_sub_conductor_name` varchar(100) DEFAULT NULL,
  `fldi_sub_conductor_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_allocation_log`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_allocation_log` (
  `flddt_duty_date` date DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldv_from_time_hr` varchar(2) DEFAULT NULL,
  `fldv_from_time_min` varchar(2) DEFAULT NULL,
  `fldv_from_time` varchar(5) DEFAULT NULL,
  `fldv_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_driver_name` varchar(200) DEFAULT NULL,
  `fldi_driver_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldc_sub_driver_flg` char(1) DEFAULT NULL,
  `fldv_sub_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_sub_driver_name` varchar(200) DEFAULT NULL,
  `fldi_sub_driver_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldv_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldi_conductor_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldc_sub_conductor_flg` char(1) DEFAULT NULL,
  `fldv_sub_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_sub_conductor_name` varchar(100) DEFAULT NULL,
  `fldi_sub_conductor_allocate_type_id` bigint(60) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_assignment`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_assignment` (
  `fldi_duty_assign_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldv_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_weekly_off` varchar(25) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_duty_assign_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_assignment_log`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_assignment_log` (
  `fldi_duty_assign_id` bigint(60) NOT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldv_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldv_weekly_off` varchar(25) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master` (
  `fldi_duty_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_time` time NOT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL,
  `fldi_duty_calculation` int(1) NOT NULL,
  `fldi_depot_id` varchar(10) NOT NULL,
  PRIMARY KEY (`fldi_duty_id`),
  KEY `depot` (`fldi_depot_id`,`fldc_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4434 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_bkp`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_bkp` (
  `fldi_duty_id` bigint(20) NOT NULL,
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL,
  `fldi_duty_calculation` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_bk_2017`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_bk_2017` (
  `fldi_duty_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_time` time NOT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL,
  `fldi_duty_calculation` int(1) NOT NULL,
  `fldi_depot_id` varchar(10) NOT NULL,
  PRIMARY KEY (`fldi_duty_id`),
  KEY `depot` (`fldi_depot_id`,`fldc_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4292 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_block`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_block` (
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_daywise`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_daywise` (
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(2) DEFAULT NULL,
  `fldv_from_time_min` varchar(2) DEFAULT NULL,
  `fldv_to_time_hr` varchar(2) DEFAULT NULL,
  `fldv_to_time_min` varchar(2) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `flddt_date` date DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_daywise_log`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_daywise_log` (
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(2) DEFAULT NULL,
  `fldv_from_time_min` varchar(2) DEFAULT NULL,
  `fldv_to_time_hr` varchar(2) DEFAULT NULL,
  `fldv_to_time_min` varchar(2) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `flddt_date` date DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_log`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_log` (
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_log_ver2`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_log_ver2` (
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_old`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_old` (
  `fldi_duty_id` bigint(20) NOT NULL,
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL,
  `fldi_duty_calculation` int(1) NOT NULL,
  `fldi_depot_id` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_duty_master_ver2`
--

CREATE TABLE IF NOT EXISTS `tbl_duty_master_ver2` (
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) NOT NULL,
  `fldi_shift_id` bigint(60) NOT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) NOT NULL,
  `fldv_sterring_time` varchar(10) NOT NULL,
  `fldv_actual_duty_kms` int(15) NOT NULL,
  `fldv_scheduled_kms` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_etim_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_etim_mst` (
  `fldi_etim_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `fldv_etim_no` varchar(50) DEFAULT NULL,
  `fldv_vendor_name` varchar(100) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_etim_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=777 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_etm_management_dispatch_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_etm_management_dispatch_mst` (
  `fldi_etm_mgmt_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_etm_number` varchar(100) DEFAULT NULL,
  `fldi_conductor_id` int(10) DEFAULT NULL,
  `fldi_shift_id` int(10) DEFAULT NULL,
  `flddt_date` date DEFAULT NULL,
  `fldc_conductor_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_etm_mgmt_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1545 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_etm_management_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_etm_management_mst` (
  `fldi_etm_mgmt_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_etm_number` varchar(100) DEFAULT NULL,
  `fldi_conductor_id` int(10) DEFAULT NULL,
  `fldi_shift_id` int(10) DEFAULT NULL,
  `flddt_date` date DEFAULT NULL,
  `fldc_conductor_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_etm_mgmt_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=877 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE IF NOT EXISTS `tbl_feedback` (
  `fldi_id` int(11) NOT NULL AUTO_INCREMENT,
  `fldi_mobile_no` bigint(20) NOT NULL,
  `fldv_feedback` longtext NOT NULL,
  `fldv_status` int(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=122 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fuel_details`
--

CREATE TABLE IF NOT EXISTS `tbl_fuel_details` (
  `fldv_waybill_no` varchar(20) NOT NULL,
  `fldi_fuel_filled` double NOT NULL,
  `fldi_km` double NOT NULL,
  `fldt_date_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_june_2013`
--

CREATE TABLE IF NOT EXISTS `tbl_june_2013` (
  `fldi_amount` int(11) NOT NULL,
  `fldi_count` int(11) NOT NULL,
  `flddt_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_module_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_module_mst` (
  `fldi_module_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fldv_module_name` varchar(300) NOT NULL,
  `fldv_module_link` varchar(300) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=181 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_off_reliever_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_off_reliever_mst` (
  `fldi_off_releiver_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldv_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldi_reliever_day` int(2) DEFAULT NULL,
  `fldv_reliever_off` varchar(25) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_off_releiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_off_reliever_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_off_reliever_mst_log` (
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldv_cond_employee_code` varchar(100) DEFAULT NULL,
  `fldv_driv_employee_code` varchar(100) DEFAULT NULL,
  `fldi_reliever_day` int(2) DEFAULT NULL,
  `fldv_reliever_off` varchar(25) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pass_entry`
--

CREATE TABLE IF NOT EXISTS `tbl_pass_entry` (
  `fldi_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `flddt_date` date NOT NULL,
  `fldv_stand_name` varchar(80) NOT NULL,
  `fldv_pass_type` varchar(20) NOT NULL,
  `fldv_count` varchar(50) NOT NULL,
  `fldv_amount` varchar(50) NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

CREATE TABLE IF NOT EXISTS `tbl_profile` (
  `fldi_profile_no` int(11) NOT NULL AUTO_INCREMENT,
  `fldi_mobile_no` bigint(10) NOT NULL,
  `fldv_name` varchar(100) NOT NULL,
  `fldv_email` varchar(100) NOT NULL,
  `flddt_lastupdated_datetime` datetime NOT NULL,
  PRIMARY KEY (`fldi_profile_no`),
  UNIQUE KEY `Mobile` (`fldi_mobile_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_module_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_role_module_mst` (
  `fldi_module_id` bigint(10) NOT NULL,
  `fldi_role_id` int(5) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_module_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_role_module_mst_log` (
  `fldi_module_id` bigint(10) NOT NULL,
  `fldi_role_id` int(5) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_role_mst` (
  `fldi_role_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_role_name` varchar(300) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_role_mst_log` (
  `fldi_role_id` int(5) NOT NULL,
  `fldv_role_name` varchar(300) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_fare_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_route_fare_mst` (
  `fldi_route_fare_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_route_stage_no` int(10) DEFAULT NULL,
  `fldd_route_stage_fare` double(10,2) DEFAULT NULL,
  `fldd_route_stage_concession` double(10,2) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_route_fare_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_fare_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_route_fare_mst_log` (
  `fldi_route_fare_id` bigint(60) DEFAULT NULL,
  `fldi_route_stage_no` int(10) DEFAULT NULL,
  `fldd_route_stage_fare` double(10,2) DEFAULT NULL,
  `fldd_route_stage_concession` double(10,2) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_map_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_route_map_mst` (
  `fldi_route_number` int(30) DEFAULT NULL,
  `fldi_return_route_number` int(30) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_route_mst` (
  `fldi_route_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_route_no` int(10) NOT NULL,
  `fldi_triangle_number` int(10) NOT NULL,
  `fldi_bus_type_id` int(5) DEFAULT NULL,
  `fldi_route_type_id` int(5) DEFAULT NULL,
  `fldi_start_stage_id` int(10) NOT NULL,
  `fldv_start_stage` varchar(200) DEFAULT NULL,
  `fldi_end_stage_id` int(10) NOT NULL,
  `fldv_end_stage` varchar(200) DEFAULT NULL,
  `fldi_no_of_stops` int(5) DEFAULT NULL,
  `fldi_depot_id` int(11) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_route_id`),
  UNIQUE KEY `Route` (`fldi_route_no`,`fldv_start_stage`(100),`fldv_end_stage`(100))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_mst_bkp`
--

CREATE TABLE IF NOT EXISTS `tbl_route_mst_bkp` (
  `fldi_route_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_route_no` int(10) NOT NULL,
  `fldi_triangle_number` int(10) NOT NULL,
  `fldi_bus_type_id` int(5) DEFAULT NULL,
  `fldi_route_type_id` int(5) DEFAULT NULL,
  `fldi_start_stage_id` int(10) NOT NULL,
  `fldv_start_stage` varchar(200) DEFAULT NULL,
  `fldi_end_stage_id` int(10) NOT NULL,
  `fldv_end_stage` varchar(200) DEFAULT NULL,
  `fldi_no_of_stops` int(5) DEFAULT NULL,
  `fldi_depot_id` int(11) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_route_id`),
  KEY `Route` (`fldi_route_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_route_mst_log` (
  `fldi_route_id` bigint(60) NOT NULL,
  `fldi_route_no` int(10) NOT NULL,
  `fldi_triangle_number` int(10) NOT NULL,
  `fldi_bus_type_id` int(5) DEFAULT NULL,
  `fldi_route_type_id` int(5) DEFAULT NULL,
  `fldi_start_stage_id` int(10) NOT NULL,
  `fldv_start_stage` varchar(200) DEFAULT NULL,
  `fldi_end_stage_id` int(10) NOT NULL,
  `fldv_end_stage` varchar(200) DEFAULT NULL,
  `fldi_no_of_stops` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_paths`
--

CREATE TABLE IF NOT EXISTS `tbl_route_paths` (
  `fldi_id` int(11) NOT NULL AUTO_INCREMENT,
  `fldv_route_id` varchar(11) NOT NULL,
  `fldvi_route_start` varchar(50) NOT NULL,
  `fldvi_route_end` varchar(50) NOT NULL,
  `fldi_switch_at` varchar(50) NOT NULL,
  `fldv_eta` varchar(50) NOT NULL,
  `fldv_bus_eta` varchar(40) NOT NULL,
  `fldv_total_stops` int(11) NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=178071 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_paths2`
--

CREATE TABLE IF NOT EXISTS `tbl_route_paths2` (
  `fldi_id` int(11) NOT NULL AUTO_INCREMENT,
  `fldv_route_id` varchar(11) NOT NULL,
  `fldvi_route_start` varchar(50) NOT NULL,
  `fldvi_route_end` varchar(50) NOT NULL,
  `fldi_switch_at` varchar(50) NOT NULL,
  `fldv_eta` varchar(50) NOT NULL,
  `fldv_bus_eta` varchar(40) NOT NULL,
  `fldv_total_stops` int(11) NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=178071 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_type_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_route_type_mst` (
  `fldi_route_type_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_route_type` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_route_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_route_type_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_route_type_mst_log` (
  `fldi_route_type_id` int(5) DEFAULT NULL,
  `fldv_route_type` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rout_stage_details`
--

CREATE TABLE IF NOT EXISTS `tbl_rout_stage_details` (
  `fldi_stage_unique_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldi_bus_type_id` int(5) DEFAULT NULL,
  `fldi_route_type_id` int(5) DEFAULT NULL,
  `fldi_triangle_number` int(10) DEFAULT NULL,
  `fldi_route_stage_id` int(10) NOT NULL,
  `fldv_route_stage_code` varchar(100) DEFAULT NULL,
  `fldv_stage_name` varchar(200) DEFAULT NULL,
  `fldv_stage_km` varchar(100) DEFAULT NULL,
  `fldv_stage_number` int(100) DEFAULT NULL,
  `fldv_sub_stage_number` varchar(100) DEFAULT NULL,
  `fldi_chargeable_stage` int(10) NOT NULL,
  `fldf_stage_fare` float DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_stage_unique_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76786 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rout_stage_details_bkp`
--

CREATE TABLE IF NOT EXISTS `tbl_rout_stage_details_bkp` (
  `fldi_stage_unique_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldi_bus_type_id` int(5) DEFAULT NULL,
  `fldi_route_type_id` int(5) DEFAULT NULL,
  `fldi_triangle_number` int(10) DEFAULT NULL,
  `fldi_route_stage_id` int(10) NOT NULL,
  `fldv_route_stage_code` varchar(100) DEFAULT NULL,
  `fldv_stage_name` varchar(200) DEFAULT NULL,
  `fldv_stage_km` varchar(100) DEFAULT NULL,
  `fldv_stage_number` int(100) DEFAULT NULL,
  `fldv_sub_stage_number` varchar(100) DEFAULT NULL,
  `fldi_chargeable_stage` int(10) NOT NULL,
  `fldf_stage_fare` float DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_stage_unique_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72588 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rout_stage_details_log`
--

CREATE TABLE IF NOT EXISTS `tbl_rout_stage_details_log` (
  `fldi_stage_unique_id` bigint(60) NOT NULL,
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldi_bus_type_id` int(5) DEFAULT NULL,
  `fldi_route_type_id` int(5) DEFAULT NULL,
  `fldi_triangle_number` int(10) DEFAULT NULL,
  `fldi_route_stage_id` int(10) NOT NULL,
  `fldv_route_stage_code` varchar(100) DEFAULT NULL,
  `fldv_stage_name` varchar(200) DEFAULT NULL,
  `fldv_stage_km` varchar(100) DEFAULT NULL,
  `fldv_stage_number` varchar(100) DEFAULT NULL,
  `fldv_sub_stage_number` varchar(100) DEFAULT NULL,
  `fldi_chargeable_stage` int(10) NOT NULL,
  `fldf_stage_fare` float DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rto_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_rto_mst` (
  `fldi_rto_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fldi_city_id` int(10) NOT NULL,
  `fldv_rto_number` varchar(35) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_rto_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rto_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_rto_mst_log` (
  `fldi_rto_id` bigint(10) NOT NULL,
  `fldi_city_id` int(10) NOT NULL,
  `fldv_rto_number` varchar(10) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_operator_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_service_operator_mst` (
  `fldi_operator_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_service_operator_name` varchar(300) NOT NULL,
  `fldv_address1` varchar(300) NOT NULL,
  `fldv_address2` varchar(300) NOT NULL,
  `fldv_comment_line1` varchar(300) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_operator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_operator_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_service_operator_mst_log` (
  `fldi_operator_id` int(5) NOT NULL,
  `fldv_service_operator_name` varchar(300) NOT NULL,
  `fldv_address1` varchar(300) NOT NULL,
  `fldv_address2` varchar(300) NOT NULL,
  `fldv_comment_line1` varchar(300) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shift_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_shift_mst` (
  `fldi_shift_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_shift_name` varchar(100) DEFAULT NULL,
  `fldv_shift_start_time` varchar(100) DEFAULT NULL,
  `fldv_shift_end_time` varchar(100) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(50) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_shift_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_alert_msg`
--

CREATE TABLE IF NOT EXISTS `tbl_sms_alert_msg` (
  `fldv_contact_number` varchar(15) DEFAULT NULL,
  `fldm_message_text` mediumtext NOT NULL,
  `fldc_sms_send_status` char(1) NOT NULL DEFAULT 'N',
  `flddt_sms_inserted_date` datetime NOT NULL,
  `flddt_sms_send_time` datetime DEFAULT NULL,
  KEY `sms` (`fldc_sms_send_status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stage_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_stage_mst` (
  `fldi_stage_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_stage_code` varchar(10) DEFAULT NULL,
  `fldv_stage_name` varchar(100) DEFAULT NULL,
  `fldi_user_id` int(10) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_stage_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=184 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stand_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_stand_mst` (
  `fldi_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_stand_id` bigint(60) NOT NULL,
  `fldv_stand_name` varchar(100) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stand_route_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_stand_route_mst` (
  `fldi_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldi_stand_id` bigint(60) NOT NULL,
  `fldi_route_no` bigint(60) NOT NULL,
  `fldv_route_name` varchar(100) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`),
  UNIQUE KEY `fldi_route_no` (`fldi_route_no`,`fldi_stand_id`,`fldv_route_name`,`fldc_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ticket_data`
--

CREATE TABLE IF NOT EXISTS `tbl_ticket_data` (
  `fldv_ticket_data` varchar(400) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trip_details`
--

CREATE TABLE IF NOT EXISTS `tbl_trip_details` (
  `fldi_id` int(11) NOT NULL AUTO_INCREMENT,
  `fldv_from` varchar(20) NOT NULL,
  `fldv_to` varchar(20) NOT NULL,
  `fldv_distance` varchar(4) NOT NULL,
  `fldv_time` varchar(5) NOT NULL,
  `fldv_trip_type` varchar(5) NOT NULL,
  `fldv_startTime` varchar(5) NOT NULL,
  `flv_endTime` varchar(5) NOT NULL,
  `fldc_active` char(1) NOT NULL DEFAULT 'Y',
  `flddt_created_on` datetime NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trip_ticket_details`
--

CREATE TABLE IF NOT EXISTS `tbl_trip_ticket_details` (
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldi_conductor_id` int(10) DEFAULT NULL,
  `fldv_conductor_employee_code` varchar(100) DEFAULT NULL,
  `fldv_driver_name` varchar(100) DEFAULT NULL,
  `fldi_driver_id` int(10) DEFAULT NULL,
  `fldv_driver_employee_code` varchar(100) DEFAULT NULL,
  `fldv_vehicle_number` varchar(25) DEFAULT NULL,
  `fldi_vehicle_id` int(10) DEFAULT NULL,
  `fldv_division_name` varchar(100) DEFAULT NULL,
  `fldv_division_code` varchar(5) DEFAULT NULL,
  `fldv_depot_name` varchar(100) DEFAULT NULL,
  `fldv_depot_code` varchar(5) DEFAULT NULL,
  `fldv_schedule` varchar(10) DEFAULT NULL,
  `fldv_etm_number` varchar(5) DEFAULT NULL,
  `fldv_waybill_date_time` varchar(50) DEFAULT NULL,
  `fldi_trip_no` int(10) DEFAULT NULL,
  `fldi_route_no` int(10) DEFAULT NULL,
  `fldv_ticket_code` varchar(50) DEFAULT NULL,
  `fldv_ticket_no` varchar(50) DEFAULT NULL,
  `fldi_stage_from` int(10) DEFAULT NULL,
  `fldi_stage_to` int(10) DEFAULT NULL,
  `fldi_full_ticket` int(10) DEFAULT NULL,
  `fldi_half_ticket` int(10) DEFAULT NULL,
  `fldi_luggage_ticket` int(10) DEFAULT NULL,
  `fldi_pass_ticket` int(10) DEFAULT NULL,
  `fldi_ticket_fare` int(10) DEFAULT NULL,
  `flddt_ticket_date` date DEFAULT NULL,
  `fldv_ticket_time` varchar(25) DEFAULT NULL,
  `flddt_ticket_date_time` datetime DEFAULT NULL,
  `fldv_docket_number` varchar(50) DEFAULT NULL,
  `fldv_concession_case_code` varchar(10) DEFAULT NULL,
  `fldv_state_code` varchar(10) DEFAULT NULL,
  `fldi_full_amount` int(10) DEFAULT NULL,
  `fldi_half_amount` int(10) DEFAULT NULL,
  `fldv_vendor_name` varchar(50) NOT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  KEY `idx_last_date` (`flddt_last_upd_date`),
  KEY `idx_waybill` (`fldv_waybill_no`),
  KEY `idTicketDate` (`flddt_ticket_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_trip_ticket_details`
--

INSERT INTO `tbl_trip_ticket_details` (`fldv_waybill_no`, `fldv_conductor_name`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_driver_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_vehicle_number`, `fldi_vehicle_id`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldi_trip_no`, `fldi_route_no`, `fldv_ticket_code`, `fldv_ticket_no`, `fldi_stage_from`, `fldi_stage_to`, `fldi_full_ticket`, `fldi_half_ticket`, `fldi_luggage_ticket`, `fldi_pass_ticket`, `fldi_ticket_fare`, `flddt_ticket_date`, `fldv_ticket_time`, `flddt_ticket_date_time`, `fldv_docket_number`, `fldv_concession_case_code`, `fldv_state_code`, `fldi_full_amount`, `fldi_half_amount`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, 'LUGG', '1397', 10, 17, 0, 0, 1, 0, 500, '2018-07-12', '23:09:59', '2018-07-12 23:09:59', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1396', 10, 17, 1, 0, 0, 0, 700, '2018-07-12', '23:09:50', '2018-07-12 23:09:50', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1395', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '23:06:01', '2018-07-12 23:06:01', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1394', 10, 17, 1, 0, 0, 0, 700, '2018-07-12', '23:05:24', '2018-07-12 23:05:24', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1393', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '23:01:05', '2018-07-12 23:01:05', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1392', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '23:00:24', '2018-07-12 23:00:24', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1391', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '22:59:58', '2018-07-12 22:59:58', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1390', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:59:41', '2018-07-12 22:59:41', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1389', 1, 13, 1, 0, 0, 0, 1100, '2018-07-12', '22:59:36', '2018-07-12 22:59:36', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1388', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:59:27', '2018-07-12 22:59:27', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1387', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:59:19', '2018-07-12 22:59:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1386', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:58:58', '2018-07-12 22:58:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1385', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:58:53', '2018-07-12 22:58:53', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1384', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:58:48', '2018-07-12 22:58:48', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1383', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:58:42', '2018-07-12 22:58:42', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1382', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:58:25', '2018-07-12 22:58:25', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1381', 1, 18, 1, 0, 0, 0, 1300, '2018-07-12', '22:58:17', '2018-07-12 22:58:17', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1380', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:58:12', '2018-07-12 22:58:12', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1379', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:58:06', '2018-07-12 22:58:06', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1378', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:57:58', '2018-07-12 22:57:58', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1377', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:57:50', '2018-07-12 22:57:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1376', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '22:57:42', '2018-07-12 22:57:42', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1375', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:57:31', '2018-07-12 22:57:31', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1374', 1, 18, 1, 0, 0, 0, 1300, '2018-07-12', '22:57:11', '2018-07-12 22:57:11', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1373', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:56:55', '2018-07-12 22:56:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1372', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '22:56:23', '2018-07-12 22:56:23', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1371', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:56:05', '2018-07-12 22:56:05', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1370', 1, 17, 2, 0, 0, 0, 2200, '2018-07-12', '22:55:36', '2018-07-12 22:55:36', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1369', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:55:26', '2018-07-12 22:55:26', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1368', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:55:15', '2018-07-12 22:55:15', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1367', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '22:54:54', '2018-07-12 22:54:54', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1366', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:54:45', '2018-07-12 22:54:45', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1365', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:54:31', '2018-07-12 22:54:31', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1364', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:54:21', '2018-07-12 22:54:21', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1363', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:54:11', '2018-07-12 22:54:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1362', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:54:03', '2018-07-12 22:54:03', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1361', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:53:56', '2018-07-12 22:53:56', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1360', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:53:50', '2018-07-12 22:53:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1359', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:53:25', '2018-07-12 22:53:25', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1358', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:53:17', '2018-07-12 22:53:17', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1357', 1, 19, 1, 0, 0, 0, 1300, '2018-07-12', '22:53:06', '2018-07-12 22:53:06', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1356', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:52:58', '2018-07-12 22:52:58', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1355', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:52:53', '2018-07-12 22:52:53', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1354', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:52:39', '2018-07-12 22:52:39', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1353', 1, 16, 2, 0, 0, 0, 2200, '2018-07-12', '22:52:32', '2018-07-12 22:52:32', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1352', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:52:25', '2018-07-12 22:52:25', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1351', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:51:58', '2018-07-12 22:51:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1350', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:51:40', '2018-07-12 22:51:40', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1349', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:51:22', '2018-07-12 22:51:22', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1348', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '22:51:07', '2018-07-12 22:51:07', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1347', 1, 19, 1, 0, 0, 0, 1300, '2018-07-12', '22:50:55', '2018-07-12 22:50:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1346', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '22:50:39', '2018-07-12 22:50:39', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1345', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '22:50:27', '2018-07-12 22:50:27', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1344', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:50:15', '2018-07-12 22:50:15', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1343', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:50:02', '2018-07-12 22:50:02', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1342', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:49:55', '2018-07-12 22:49:55', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1341', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:49:39', '2018-07-12 22:49:39', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1340', 1, 16, 2, 0, 0, 0, 2200, '2018-07-12', '22:49:22', '2018-07-12 22:49:22', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 11, 102, '0000', '1339', 1, 13, 1, 0, 0, 0, 1100, '2018-07-12', '22:49:08', '2018-07-12 22:49:08', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1338', 8, 1, 1, 0, 0, 0, 1000, '2018-07-12', '22:40:05', '2018-07-12 22:40:05', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1337', 10, 1, 1, 0, 0, 0, 1000, '2018-07-12', '22:38:31', '2018-07-12 22:38:31', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, 'LUGG', '1336', 16, 1, 0, 0, 1, 0, 500, '2018-07-12', '22:35:58', '2018-07-12 22:35:58', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1335', 16, 15, 1, 0, 0, 0, 700, '2018-07-12', '22:35:41', '2018-07-12 22:35:41', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1334', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '22:34:16', '2018-07-12 22:34:16', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1333', 19, 6, 1, 0, 0, 0, 1100, '2018-07-12', '22:33:55', '2018-07-12 22:33:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1332', 19, 7, 1, 0, 0, 0, 1100, '2018-07-12', '22:32:32', '2018-07-12 22:32:32', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1331', 19, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:32:29', '2018-07-12 22:32:29', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1330', 21, 15, 1, 0, 0, 0, 1000, '2018-07-12', '22:29:15', '2018-07-12 22:29:15', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1329', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '22:29:07', '2018-07-12 22:29:07', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1328', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '22:28:58', '2018-07-12 22:28:58', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 10, 102, '0000', '1327', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '22:28:47', '2018-07-12 22:28:47', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, 'LUGG', '1326', 1, 16, 0, 0, 1, 0, 500, '2018-07-12', '22:18:25', '2018-07-12 22:18:25', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1325', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:15:09', '2018-07-12 22:15:09', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1324', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:14:09', '2018-07-12 22:14:09', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1323', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:13:58', '2018-07-12 22:13:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1322', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:13:16', '2018-07-12 22:13:16', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1321', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:13:07', '2018-07-12 22:13:07', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1320', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:12:59', '2018-07-12 22:12:59', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1319', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:12:49', '2018-07-12 22:12:49', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1318', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:12:43', '2018-07-12 22:12:43', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1317', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:12:34', '2018-07-12 22:12:34', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1316', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:12:20', '2018-07-12 22:12:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1315', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:12:13', '2018-07-12 22:12:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1314', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:12:03', '2018-07-12 22:12:03', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1313', 1, 21, 3, 0, 0, 0, 3900, '2018-07-12', '22:11:42', '2018-07-12 22:11:42', '0', '00', '0', 3900, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1312', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:11:34', '2018-07-12 22:11:34', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1311', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:11:21', '2018-07-12 22:11:21', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1310', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:11:17', '2018-07-12 22:11:17', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1309', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:11:09', '2018-07-12 22:11:09', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1308', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:10:56', '2018-07-12 22:10:56', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1307', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '22:10:48', '2018-07-12 22:10:48', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1306', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:10:32', '2018-07-12 22:10:32', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1305', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:10:21', '2018-07-12 22:10:21', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1304', 1, 17, 2, 0, 0, 0, 2200, '2018-07-12', '22:10:14', '2018-07-12 22:10:14', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1303', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:10:02', '2018-07-12 22:10:02', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1302', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:09:54', '2018-07-12 22:09:54', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1301', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:09:34', '2018-07-12 22:09:34', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1300', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:09:25', '2018-07-12 22:09:25', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1299', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '22:09:20', '2018-07-12 22:09:20', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1298', 1, 17, 7, 0, 0, 0, 7700, '2018-07-12', '22:09:04', '2018-07-12 22:09:04', '0', '00', '0', 7700, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1297', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:08:58', '2018-07-12 22:08:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1296', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:08:48', '2018-07-12 22:08:48', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1295', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:08:39', '2018-07-12 22:08:39', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1294', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:08:22', '2018-07-12 22:08:22', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1293', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:08:17', '2018-07-12 22:08:17', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1292', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:08:06', '2018-07-12 22:08:06', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1291', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:07:57', '2018-07-12 22:07:57', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1290', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:07:51', '2018-07-12 22:07:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1289', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:07:36', '2018-07-12 22:07:36', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1288', 1, 15, 1, 0, 0, 0, 1100, '2018-07-12', '22:07:31', '2018-07-12 22:07:31', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1287', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:07:26', '2018-07-12 22:07:26', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1286', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:07:22', '2018-07-12 22:07:22', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1285', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:07:16', '2018-07-12 22:07:16', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1284', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:06:59', '2018-07-12 22:06:59', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1283', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:06:52', '2018-07-12 22:06:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1282', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:06:46', '2018-07-12 22:06:46', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1281', 1, 21, 3, 0, 0, 0, 3900, '2018-07-12', '22:06:30', '2018-07-12 22:06:30', '0', '00', '0', 3900, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1280', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:06:24', '2018-07-12 22:06:24', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1279', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:06:19', '2018-07-12 22:06:19', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1278', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:06:11', '2018-07-12 22:06:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1277', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:05:55', '2018-07-12 22:05:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1276', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:05:46', '2018-07-12 22:05:46', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1275', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:05:40', '2018-07-12 22:05:40', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1274', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:05:35', '2018-07-12 22:05:35', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1273', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '22:05:23', '2018-07-12 22:05:23', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1272', 1, 19, 1, 0, 0, 0, 1300, '2018-07-12', '22:05:18', '2018-07-12 22:05:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1271', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:05:10', '2018-07-12 22:05:10', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:25'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1270', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:04:54', '2018-07-12 22:04:54', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1269', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:04:50', '2018-07-12 22:04:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1268', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:04:40', '2018-07-12 22:04:40', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1267', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:04:27', '2018-07-12 22:04:27', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1266', 1, 10, 2, 0, 0, 0, 2000, '2018-07-12', '22:04:16', '2018-07-12 22:04:16', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1265', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:04:04', '2018-07-12 22:04:04', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1264', 1, 10, 2, 0, 0, 0, 2000, '2018-07-12', '22:03:58', '2018-07-12 22:03:58', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1263', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '22:03:39', '2018-07-12 22:03:39', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1262', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:03:25', '2018-07-12 22:03:25', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1261', 1, 21, 0, 1, 0, 0, 700, '2018-07-12', '22:03:17', '2018-07-12 22:03:17', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1260', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '22:02:59', '2018-07-12 22:02:59', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1259', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:02:54', '2018-07-12 22:02:54', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1258', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:02:46', '2018-07-12 22:02:46', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1257', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '22:02:32', '2018-07-12 22:02:32', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1256', 1, 11, 1, 0, 0, 0, 1100, '2018-07-12', '22:02:21', '2018-07-12 22:02:21', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1255', 1, 13, 1, 0, 0, 0, 1100, '2018-07-12', '22:02:14', '2018-07-12 22:02:14', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1254', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:02:03', '2018-07-12 22:02:03', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1253', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '22:01:54', '2018-07-12 22:01:54', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1252', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:01:49', '2018-07-12 22:01:49', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1251', 1, 11, 1, 0, 0, 0, 1100, '2018-07-12', '22:01:43', '2018-07-12 22:01:43', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1250', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '22:01:35', '2018-07-12 22:01:35', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1249', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:01:28', '2018-07-12 22:01:28', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1248', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '22:01:14', '2018-07-12 22:01:14', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1247', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '22:01:08', '2018-07-12 22:01:08', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1246', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '22:01:01', '2018-07-12 22:01:01', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1245', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:00:51', '2018-07-12 22:00:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1244', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '22:00:38', '2018-07-12 22:00:38', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1243', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '22:00:36', '2018-07-12 22:00:36', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1242', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '22:00:28', '2018-07-12 22:00:28', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1241', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '22:00:20', '2018-07-12 22:00:20', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1240', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '22:00:14', '2018-07-12 22:00:14', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24');
INSERT INTO `tbl_trip_ticket_details` (`fldv_waybill_no`, `fldv_conductor_name`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_driver_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_vehicle_number`, `fldi_vehicle_id`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldi_trip_no`, `fldi_route_no`, `fldv_ticket_code`, `fldv_ticket_no`, `fldi_stage_from`, `fldi_stage_to`, `fldi_full_ticket`, `fldi_half_ticket`, `fldi_luggage_ticket`, `fldi_pass_ticket`, `fldi_ticket_fare`, `flddt_ticket_date`, `fldv_ticket_time`, `flddt_ticket_date_time`, `fldv_docket_number`, `fldv_concession_case_code`, `fldv_state_code`, `fldi_full_amount`, `fldi_half_amount`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1239', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '22:00:10', '2018-07-12 22:00:10', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 9, 102, '0000', '1238', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '22:00:06', '2018-07-12 22:00:06', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1237', 9, 1, 1, 0, 0, 0, 1000, '2018-07-12', '21:48:24', '2018-07-12 21:48:24', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1236', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:47:05', '2018-07-12 21:47:05', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1235', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:46:48', '2018-07-12 21:46:48', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1234', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '21:46:26', '2018-07-12 21:46:26', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1233', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:46:13', '2018-07-12 21:46:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1232', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:45:54', '2018-07-12 21:45:54', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1231', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '21:45:45', '2018-07-12 21:45:45', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1230', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:45:28', '2018-07-12 21:45:28', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1229', 16, 7, 1, 0, 0, 0, 1000, '2018-07-12', '21:44:55', '2018-07-12 21:44:55', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1228', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:44:41', '2018-07-12 21:44:41', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1227', 16, 1, 4, 0, 0, 0, 4400, '2018-07-12', '21:44:08', '2018-07-12 21:44:08', '0', '00', '0', 4400, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1226', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:43:31', '2018-07-12 21:43:31', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1225', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:43:23', '2018-07-12 21:43:23', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1224', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:43:05', '2018-07-12 21:43:05', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1223', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:42:33', '2018-07-12 21:42:33', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1222', 19, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:42:18', '2018-07-12 21:42:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1221', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:41:56', '2018-07-12 21:41:56', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1220', 21, 8, 1, 0, 0, 0, 1100, '2018-07-12', '21:41:26', '2018-07-12 21:41:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1219', 21, 9, 1, 0, 0, 0, 1100, '2018-07-12', '21:41:24', '2018-07-12 21:41:24', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1218', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '21:41:03', '2018-07-12 21:41:03', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, 'CARD', '1217', 21, 21, 1, 0, 0, 0, 0, '2018-07-12', '21:40:42', '2018-07-12 21:40:42', '2016048', '02', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1216', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '21:40:25', '2018-07-12 21:40:25', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1215', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '21:40:17', '2018-07-12 21:40:17', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1214', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:40:10', '2018-07-12 21:40:10', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1213', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:40:03', '2018-07-12 21:40:03', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1212', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '21:39:47', '2018-07-12 21:39:47', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1211', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:39:39', '2018-07-12 21:39:39', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1210', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:39:30', '2018-07-12 21:39:30', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1209', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:39:17', '2018-07-12 21:39:17', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1208', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '21:39:04', '2018-07-12 21:39:04', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1207', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:38:55', '2018-07-12 21:38:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1206', 21, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:38:50', '2018-07-12 21:38:50', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1205', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:38:43', '2018-07-12 21:38:43', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1204', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:38:32', '2018-07-12 21:38:32', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1203', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:38:22', '2018-07-12 21:38:22', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1202', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '21:38:12', '2018-07-12 21:38:12', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1201', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:38:06', '2018-07-12 21:38:06', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1200', 21, 11, 1, 0, 0, 0, 1000, '2018-07-12', '21:37:59', '2018-07-12 21:37:59', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 8, 102, '0000', '1199', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '21:37:27', '2018-07-12 21:37:27', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1198', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '21:29:14', '2018-07-12 21:29:14', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1197', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '21:21:14', '2018-07-12 21:21:14', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1196', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '21:20:49', '2018-07-12 21:20:49', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1195', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '21:20:32', '2018-07-12 21:20:32', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1194', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '21:20:20', '2018-07-12 21:20:20', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1193', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '21:20:17', '2018-07-12 21:20:17', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1192', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '21:20:07', '2018-07-12 21:20:07', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1191', 7, 21, 1, 0, 0, 0, 1100, '2018-07-12', '21:17:35', '2018-07-12 21:17:35', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1190', 7, 16, 1, 0, 0, 0, 1000, '2018-07-12', '21:16:02', '2018-07-12 21:16:02', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1189', 7, 21, 1, 0, 0, 0, 1100, '2018-07-12', '21:15:51', '2018-07-12 21:15:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1188', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:15:02', '2018-07-12 21:15:02', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1187', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:14:42', '2018-07-12 21:14:42', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, 'CARD', '1186', 1, 1, 1, 0, 0, 0, 0, '2018-07-12', '21:14:22', '2018-07-12 21:14:22', '201604634', '02', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1185', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:14:12', '2018-07-12 21:14:12', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1184', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:14:05', '2018-07-12 21:14:05', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1183', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:13:58', '2018-07-12 21:13:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1182', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:13:50', '2018-07-12 21:13:50', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1181', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:13:43', '2018-07-12 21:13:43', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1180', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:13:26', '2018-07-12 21:13:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1179', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:12:58', '2018-07-12 21:12:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1178', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:12:49', '2018-07-12 21:12:49', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1177', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '21:12:41', '2018-07-12 21:12:41', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1176', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:12:32', '2018-07-12 21:12:32', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1175', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:12:20', '2018-07-12 21:12:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1174', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:12:13', '2018-07-12 21:12:13', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, 'CARD', '1173', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:12:03', '2018-07-12 21:12:03', '2016046', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1172', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:11:53', '2018-07-12 21:11:53', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1171', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:11:46', '2018-07-12 21:11:46', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, 'CARD', '1170', 1, 1, 1, 0, 0, 0, 0, '2018-07-12', '21:11:39', '2018-07-12 21:11:39', '201506015', '02', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1169', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:11:13', '2018-07-12 21:11:13', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1168', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:10:59', '2018-07-12 21:10:59', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1167', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '21:10:47', '2018-07-12 21:10:47', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1166', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '21:10:35', '2018-07-12 21:10:35', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1165', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '21:10:30', '2018-07-12 21:10:30', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1164', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:10:03', '2018-07-12 21:10:03', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1163', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:09:45', '2018-07-12 21:09:45', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1162', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '21:09:20', '2018-07-12 21:09:20', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1161', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '21:09:17', '2018-07-12 21:09:17', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1160', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '21:09:11', '2018-07-12 21:09:11', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1159', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '21:08:55', '2018-07-12 21:08:55', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1158', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:08:37', '2018-07-12 21:08:37', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1157', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:08:29', '2018-07-12 21:08:29', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1156', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '21:08:21', '2018-07-12 21:08:21', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1155', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:08:14', '2018-07-12 21:08:14', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, 'LUGG', '1154', 1, 20, 0, 0, 1, 0, 1200, '2018-07-12', '21:07:59', '2018-07-12 21:07:59', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1153', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '21:07:55', '2018-07-12 21:07:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1152', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '21:07:38', '2018-07-12 21:07:38', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1151', 1, 6, 1, 0, 0, 0, 700, '2018-07-12', '21:07:28', '2018-07-12 21:07:28', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1150', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:07:15', '2018-07-12 21:07:15', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1149', 1, 18, 1, 0, 0, 0, 1300, '2018-07-12', '21:07:01', '2018-07-12 21:07:01', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1148', 1, 16, 2, 0, 0, 0, 2200, '2018-07-12', '21:06:41', '2018-07-12 21:06:41', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1147', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '21:06:36', '2018-07-12 21:06:36', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1146', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:06:11', '2018-07-12 21:06:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1145', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '21:06:05', '2018-07-12 21:06:05', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1144', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:06:00', '2018-07-12 21:06:00', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1143', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:05:55', '2018-07-12 21:05:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1142', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '21:05:49', '2018-07-12 21:05:49', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1141', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:05:44', '2018-07-12 21:05:44', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1140', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:05:38', '2018-07-12 21:05:38', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1139', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:05:18', '2018-07-12 21:05:18', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1138', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:05:05', '2018-07-12 21:05:05', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1137', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:04:57', '2018-07-12 21:04:57', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1136', 1, 8, 3, 0, 0, 0, 3000, '2018-07-12', '21:04:40', '2018-07-12 21:04:40', '0', '00', '0', 3000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, 'CARD', '1135', 1, 16, 2, 0, 0, 0, 2200, '2018-07-12', '21:04:27', '2018-07-12 21:04:27', '2016044', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1134', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:04:17', '2018-07-12 21:04:17', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1133', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:04:08', '2018-07-12 21:04:08', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1132', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:03:46', '2018-07-12 21:03:46', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1131', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:03:39', '2018-07-12 21:03:39', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1130', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:03:32', '2018-07-12 21:03:32', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1129', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:03:23', '2018-07-12 21:03:23', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1128', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '21:03:06', '2018-07-12 21:03:06', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1127', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '21:03:02', '2018-07-12 21:03:02', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1126', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:02:51', '2018-07-12 21:02:51', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1125', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:02:39', '2018-07-12 21:02:39', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1124', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '21:02:32', '2018-07-12 21:02:32', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1123', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '21:02:26', '2018-07-12 21:02:26', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 7, 102, '0000', '1122', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '21:02:19', '2018-07-12 21:02:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, 'CARD', '1121', 10, 1, 0, 1, 0, 0, 500, '2018-07-12', '20:48:58', '2018-07-12 20:48:58', '201604491', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1120', 10, 1, 2, 0, 0, 0, 2000, '2018-07-12', '20:48:35', '2018-07-12 20:48:35', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1119', 16, 9, 1, 0, 0, 0, 1000, '2018-07-12', '20:45:36', '2018-07-12 20:45:36', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, 'CARD', '1118', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:45:25', '2018-07-12 20:45:25', '201506011', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1117', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:45:15', '2018-07-12 20:45:15', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1116', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:45:08', '2018-07-12 20:45:08', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1115', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:44:13', '2018-07-12 20:44:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1114', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '20:44:06', '2018-07-12 20:44:06', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1113', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:43:56', '2018-07-12 20:43:56', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1112', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:43:46', '2018-07-12 20:43:46', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1111', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '20:43:19', '2018-07-12 20:43:19', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1110', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:43:05', '2018-07-12 20:43:05', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1109', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:42:52', '2018-07-12 20:42:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1108', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:42:35', '2018-07-12 20:42:35', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1107', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '20:42:26', '2018-07-12 20:42:26', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1106', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:42:17', '2018-07-12 20:42:17', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1105', 16, 7, 1, 0, 0, 0, 1000, '2018-07-12', '20:41:55', '2018-07-12 20:41:55', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1104', 16, 8, 2, 0, 0, 0, 2000, '2018-07-12', '20:41:35', '2018-07-12 20:41:35', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1103', 17, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:40:09', '2018-07-12 20:40:09', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1102', 19, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:39:11', '2018-07-12 20:39:11', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1101', 19, 6, 1, 0, 0, 0, 1100, '2018-07-12', '20:38:54', '2018-07-12 20:38:54', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1100', 19, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:38:33', '2018-07-12 20:38:33', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1099', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:37:37', '2018-07-12 20:37:37', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1098', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '20:37:25', '2018-07-12 20:37:25', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1097', 21, 6, 3, 0, 0, 0, 3300, '2018-07-12', '20:36:57', '2018-07-12 20:36:57', '0', '00', '0', 3300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1096', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '20:36:39', '2018-07-12 20:36:39', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1095', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '20:36:33', '2018-07-12 20:36:33', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1094', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:36:27', '2018-07-12 20:36:27', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1093', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:36:20', '2018-07-12 20:36:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1092', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:36:10', '2018-07-12 20:36:10', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1091', 21, 10, 1, 0, 0, 0, 1000, '2018-07-12', '20:36:05', '2018-07-12 20:36:05', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1090', 21, 10, 1, 0, 0, 0, 1000, '2018-07-12', '20:35:58', '2018-07-12 20:35:58', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1089', 21, 9, 1, 0, 0, 0, 1100, '2018-07-12', '20:35:52', '2018-07-12 20:35:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1088', 21, 15, 1, 0, 0, 0, 1000, '2018-07-12', '20:35:44', '2018-07-12 20:35:44', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1087', 21, 17, 1, 0, 0, 0, 700, '2018-07-12', '20:35:36', '2018-07-12 20:35:36', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1086', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:35:11', '2018-07-12 20:35:11', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 6, 102, '0000', '1085', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:34:46', '2018-07-12 20:34:46', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1084', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '20:00:44', '2018-07-12 20:00:44', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1083', 1, 17, 2, 0, 0, 0, 2200, '2018-07-12', '20:00:27', '2018-07-12 20:00:27', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1082', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:58:58', '2018-07-12 19:58:58', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24');
INSERT INTO `tbl_trip_ticket_details` (`fldv_waybill_no`, `fldv_conductor_name`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_driver_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_vehicle_number`, `fldi_vehicle_id`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldi_trip_no`, `fldi_route_no`, `fldv_ticket_code`, `fldv_ticket_no`, `fldi_stage_from`, `fldi_stage_to`, `fldi_full_ticket`, `fldi_half_ticket`, `fldi_luggage_ticket`, `fldi_pass_ticket`, `fldi_ticket_fare`, `flddt_ticket_date`, `fldv_ticket_time`, `flddt_ticket_date_time`, `fldv_docket_number`, `fldv_concession_case_code`, `fldv_state_code`, `fldi_full_amount`, `fldi_half_amount`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1081', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '19:58:50', '2018-07-12 19:58:50', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1080', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '19:58:34', '2018-07-12 19:58:34', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1079', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '19:58:26', '2018-07-12 19:58:26', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1078', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:58:16', '2018-07-12 19:58:16', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1077', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:58:07', '2018-07-12 19:58:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1076', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '19:57:50', '2018-07-12 19:57:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1075', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '19:57:42', '2018-07-12 19:57:42', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1074', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:57:22', '2018-07-12 19:57:22', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1073', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:57:16', '2018-07-12 19:57:16', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1072', 1, 17, 0, 1, 0, 0, 600, '2018-07-12', '19:57:04', '2018-07-12 19:57:04', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, 'CARD', '1071', 1, 1, 1, 0, 0, 0, 0, '2018-07-12', '19:56:26', '2018-07-12 19:56:26', '16042853', '02', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1070', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:56:17', '2018-07-12 19:56:17', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1069', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:56:08', '2018-07-12 19:56:08', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1068', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '19:55:58', '2018-07-12 19:55:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1067', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:55:53', '2018-07-12 19:55:53', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1066', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:55:48', '2018-07-12 19:55:48', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1065', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '19:55:37', '2018-07-12 19:55:37', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1064', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:55:28', '2018-07-12 19:55:28', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1063', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:55:22', '2018-07-12 19:55:22', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1062', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:55:17', '2018-07-12 19:55:17', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1061', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:54:58', '2018-07-12 19:54:58', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1060', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:54:51', '2018-07-12 19:54:51', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1059', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:54:44', '2018-07-12 19:54:44', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1058', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:54:28', '2018-07-12 19:54:28', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1057', 1, 16, 2, 0, 0, 0, 2200, '2018-07-12', '19:54:21', '2018-07-12 19:54:21', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1056', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:54:11', '2018-07-12 19:54:11', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1055', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '19:54:00', '2018-07-12 19:54:00', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1054', 1, 16, 0, 1, 0, 0, 600, '2018-07-12', '19:53:49', '2018-07-12 19:53:49', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1053', 1, 21, 0, 1, 0, 0, 700, '2018-07-12', '19:53:43', '2018-07-12 19:53:43', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1052', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:53:35', '2018-07-12 19:53:35', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1051', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:53:25', '2018-07-12 19:53:25', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1050', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '19:53:18', '2018-07-12 19:53:18', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1049', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '19:53:09', '2018-07-12 19:53:09', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1048', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '19:53:00', '2018-07-12 19:53:00', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1047', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:52:47', '2018-07-12 19:52:47', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1046', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '19:52:42', '2018-07-12 19:52:42', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1045', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:52:27', '2018-07-12 19:52:27', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1044', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '19:52:18', '2018-07-12 19:52:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1043', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '19:52:09', '2018-07-12 19:52:09', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1042', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:52:00', '2018-07-12 19:52:00', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1041', 1, 11, 1, 0, 0, 0, 1100, '2018-07-12', '19:51:53', '2018-07-12 19:51:53', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1040', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:51:47', '2018-07-12 19:51:47', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1039', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '19:51:40', '2018-07-12 19:51:40', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1038', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '19:51:34', '2018-07-12 19:51:34', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1037', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '19:51:27', '2018-07-12 19:51:27', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1036', 1, 18, 1, 0, 0, 0, 1300, '2018-07-12', '19:51:18', '2018-07-12 19:51:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1035', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:50:49', '2018-07-12 19:50:49', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1034', 1, 9, 2, 0, 0, 0, 2000, '2018-07-12', '19:50:26', '2018-07-12 19:50:26', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1033', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '19:49:57', '2018-07-12 19:49:57', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1032', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '19:49:52', '2018-07-12 19:49:52', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1031', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '19:49:48', '2018-07-12 19:49:48', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1030', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '19:49:41', '2018-07-12 19:49:41', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, '0000', '1029', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '19:49:33', '2018-07-12 19:49:33', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 5, 102, 'CARD', '1028', 1, 1, 1, 0, 0, 0, 0, '2018-07-12', '19:49:20', '2018-07-12 19:49:20', '5925', '02', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1027', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:19:26', '2018-07-12 19:19:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1026', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:18:21', '2018-07-12 19:18:21', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1025', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:17:57', '2018-07-12 19:17:57', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1024', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:17:40', '2018-07-12 19:17:40', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1023', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:17:28', '2018-07-12 19:17:28', '2016047', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1022', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:17:08', '2018-07-12 19:17:08', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1021', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:17:00', '2018-07-12 19:17:00', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1020', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:16:48', '2018-07-12 19:16:48', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1019', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:16:43', '2018-07-12 19:16:43', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1018', 9, 9, 1, 0, 0, 0, 0, '2018-07-12', '19:16:11', '2018-07-12 19:16:11', '2016047', '02', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1017', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:16:04', '2018-07-12 19:16:04', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1016', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:15:27', '2018-07-12 19:15:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1015', 16, 1, 1, 1, 0, 0, 1700, '2018-07-12', '19:15:11', '2018-07-12 19:15:11', '0', '00', '0', 1100, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1014', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:14:56', '2018-07-12 19:14:56', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1013', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:14:45', '2018-07-12 19:14:45', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1012', 16, 1, 0, 1, 0, 0, 600, '2018-07-12', '19:14:32', '2018-07-12 19:14:32', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1011', 15, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:14:10', '2018-07-12 19:14:10', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1010', 16, 1, 0, 1, 0, 0, 600, '2018-07-12', '19:13:54', '2018-07-12 19:13:54', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1009', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:13:38', '2018-07-12 19:13:38', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1008', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:13:32', '2018-07-12 19:13:32', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1007', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:13:22', '2018-07-12 19:13:22', '201506013', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1006', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:13:12', '2018-07-12 19:13:12', '201604961', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1005', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:13:02', '2018-07-12 19:13:02', '201604588', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '1004', 9, 1, 1, 0, 0, 0, 1000, '2018-07-12', '19:12:47', '2018-07-12 19:12:47', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1003', 16, 1, 1, 1, 0, 0, 1700, '2018-07-12', '19:12:35', '2018-07-12 19:12:35', '201604573', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'RCVT', '1002', 9, 9, 0, 0, 0, 0, 10000, '2018-07-12', '19:12:26', '2018-07-12 19:12:26', '201604573', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1001', 9, 9, 1, 0, 0, 0, 0, '2018-07-12', '19:12:13', '2018-07-12 19:12:13', '2016044', '02', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '1000', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:12:03', '2018-07-12 19:12:03', '2016047', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '999', 9, 1, 1, 0, 0, 0, 1000, '2018-07-12', '19:11:52', '2018-07-12 19:11:52', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '998', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:11:43', '2018-07-12 19:11:43', '201604101', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '997', 9, 1, 1, 0, 0, 0, 1000, '2018-07-12', '19:11:29', '2018-07-12 19:11:29', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '996', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:11:19', '2018-07-12 19:11:19', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '995', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:11:12', '2018-07-12 19:11:12', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '994', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:10:52', '2018-07-12 19:10:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '993', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:09:07', '2018-07-12 19:09:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '992', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:08:55', '2018-07-12 19:08:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '991', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:08:44', '2018-07-12 19:08:44', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '990', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:08:37', '2018-07-12 19:08:37', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '989', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:08:20', '2018-07-12 19:08:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '988', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:07:55', '2018-07-12 19:07:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '987', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:07:46', '2018-07-12 19:07:46', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '986', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:07:38', '2018-07-12 19:07:38', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '985', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:07:30', '2018-07-12 19:07:30', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '984', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:07:18', '2018-07-12 19:07:18', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '983', 16, 6, 1, 0, 0, 0, 1000, '2018-07-12', '19:07:12', '2018-07-12 19:07:12', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '982', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:07:05', '2018-07-12 19:07:05', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '981', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:06:56', '2018-07-12 19:06:56', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '980', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:06:46', '2018-07-12 19:06:46', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '979', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:06:39', '2018-07-12 19:06:39', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '978', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:06:28', '2018-07-12 19:06:28', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '977', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:06:22', '2018-07-12 19:06:22', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '976', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '19:06:11', '2018-07-12 19:06:11', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '975', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:05:57', '2018-07-12 19:05:57', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '974', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:05:50', '2018-07-12 19:05:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '973', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:05:45', '2018-07-12 19:05:45', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '972', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:05:37', '2018-07-12 19:05:37', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '971', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:05:32', '2018-07-12 19:05:32', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '970', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:05:27', '2018-07-12 19:05:27', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '969', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:05:02', '2018-07-12 19:05:02', '201604303', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '968', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:04:50', '2018-07-12 19:04:50', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '967', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:04:37', '2018-07-12 19:04:37', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '966', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:04:30', '2018-07-12 19:04:30', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '965', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:03:59', '2018-07-12 19:03:59', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '964', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '19:03:44', '2018-07-12 19:03:44', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '963', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:03:31', '2018-07-12 19:03:31', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '962', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '19:03:19', '2018-07-12 19:03:19', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '961', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:03:13', '2018-07-12 19:03:13', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '960', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:03:05', '2018-07-12 19:03:05', '201604627', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '959', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '19:02:42', '2018-07-12 19:02:42', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '958', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '19:02:27', '2018-07-12 19:02:27', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '957', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:01:58', '2018-07-12 19:01:58', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '956', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:01:51', '2018-07-12 19:01:51', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '955', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:01:30', '2018-07-12 19:01:30', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '954', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:01:21', '2018-07-12 19:01:21', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '953', 21, 1, 3, 0, 0, 0, 3900, '2018-07-12', '19:01:06', '2018-07-12 19:01:06', '0', '00', '0', 3900, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '952', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:00:58', '2018-07-12 19:00:58', '201604266', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '951', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:00:42', '2018-07-12 19:00:42', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '950', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:00:32', '2018-07-12 19:00:32', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '949', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:00:25', '2018-07-12 19:00:25', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '948', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:00:19', '2018-07-12 19:00:19', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '947', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:59:37', '2018-07-12 18:59:37', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '946', 21, 7, 2, 0, 0, 0, 2200, '2018-07-12', '18:59:29', '2018-07-12 18:59:29', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '945', 21, 1, 4, 0, 0, 0, 5200, '2018-07-12', '18:59:07', '2018-07-12 18:59:07', '0', '00', '0', 5200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, 'CARD', '944', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:58:48', '2018-07-12 18:58:48', '201506012', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '943', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:58:42', '2018-07-12 18:58:42', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '942', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '18:58:22', '2018-07-12 18:58:22', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '941', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:58:11', '2018-07-12 18:58:11', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '940', 21, 1, 3, 0, 0, 0, 3900, '2018-07-12', '18:58:01', '2018-07-12 18:58:01', '0', '00', '0', 3900, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '939', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:57:50', '2018-07-12 18:57:50', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '938', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:57:40', '2018-07-12 18:57:40', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '937', 21, 1, 0, 1, 0, 0, 700, '2018-07-12', '18:57:33', '2018-07-12 18:57:33', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 51, '2018-07-13 02:39:24'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '936', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:57:20', '2018-07-12 18:57:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '935', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:57:11', '2018-07-12 18:57:11', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '934', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '18:56:53', '2018-07-12 18:56:53', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '933', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:56:44', '2018-07-12 18:56:44', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '932', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '18:56:29', '2018-07-12 18:56:29', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '931', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:56:18', '2018-07-12 18:56:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '930', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:56:13', '2018-07-12 18:56:13', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '929', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:56:07', '2018-07-12 18:56:07', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '928', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:55:56', '2018-07-12 18:55:56', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '927', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:55:47', '2018-07-12 18:55:47', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '926', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '18:55:41', '2018-07-12 18:55:41', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '925', 21, 8, 1, 0, 0, 0, 1100, '2018-07-12', '18:55:32', '2018-07-12 18:55:32', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '924', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '18:55:16', '2018-07-12 18:55:16', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23');
INSERT INTO `tbl_trip_ticket_details` (`fldv_waybill_no`, `fldv_conductor_name`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_driver_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_vehicle_number`, `fldi_vehicle_id`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldi_trip_no`, `fldi_route_no`, `fldv_ticket_code`, `fldv_ticket_no`, `fldi_stage_from`, `fldi_stage_to`, `fldi_full_ticket`, `fldi_half_ticket`, `fldi_luggage_ticket`, `fldi_pass_ticket`, `fldi_ticket_fare`, `flddt_ticket_date`, `fldv_ticket_time`, `flddt_ticket_date_time`, `fldv_docket_number`, `fldv_concession_case_code`, `fldv_state_code`, `fldi_full_amount`, `fldi_half_amount`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '923', 21, 10, 1, 0, 0, 0, 1000, '2018-07-12', '18:55:08', '2018-07-12 18:55:08', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '922', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:55:03', '2018-07-12 18:55:03', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '921', 21, 11, 1, 0, 0, 0, 1000, '2018-07-12', '18:54:56', '2018-07-12 18:54:56', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '920', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:54:45', '2018-07-12 18:54:45', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 4, 102, '0000', '919', 21, 9, 1, 0, 0, 0, 1100, '2018-07-12', '18:54:35', '2018-07-12 18:54:35', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '918', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '18:29:59', '2018-07-12 18:29:59', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '917', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '18:29:48', '2018-07-12 18:29:48', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '916', 10, 19, 4, 0, 0, 0, 4000, '2018-07-12', '18:29:24', '2018-07-12 18:29:24', '0', '00', '0', 4000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '915', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '18:29:01', '2018-07-12 18:29:01', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '914', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '18:28:46', '2018-07-12 18:28:46', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '913', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '18:28:42', '2018-07-12 18:28:42', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '912', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '18:28:37', '2018-07-12 18:28:37', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '911', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '18:28:28', '2018-07-12 18:28:28', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '910', 8, 21, 1, 0, 0, 0, 1100, '2018-07-12', '18:24:59', '2018-07-12 18:24:59', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '909', 8, 21, 1, 0, 0, 0, 1100, '2018-07-12', '18:24:51', '2018-07-12 18:24:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '908', 7, 16, 1, 0, 0, 0, 1000, '2018-07-12', '18:24:34', '2018-07-12 18:24:34', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '907', 7, 21, 2, 0, 0, 0, 2200, '2018-07-12', '18:24:09', '2018-07-12 18:24:09', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '906', 7, 16, 1, 0, 0, 0, 1000, '2018-07-12', '18:23:20', '2018-07-12 18:23:20', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '905', 7, 21, 1, 0, 0, 0, 1100, '2018-07-12', '18:23:09', '2018-07-12 18:23:09', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '904', 7, 11, 1, 0, 0, 0, 1000, '2018-07-12', '18:22:40', '2018-07-12 18:22:40', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '903', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '18:03:22', '2018-07-12 18:03:22', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '902', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '18:03:10', '2018-07-12 18:03:10', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '901', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '18:02:57', '2018-07-12 18:02:57', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '900', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '18:02:45', '2018-07-12 18:02:45', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '899', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '18:02:33', '2018-07-12 18:02:33', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '898', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:02:26', '2018-07-12 18:02:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '897', 1, 21, 4, 0, 0, 0, 5200, '2018-07-12', '18:02:10', '2018-07-12 18:02:10', '0', '00', '0', 5200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '896', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '18:01:58', '2018-07-12 18:01:58', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '895', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '18:01:04', '2018-07-12 18:01:04', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '894', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '18:00:48', '2018-07-12 18:00:48', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '893', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:00:21', '2018-07-12 18:00:21', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '892', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '18:00:15', '2018-07-12 18:00:15', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '891', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:00:09', '2018-07-12 18:00:09', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '890', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '18:00:04', '2018-07-12 18:00:04', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '889', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '17:59:57', '2018-07-12 17:59:57', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '888', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:59:50', '2018-07-12 17:59:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '887', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:59:41', '2018-07-12 17:59:41', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '886', 1, 13, 1, 0, 0, 0, 1100, '2018-07-12', '17:59:37', '2018-07-12 17:59:37', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '885', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:59:31', '2018-07-12 17:59:31', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '884', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '17:59:27', '2018-07-12 17:59:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '883', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '17:59:18', '2018-07-12 17:59:18', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '882', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '17:59:13', '2018-07-12 17:59:13', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '881', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:59:08', '2018-07-12 17:59:08', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '880', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '17:59:02', '2018-07-12 17:59:02', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '879', 1, 15, 1, 0, 0, 0, 1100, '2018-07-12', '17:58:57', '2018-07-12 17:58:57', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '878', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:58:50', '2018-07-12 17:58:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '877', 1, 13, 2, 0, 0, 0, 2200, '2018-07-12', '17:58:34', '2018-07-12 17:58:34', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '876', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:58:26', '2018-07-12 17:58:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '875', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '17:58:20', '2018-07-12 17:58:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, 'CARD', '874', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:58:11', '2018-07-12 17:58:11', '201604158', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '873', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:57:59', '2018-07-12 17:57:59', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '872', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '17:57:49', '2018-07-12 17:57:49', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '871', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '17:57:38', '2018-07-12 17:57:38', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '870', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '17:57:32', '2018-07-12 17:57:32', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, 'CONC', '869', 1, 15, 1, 0, 0, 0, 600, '2018-07-12', '17:57:21', '2018-07-12 17:57:21', '684', '01', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '868', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:57:11', '2018-07-12 17:57:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '867', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '17:57:05', '2018-07-12 17:57:05', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '866', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '17:56:59', '2018-07-12 17:56:59', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '865', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '17:56:45', '2018-07-12 17:56:45', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '864', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '17:56:33', '2018-07-12 17:56:33', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '863', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '17:56:28', '2018-07-12 17:56:28', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '862', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '17:56:22', '2018-07-12 17:56:22', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '861', 1, 15, 1, 0, 0, 0, 1100, '2018-07-12', '17:56:14', '2018-07-12 17:56:14', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '860', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '17:56:06', '2018-07-12 17:56:06', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 3, 102, '0000', '859', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '17:56:00', '2018-07-12 17:56:00', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '858', 7, 1, 0, 1, 0, 0, 500, '2018-07-12', '17:28:22', '2018-07-12 17:28:22', '0', '00', '0', 0, 500, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '857', 10, 1, 1, 0, 0, 0, 1000, '2018-07-12', '17:26:30', '2018-07-12 17:26:30', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '856', 10, 1, 1, 0, 0, 0, 1000, '2018-07-12', '17:26:10', '2018-07-12 17:26:10', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '855', 10, 1, 1, 0, 0, 0, 1000, '2018-07-12', '17:25:37', '2018-07-12 17:25:37', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '854', 10, 1, 1, 0, 0, 0, 1000, '2018-07-12', '17:25:23', '2018-07-12 17:25:23', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '853', 15, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:25:12', '2018-07-12 17:25:12', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '852', 10, 1, 1, 0, 0, 0, 1000, '2018-07-12', '17:24:50', '2018-07-12 17:24:50', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '851', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:24:30', '2018-07-12 17:24:30', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '850', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:23:57', '2018-07-12 17:23:57', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '849', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '17:23:40', '2018-07-12 17:23:40', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '848', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:23:30', '2018-07-12 17:23:30', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '847', 16, 1, 0, 1, 0, 0, 600, '2018-07-12', '17:23:16', '2018-07-12 17:23:16', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '846', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:22:46', '2018-07-12 17:22:46', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '845', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:22:40', '2018-07-12 17:22:40', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '844', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:22:32', '2018-07-12 17:22:32', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '843', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:22:19', '2018-07-12 17:22:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '842', 16, 1, 3, 0, 0, 0, 3300, '2018-07-12', '17:22:14', '2018-07-12 17:22:14', '0', '00', '0', 3300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '841', 16, 1, 0, 1, 0, 0, 600, '2018-07-12', '17:21:46', '2018-07-12 17:21:46', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '840', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '17:21:41', '2018-07-12 17:21:41', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '839', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:21:11', '2018-07-12 17:21:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '838', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:20:57', '2018-07-12 17:20:57', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '837', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:20:48', '2018-07-12 17:20:48', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '836', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:20:36', '2018-07-12 17:20:36', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '835', 16, 1, 2, 0, 0, 0, 2200, '2018-07-12', '17:20:25', '2018-07-12 17:20:25', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '834', 16, 1, 0, 1, 0, 0, 600, '2018-07-12', '17:20:09', '2018-07-12 17:20:09', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '833', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:19:56', '2018-07-12 17:19:56', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '832', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:19:45', '2018-07-12 17:19:45', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '831', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:19:39', '2018-07-12 17:19:39', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, 'LUGG', '830', 16, 1, 0, 0, 1, 0, 1700, '2018-07-12', '17:19:27', '2018-07-12 17:19:27', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '829', 16, 1, 3, 0, 0, 0, 3300, '2018-07-12', '17:19:20', '2018-07-12 17:19:20', '0', '00', '0', 3300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '828', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:18:58', '2018-07-12 17:18:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '827', 16, 2, 1, 0, 0, 0, 1100, '2018-07-12', '17:18:43', '2018-07-12 17:18:43', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, 'CARD', '826', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:18:36', '2018-07-12 17:18:36', '201506013', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '825', 16, 1, 1, 0, 0, 0, 1100, '2018-07-12', '17:18:25', '2018-07-12 17:18:25', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '824', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:18:08', '2018-07-12 17:18:08', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '823', 21, 8, 1, 0, 0, 0, 1100, '2018-07-12', '17:18:02', '2018-07-12 17:18:02', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '822', 21, 1, 0, 1, 0, 0, 700, '2018-07-12', '17:17:55', '2018-07-12 17:17:55', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '821', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '17:17:35', '2018-07-12 17:17:35', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '820', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:17:29', '2018-07-12 17:17:29', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '819', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '17:17:23', '2018-07-12 17:17:23', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '818', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:17:13', '2018-07-12 17:17:13', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '817', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:17:05', '2018-07-12 17:17:05', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '816', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:16:56', '2018-07-12 17:16:56', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '815', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:16:51', '2018-07-12 17:16:51', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '814', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:16:37', '2018-07-12 17:16:37', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '813', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:16:24', '2018-07-12 17:16:24', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '812', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '17:16:10', '2018-07-12 17:16:10', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '811', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:16:02', '2018-07-12 17:16:02', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '810', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:15:54', '2018-07-12 17:15:54', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '809', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:15:45', '2018-07-12 17:15:45', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '808', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:15:31', '2018-07-12 17:15:31', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '807', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '17:15:18', '2018-07-12 17:15:18', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '806', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:15:07', '2018-07-12 17:15:07', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '805', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:59', '2018-07-12 17:14:59', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '804', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:55', '2018-07-12 17:14:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '803', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:49', '2018-07-12 17:14:49', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '802', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:43', '2018-07-12 17:14:43', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '801', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:36', '2018-07-12 17:14:36', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '800', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:28', '2018-07-12 17:14:28', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '799', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:20', '2018-07-12 17:14:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, 'RCVT', '798', 21, 21, 0, 0, 0, 0, 10000, '2018-07-12', '17:14:12', '2018-07-12 17:14:12', '0', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, 'CARD', '797', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:14:02', '2018-07-12 17:14:02', '0', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '796', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:13:54', '2018-07-12 17:13:54', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '795', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:13:45', '2018-07-12 17:13:45', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '794', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:13:36', '2018-07-12 17:13:36', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '793', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:13:30', '2018-07-12 17:13:30', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, 'CARD', '792', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:13:23', '2018-07-12 17:13:23', '201604045', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '791', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:13:17', '2018-07-12 17:13:17', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '790', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:13:07', '2018-07-12 17:13:07', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '789', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:12:57', '2018-07-12 17:12:57', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '788', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:12:53', '2018-07-12 17:12:53', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '787', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:12:35', '2018-07-12 17:12:35', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '786', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:12:30', '2018-07-12 17:12:30', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '785', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:12:23', '2018-07-12 17:12:23', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '784', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:12:15', '2018-07-12 17:12:15', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '783', 21, 1, 2, 0, 0, 0, 2600, '2018-07-12', '17:12:04', '2018-07-12 17:12:04', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '782', 21, 8, 1, 0, 0, 0, 1100, '2018-07-12', '17:11:59', '2018-07-12 17:11:59', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '781', 21, 1, 1, 0, 0, 0, 1300, '2018-07-12', '17:11:50', '2018-07-12 17:11:50', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '780', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '17:11:42', '2018-07-12 17:11:42', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '779', 21, 16, 0, 1, 0, 0, 500, '2018-07-12', '17:11:32', '2018-07-12 17:11:32', '0', '00', '0', 0, 500, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '778', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '17:11:26', '2018-07-12 17:11:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 2, 102, '0000', '777', 21, 7, 1, 0, 0, 0, 1100, '2018-07-12', '17:11:19', '2018-07-12 17:11:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '776', 10, 21, 1, 0, 0, 0, 1000, '2018-07-12', '16:53:04', '2018-07-12 16:53:04', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '775', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:38:40', '2018-07-12 16:38:40', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '774', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:38:10', '2018-07-12 16:38:10', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '773', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:38:03', '2018-07-12 16:38:03', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '772', 1, 15, 1, 0, 0, 0, 1100, '2018-07-12', '16:37:42', '2018-07-12 16:37:42', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '771', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:37:35', '2018-07-12 16:37:35', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '770', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:37:20', '2018-07-12 16:37:20', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '769', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '16:37:00', '2018-07-12 16:37:00', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '768', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:36:54', '2018-07-12 16:36:54', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '767', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:36:49', '2018-07-12 16:36:49', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '766', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '16:36:26', '2018-07-12 16:36:26', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '765', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:36:20', '2018-07-12 16:36:20', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23');
INSERT INTO `tbl_trip_ticket_details` (`fldv_waybill_no`, `fldv_conductor_name`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_driver_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_vehicle_number`, `fldi_vehicle_id`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldi_trip_no`, `fldi_route_no`, `fldv_ticket_code`, `fldv_ticket_no`, `fldi_stage_from`, `fldi_stage_to`, `fldi_full_ticket`, `fldi_half_ticket`, `fldi_luggage_ticket`, `fldi_pass_ticket`, `fldi_ticket_fare`, `flddt_ticket_date`, `fldv_ticket_time`, `flddt_ticket_date_time`, `fldv_docket_number`, `fldv_concession_case_code`, `fldv_state_code`, `fldi_full_amount`, `fldi_half_amount`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '764', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:36:10', '2018-07-12 16:36:10', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '763', 1, 7, 1, 0, 0, 0, 1000, '2018-07-12', '16:36:06', '2018-07-12 16:36:06', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '762', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:35:54', '2018-07-12 16:35:54', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '761', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:35:50', '2018-07-12 16:35:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '760', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:35:33', '2018-07-12 16:35:33', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '759', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:35:17', '2018-07-12 16:35:17', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '758', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:35:11', '2018-07-12 16:35:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '757', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:35:04', '2018-07-12 16:35:04', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '756', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:34:56', '2018-07-12 16:34:56', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '755', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:34:45', '2018-07-12 16:34:45', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '753', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:34:18', '2018-07-12 16:34:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '754', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:34:30', '2018-07-12 16:34:30', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '752', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:34:00', '2018-07-12 16:34:00', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '751', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '16:33:53', '2018-07-12 16:33:53', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '750', 1, 16, 2, 0, 0, 0, 2200, '2018-07-12', '16:33:37', '2018-07-12 16:33:37', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, 'LUGG', '749', 1, 19, 0, 0, 1, 0, 700, '2018-07-12', '16:33:27', '2018-07-12 16:33:27', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '748', 1, 19, 1, 0, 0, 0, 1300, '2018-07-12', '16:33:25', '2018-07-12 16:33:25', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '747', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '16:33:17', '2018-07-12 16:33:17', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '746', 1, 10, 1, 0, 0, 0, 1000, '2018-07-12', '16:33:04', '2018-07-12 16:33:04', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, 'LUGG', '745', 1, 17, 0, 0, 1, 0, 900, '2018-07-12', '16:32:53', '2018-07-12 16:32:53', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '744', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:32:13', '2018-07-12 16:32:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '743', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:31:56', '2018-07-12 16:31:56', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '742', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:31:50', '2018-07-12 16:31:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '741', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:31:42', '2018-07-12 16:31:42', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '740', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:31:37', '2018-07-12 16:31:37', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '739', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:31:29', '2018-07-12 16:31:29', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '738', 1, 20, 1, 0, 0, 0, 1300, '2018-07-12', '16:31:22', '2018-07-12 16:31:22', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '737', 1, 8, 3, 0, 0, 0, 3000, '2018-07-12', '16:31:10', '2018-07-12 16:31:10', '0', '00', '0', 3000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '736', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:30:51', '2018-07-12 16:30:51', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '735', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '16:30:45', '2018-07-12 16:30:45', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '734', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:30:32', '2018-07-12 16:30:32', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '733', 1, 10, 2, 0, 0, 0, 2000, '2018-07-12', '16:30:24', '2018-07-12 16:30:24', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '732', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:30:19', '2018-07-12 16:30:19', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '731', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '16:30:08', '2018-07-12 16:30:08', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '730', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:29:29', '2018-07-12 16:29:29', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '729', 1, 9, 2, 0, 0, 0, 2000, '2018-07-12', '16:29:00', '2018-07-12 16:29:00', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '728', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '16:28:53', '2018-07-12 16:28:53', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '727', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:28:43', '2018-07-12 16:28:43', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '726', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:27:50', '2018-07-12 16:27:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '725', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '16:27:28', '2018-07-12 16:27:28', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '724', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:27:13', '2018-07-12 16:27:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '723', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:27:04', '2018-07-12 16:27:04', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '722', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:26:58', '2018-07-12 16:26:58', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, 'CARD', '721', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:26:47', '2018-07-12 16:26:47', '201604848', '03', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '720', 1, 21, 3, 0, 0, 0, 3900, '2018-07-12', '16:26:34', '2018-07-12 16:26:34', '0', '00', '0', 3900, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '719', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:26:27', '2018-07-12 16:26:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '718', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:26:21', '2018-07-12 16:26:21', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '717', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:26:12', '2018-07-12 16:26:12', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '716', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '16:26:05', '2018-07-12 16:26:05', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '715', 1, 18, 1, 0, 0, 0, 1300, '2018-07-12', '16:25:57', '2018-07-12 16:25:57', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '714', 1, 21, 0, 1, 0, 0, 700, '2018-07-12', '16:25:37', '2018-07-12 16:25:37', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '713', 1, 17, 1, 0, 0, 0, 1100, '2018-07-12', '16:25:27', '2018-07-12 16:25:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '712', 1, 21, 2, 0, 0, 0, 2600, '2018-07-12', '16:25:08', '2018-07-12 16:25:08', '0', '00', '0', 2600, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '711', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:25:00', '2018-07-12 16:25:00', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '710', 1, 13, 0, 1, 0, 0, 600, '2018-07-12', '16:24:54', '2018-07-12 16:24:54', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '709', 1, 19, 0, 1, 0, 0, 700, '2018-07-12', '16:24:46', '2018-07-12 16:24:46', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '708', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '16:24:35', '2018-07-12 16:24:35', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '707', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:24:26', '2018-07-12 16:24:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '706', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:24:19', '2018-07-12 16:24:19', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '705', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:24:14', '2018-07-12 16:24:14', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '704', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:24:04', '2018-07-12 16:24:04', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '703', 1, 8, 1, 0, 0, 0, 1000, '2018-07-12', '16:23:52', '2018-07-12 16:23:52', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, 'LUGG', '702', 1, 16, 0, 0, 1, 0, 900, '2018-07-12', '16:23:46', '2018-07-12 16:23:46', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '701', 1, 16, 1, 0, 0, 0, 1100, '2018-07-12', '16:23:43', '2018-07-12 16:23:43', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '700', 1, 9, 1, 0, 0, 0, 1000, '2018-07-12', '16:23:38', '2018-07-12 16:23:38', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '699', 1, 16, 0, 1, 0, 0, 600, '2018-07-12', '16:23:32', '2018-07-12 16:23:32', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '698', 1, 21, 1, 0, 0, 0, 1300, '2018-07-12', '16:23:18', '2018-07-12 16:23:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487510', 'Ramesh Sarichand Rathod', 310, 'C 12443', '', 0, '', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '389', '12/07/1815:42:48', 1, 102, '0000', '697', 1, 13, 1, 0, 0, 0, 1100, '2018-07-12', '16:23:00', '2018-07-12 16:23:00', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 51, '2018-07-13 02:39:23'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 10, 202, '0000', '7878', 25, 10, 1, 0, 0, 0, 1000, '2018-07-13', '00:47:50', '2018-07-13 00:47:50', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7860', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:18:57', '2018-07-13 00:18:57', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7861', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:19:05', '2018-07-13 00:19:05', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7862', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:19:23', '2018-07-13 00:19:23', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7863', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:19:52', '2018-07-13 00:19:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7864', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:20:12', '2018-07-13 00:20:12', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7865', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:20:25', '2018-07-13 00:20:25', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7866', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:20:50', '2018-07-13 00:20:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7867', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:20:55', '2018-07-13 00:20:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7868', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:21:07', '2018-07-13 00:21:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7869', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:21:47', '2018-07-13 00:21:47', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7870', 1, 28, 1, 0, 0, 0, 1300, '2018-07-13', '00:22:05', '2018-07-13 00:22:05', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7871', 10, 22, 1, 0, 0, 0, 1000, '2018-07-13', '00:27:01', '2018-07-13 00:27:01', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7872', 10, 25, 2, 0, 0, 0, 2000, '2018-07-13', '00:27:23', '2018-07-13 00:27:23', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:14'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7873', 10, 22, 1, 0, 0, 0, 1000, '2018-07-13', '00:29:01', '2018-07-13 00:29:01', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7874', 10, 22, 1, 0, 0, 0, 1000, '2018-07-13', '00:29:20', '2018-07-13 00:29:20', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 10, 202, '0000', '7875', 28, 1, 1, 0, 0, 0, 1300, '2018-07-13', '00:40:24', '2018-07-13 00:40:24', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 10, 202, '0000', '7876', 28, 1, 1, 0, 0, 0, 1300, '2018-07-13', '00:41:16', '2018-07-13 00:41:16', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 10, 202, '0000', '7877', 28, 1, 1, 0, 0, 0, 1300, '2018-07-13', '00:41:33', '2018-07-13 00:41:33', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 8, 202, '0000', '7842', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '22:56:50', '2018-07-12 22:56:50', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 8, 202, '0000', '7843', 30, 17, 1, 0, 0, 0, 1100, '2018-07-12', '22:57:19', '2018-07-12 22:57:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 8, 202, '0000', '7844', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '23:00:23', '2018-07-12 23:00:23', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 8, 202, '0000', '7845', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '23:00:57', '2018-07-12 23:00:57', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 8, 202, '0000', '7846', 28, 1, 3, 0, 0, 0, 3900, '2018-07-12', '23:02:29', '2018-07-12 23:02:29', '0', '00', '0', 3900, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7847', 1, 17, 0, 1, 0, 0, 500, '2018-07-13', '00:14:44', '2018-07-13 00:14:44', '0', '00', '0', 0, 500, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7848', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:15:15', '2018-07-13 00:15:15', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7849', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:15:25', '2018-07-13 00:15:25', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7850', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:15:37', '2018-07-13 00:15:37', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7851', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:15:49', '2018-07-13 00:15:49', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7852', 1, 28, 1, 0, 0, 0, 1300, '2018-07-13', '00:16:14', '2018-07-13 00:16:14', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7853', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:17:06', '2018-07-13 00:17:06', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7854', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:17:19', '2018-07-13 00:17:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7855', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:18:00', '2018-07-13 00:18:00', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7856', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:18:18', '2018-07-13 00:18:18', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7857', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:18:26', '2018-07-13 00:18:26', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7858', 1, 25, 1, 0, 0, 0, 1100, '2018-07-13', '00:18:37', '2018-07-13 00:18:37', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 9, 202, '0000', '7859', 1, 17, 1, 0, 0, 0, 1000, '2018-07-13', '00:18:47', '2018-07-13 00:18:47', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7824', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:36:10', '2018-07-12 22:36:10', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7825', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:36:20', '2018-07-12 22:36:20', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7826', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:36:53', '2018-07-12 22:36:53', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7827', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:37:14', '2018-07-12 22:37:14', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7828', 1, 25, 3, 0, 0, 0, 3300, '2018-07-12', '22:37:30', '2018-07-12 22:37:30', '0', '00', '0', 3300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7829', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:37:48', '2018-07-12 22:37:48', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7830', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:38:00', '2018-07-12 22:38:00', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7831', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:38:41', '2018-07-12 22:38:41', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7832', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:38:52', '2018-07-12 22:38:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7833', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:39:03', '2018-07-12 22:39:03', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7834', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:39:12', '2018-07-12 22:39:12', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7835', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:39:24', '2018-07-12 22:39:24', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7836', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:39:51', '2018-07-12 22:39:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7837', 1, 17, 2, 0, 0, 0, 2000, '2018-07-12', '22:41:17', '2018-07-12 22:41:17', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7838', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:41:59', '2018-07-12 22:41:59', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7839', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:42:20', '2018-07-12 22:42:20', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7840', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '22:42:40', '2018-07-12 22:42:40', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7841', 15, 28, 1, 0, 0, 0, 1100, '2018-07-12', '22:44:03', '2018-07-12 22:44:03', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7808', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '22:31:32', '2018-07-12 22:31:32', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7809', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:31:49', '2018-07-12 22:31:49', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7810', 1, 25, 0, 1, 0, 0, 600, '2018-07-12', '22:32:08', '2018-07-12 22:32:08', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7811', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:32:36', '2018-07-12 22:32:36', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7812', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:32:49', '2018-07-12 22:32:49', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7813', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:32:59', '2018-07-12 22:32:59', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7814', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:33:09', '2018-07-12 22:33:09', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7815', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:33:23', '2018-07-12 22:33:23', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7816', 1, 30, 1, 0, 0, 0, 1500, '2018-07-12', '22:33:39', '2018-07-12 22:33:39', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7817', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:33:55', '2018-07-12 22:33:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7818', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:34:40', '2018-07-12 22:34:40', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7819', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:34:47', '2018-07-12 22:34:47', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7820', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:35:07', '2018-07-12 22:35:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7821', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:35:26', '2018-07-12 22:35:26', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7822', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:35:35', '2018-07-12 22:35:35', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7823', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:35:49', '2018-07-12 22:35:49', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7795', 22, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:32:53', '2018-07-12 21:32:53', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7796', 22, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:33:04', '2018-07-12 21:33:04', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7797', 22, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:33:55', '2018-07-12 21:33:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7798', 22, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:34:13', '2018-07-12 21:34:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7799', 1, 9, 1, 0, 0, 0, 700, '2018-07-12', '22:28:23', '2018-07-12 22:28:23', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7800', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:29:07', '2018-07-12 22:29:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7801', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:29:18', '2018-07-12 22:29:18', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7802', 1, 17, 2, 0, 0, 0, 2000, '2018-07-12', '22:29:37', '2018-07-12 22:29:37', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7803', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '22:30:04', '2018-07-12 22:30:04', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7804', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:30:22', '2018-07-12 22:30:22', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7805', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:30:48', '2018-07-12 22:30:48', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13');
INSERT INTO `tbl_trip_ticket_details` (`fldv_waybill_no`, `fldv_conductor_name`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_driver_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_vehicle_number`, `fldi_vehicle_id`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldi_trip_no`, `fldi_route_no`, `fldv_ticket_code`, `fldv_ticket_no`, `fldi_stage_from`, `fldi_stage_to`, `fldi_full_ticket`, `fldi_half_ticket`, `fldi_luggage_ticket`, `fldi_pass_ticket`, `fldi_ticket_fare`, `flddt_ticket_date`, `fldv_ticket_time`, `flddt_ticket_date_time`, `fldv_docket_number`, `fldv_concession_case_code`, `fldv_state_code`, `fldi_full_amount`, `fldi_half_amount`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7806', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '22:30:58', '2018-07-12 22:30:58', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 7, 202, '0000', '7807', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '22:31:19', '2018-07-12 22:31:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7783', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '21:14:53', '2018-07-12 21:14:53', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7784', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:15:07', '2018-07-12 21:15:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7785', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '21:17:08', '2018-07-12 21:17:08', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7786', 22, 10, 2, 0, 0, 0, 2000, '2018-07-12', '21:29:54', '2018-07-12 21:29:54', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7787', 22, 1, 2, 0, 0, 0, 2200, '2018-07-12', '21:30:12', '2018-07-12 21:30:12', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7788', 22, 17, 1, 0, 0, 0, 700, '2018-07-12', '21:30:46', '2018-07-12 21:30:46', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7789', 22, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:30:59', '2018-07-12 21:30:59', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7790', 22, 10, 2, 0, 0, 0, 2000, '2018-07-12', '21:31:26', '2018-07-12 21:31:26', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7791', 22, 10, 1, 0, 0, 0, 1000, '2018-07-12', '21:31:39', '2018-07-12 21:31:39', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7792', 22, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:31:52', '2018-07-12 21:31:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7793', 22, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:32:19', '2018-07-12 21:32:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 6, 202, '0000', '7794', 22, 1, 1, 0, 0, 0, 1100, '2018-07-12', '21:32:39', '2018-07-12 21:32:39', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7771', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:10:25', '2018-07-12 21:10:25', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7772', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:11:29', '2018-07-12 21:11:29', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7773', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:11:40', '2018-07-12 21:11:40', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7774', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:11:55', '2018-07-12 21:11:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7775', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:13:11', '2018-07-12 21:13:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7776', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '21:13:20', '2018-07-12 21:13:20', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7777', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '21:13:26', '2018-07-12 21:13:26', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7778', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:13:39', '2018-07-12 21:13:39', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7779', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:13:51', '2018-07-12 21:13:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7780', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:14:10', '2018-07-12 21:14:10', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7781', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '21:14:29', '2018-07-12 21:14:29', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7782', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:14:42', '2018-07-12 21:14:42', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7758', 28, 1, 0, 1, 0, 0, 700, '2018-07-12', '20:39:55', '2018-07-12 20:39:55', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7759', 25, 10, 1, 0, 0, 0, 1000, '2018-07-12', '20:40:06', '2018-07-12 20:40:06', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7760', 25, 10, 2, 0, 0, 0, 2000, '2018-07-12', '20:40:38', '2018-07-12 20:40:38', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7761', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:41:29', '2018-07-12 20:41:29', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7762', 9, 1, 0, 1, 0, 0, 400, '2018-07-12', '20:58:05', '2018-07-12 20:58:05', '0', '00', '0', 0, 400, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7763', 15, 1, 1, 0, 0, 0, 1000, '2018-07-12', '20:59:36', '2018-07-12 20:59:36', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7764', 1, 9, 1, 0, 0, 0, 700, '2018-07-12', '21:08:18', '2018-07-12 21:08:18', '0', '00', '0', 700, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7765', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '21:08:40', '2018-07-12 21:08:40', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7766', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:08:51', '2018-07-12 21:08:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7767', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:09:23', '2018-07-12 21:09:23', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7768', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:09:41', '2018-07-12 21:09:41', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7769', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:09:52', '2018-07-12 21:09:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 5, 202, '0000', '7770', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '21:10:13', '2018-07-12 21:10:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7745', 28, 10, 2, 0, 0, 0, 2200, '2018-07-12', '20:34:51', '2018-07-12 20:34:51', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7746', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:35:19', '2018-07-12 20:35:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, 'CARD', '7747', 25, 1, 2, 0, 0, 0, 2200, '2018-07-12', '20:35:43', '2018-07-12 20:35:43', '201506016', '03', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7748', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:36:02', '2018-07-12 20:36:02', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7749', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:36:25', '2018-07-12 20:36:25', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7750', 25, 1, 3, 0, 0, 0, 3300, '2018-07-12', '20:36:37', '2018-07-12 20:36:37', '0', '00', '0', 3300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7751', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:37:07', '2018-07-12 20:37:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7752', 25, 1, 2, 0, 0, 0, 2200, '2018-07-12', '20:37:18', '2018-07-12 20:37:18', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7753', 25, 1, 0, 1, 0, 0, 600, '2018-07-12', '20:37:59', '2018-07-12 20:37:59', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7754', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:38:39', '2018-07-12 20:38:39', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7755', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:38:55', '2018-07-12 20:38:55', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7756', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:39:08', '2018-07-12 20:39:08', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7757', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:39:23', '2018-07-12 20:39:23', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7732', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:28:30', '2018-07-12 20:28:30', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7733', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:28:41', '2018-07-12 20:28:41', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7734', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:28:49', '2018-07-12 20:28:49', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7735', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:29:24', '2018-07-12 20:29:24', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7736', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:30:21', '2018-07-12 20:30:21', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7737', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:31:19', '2018-07-12 20:31:19', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7738', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:31:43', '2018-07-12 20:31:43', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7739', 28, 1, 0, 1, 0, 0, 700, '2018-07-12', '20:31:57', '2018-07-12 20:31:57', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, 'CARD', '7740', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:32:07', '2018-07-12 20:32:07', '201604942', '03', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7741', 25, 1, 2, 0, 0, 0, 2200, '2018-07-12', '20:32:35', '2018-07-12 20:32:35', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7742', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:33:40', '2018-07-12 20:33:40', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7743', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '20:33:46', '2018-07-12 20:33:46', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7744', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:34:25', '2018-07-12 20:34:25', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7719', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:23:24', '2018-07-12 20:23:24', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, 'CARD', '7720', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:23:38', '2018-07-12 20:23:38', '201604507', '03', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7721', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:23:49', '2018-07-12 20:23:49', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7722', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:24:14', '2018-07-12 20:24:14', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7723', 30, 1, 3, 0, 0, 0, 4500, '2018-07-12', '20:24:30', '2018-07-12 20:24:30', '0', '00', '0', 4500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7724', 30, 1, 2, 0, 0, 0, 3000, '2018-07-12', '20:25:08', '2018-07-12 20:25:08', '0', '00', '0', 3000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7725', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:26:34', '2018-07-12 20:26:34', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7726', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:27:13', '2018-07-12 20:27:13', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7727', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:27:23', '2018-07-12 20:27:23', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7728', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:27:35', '2018-07-12 20:27:35', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7729', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:27:47', '2018-07-12 20:27:47', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7730', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:27:59', '2018-07-12 20:27:59', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7731', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '20:28:21', '2018-07-12 20:28:21', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7706', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:18:08', '2018-07-12 20:18:08', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7707', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '20:18:23', '2018-07-12 20:18:23', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, 'CARD', '7708', 30, 10, 0, 1, 0, 0, 700, '2018-07-12', '20:18:56', '2018-07-12 20:18:56', '201604510', '03', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7709', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '20:19:11', '2018-07-12 20:19:11', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7710', 30, 1, 7, 2, 0, 0, 12100, '2018-07-12', '20:19:38', '2018-07-12 20:19:38', '0', '00', '0', 10500, 1600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7711', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:20:20', '2018-07-12 20:20:20', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7712', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '20:20:47', '2018-07-12 20:20:47', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7713', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:21:16', '2018-07-12 20:21:16', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7714', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '20:21:50', '2018-07-12 20:21:50', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7715', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:22:04', '2018-07-12 20:22:04', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7716', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:22:41', '2018-07-12 20:22:41', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7717', 30, 17, 0, 1, 0, 0, 600, '2018-07-12', '20:22:59', '2018-07-12 20:22:59', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7718', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '20:23:14', '2018-07-12 20:23:14', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7693', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '19:44:39', '2018-07-12 19:44:39', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, 'CARD', '7694', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '19:44:55', '2018-07-12 19:44:55', '201506011', '03', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7695', 1, 25, 0, 1, 0, 0, 600, '2018-07-12', '19:45:24', '2018-07-12 19:45:24', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7696', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '19:45:35', '2018-07-12 19:45:35', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7697', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '19:45:50', '2018-07-12 19:45:50', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7698', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '19:46:07', '2018-07-12 19:46:07', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7699', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '19:46:19', '2018-07-12 19:46:19', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7700', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '19:47:01', '2018-07-12 19:47:01', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7701', 1, 25, 3, 0, 0, 0, 3300, '2018-07-12', '19:49:14', '2018-07-12 19:49:14', '0', '00', '0', 3300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7702', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '19:51:16', '2018-07-12 19:51:16', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7703', 25, 30, 1, 0, 0, 0, 1000, '2018-07-12', '20:12:08', '2018-07-12 20:12:08', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7704', 25, 30, 2, 0, 0, 0, 2000, '2018-07-12', '20:12:59', '2018-07-12 20:12:59', '0', '00', '0', 2000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 4, 202, '0000', '7705', 30, 25, 1, 0, 0, 0, 1000, '2018-07-12', '20:17:45', '2018-07-12 20:17:45', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7681', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:04:23', '2018-07-12 19:04:23', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7682', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:05:00', '2018-07-12 19:05:00', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7683', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:05:46', '2018-07-12 19:05:46', '10021', '03', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7684', 25, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:06:04', '2018-07-12 19:06:04', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7685', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:06:28', '2018-07-12 19:06:28', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7686', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:06:50', '2018-07-12 19:06:50', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7687', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:08:24', '2018-07-12 19:08:24', '201506014', '03', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7688', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:08:41', '2018-07-12 19:08:41', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7689', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:09:38', '2018-07-12 19:09:38', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7690', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:10:00', '2018-07-12 19:10:00', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'LUGG', '7691', 25, 1, 0, 0, 1, 0, 500, '2018-07-12', '19:21:15', '2018-07-12 19:21:15', '0', '00', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 3, 202, '0000', '7692', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '19:44:26', '2018-07-12 19:44:26', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7669', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '18:59:13', '2018-07-12 18:59:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7670', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '18:59:27', '2018-07-12 18:59:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7671', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:59:58', '2018-07-12 18:59:58', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7672', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:00:21', '2018-07-12 19:00:21', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7673', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:00:48', '2018-07-12 19:00:48', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7674', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '19:01:02', '2018-07-12 19:01:02', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7675', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '19:01:28', '2018-07-12 19:01:28', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7676', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:02:24', '2018-07-12 19:02:24', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7677', 25, 25, 1, 0, 0, 0, 0, '2018-07-12', '19:03:01', '2018-07-12 19:03:01', '201604838', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7678', 25, 1, 2, 0, 0, 0, 2200, '2018-07-12', '19:03:27', '2018-07-12 19:03:27', '0', '00', '0', 2200, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7679', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:03:48', '2018-07-12 19:03:48', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7680', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '19:04:04', '2018-07-12 19:04:04', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7658', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:54:28', '2018-07-12 18:54:28', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7659', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:54:44', '2018-07-12 18:54:44', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7660', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:54:52', '2018-07-12 18:54:52', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7661', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:55:16', '2018-07-12 18:55:16', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7662', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:55:47', '2018-07-12 18:55:47', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7663', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:56:18', '2018-07-12 18:56:18', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7664', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:56:36', '2018-07-12 18:56:36', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7665', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:57:22', '2018-07-12 18:57:22', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7666', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:57:43', '2018-07-12 18:57:43', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7667', 28, 1, 1, 0, 0, 0, 1300, '2018-07-12', '18:58:17', '2018-07-12 18:58:17', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7668', 25, 1, 1, 0, 0, 0, 1100, '2018-07-12', '18:58:58', '2018-07-12 18:58:58', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7647', 30, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:51:11', '2018-07-12 18:51:11', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7648', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:51:39', '2018-07-12 18:51:39', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7649', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:52:06', '2018-07-12 18:52:06', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7650', 30, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:52:27', '2018-07-12 18:52:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7651', 30, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:52:37', '2018-07-12 18:52:37', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13');
INSERT INTO `tbl_trip_ticket_details` (`fldv_waybill_no`, `fldv_conductor_name`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_driver_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_vehicle_number`, `fldi_vehicle_id`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldi_trip_no`, `fldi_route_no`, `fldv_ticket_code`, `fldv_ticket_no`, `fldi_stage_from`, `fldi_stage_to`, `fldi_full_ticket`, `fldi_half_ticket`, `fldi_luggage_ticket`, `fldi_pass_ticket`, `fldi_ticket_fare`, `flddt_ticket_date`, `fldv_ticket_time`, `flddt_ticket_date_time`, `fldv_docket_number`, `fldv_concession_case_code`, `fldv_state_code`, `fldi_full_amount`, `fldi_half_amount`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7652', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:52:47', '2018-07-12 18:52:47', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7653', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:53:05', '2018-07-12 18:53:05', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7654', 30, 1, 2, 0, 0, 0, 3000, '2018-07-12', '18:53:30', '2018-07-12 18:53:30', '0', '00', '0', 3000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7655', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:53:41', '2018-07-12 18:53:41', '201604386', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7656', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:54:02', '2018-07-12 18:54:02', '201604779', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7657', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:54:17', '2018-07-12 18:54:17', '201604716', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7637', 30, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:47:35', '2018-07-12 18:47:35', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7638', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:47:56', '2018-07-12 18:47:56', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7639', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:48:07', '2018-07-12 18:48:07', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7640', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:48:17', '2018-07-12 18:48:17', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7641', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '18:48:40', '2018-07-12 18:48:40', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7642', 30, 1, 2, 0, 0, 0, 3000, '2018-07-12', '18:49:10', '2018-07-12 18:49:10', '0', '00', '0', 3000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7643', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '18:49:37', '2018-07-12 18:49:37', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7644', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:49:49', '2018-07-12 18:49:49', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7645', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:50:24', '2018-07-12 18:50:24', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7646', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:51:02', '2018-07-12 18:51:02', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7627', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:44:27', '2018-07-12 18:44:27', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7628', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:44:35', '2018-07-12 18:44:35', '201604547', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7629', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:44:45', '2018-07-12 18:44:45', '201506016', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7630', 30, 1, 0, 1, 0, 0, 800, '2018-07-12', '18:44:55', '2018-07-12 18:44:55', '0', '00', '0', 0, 800, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7631', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:45:06', '2018-07-12 18:45:06', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7632', 30, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:45:20', '2018-07-12 18:45:20', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7633', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:45:33', '2018-07-12 18:45:33', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7634', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:45:44', '2018-07-12 18:45:44', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7635', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:45:56', '2018-07-12 18:45:56', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7636', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:46:19', '2018-07-12 18:46:19', '201604787', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7618', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:42:01', '2018-07-12 18:42:01', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7619', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:42:21', '2018-07-12 18:42:21', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7620', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:42:33', '2018-07-12 18:42:33', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7621', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:42:43', '2018-07-12 18:42:43', '201604389', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7622', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:42:52', '2018-07-12 18:42:52', '201604437', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7623', 30, 17, 5, 0, 0, 0, 5500, '2018-07-12', '18:43:03', '2018-07-12 18:43:03', '0', '00', '0', 5500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7624', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:43:32', '2018-07-12 18:43:32', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7625', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:43:46', '2018-07-12 18:43:46', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7626', 30, 17, 1, 0, 0, 0, 1100, '2018-07-12', '18:43:51', '2018-07-12 18:43:51', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7609', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:40:05', '2018-07-12 18:40:05', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7610', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '18:40:14', '2018-07-12 18:40:14', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7611', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:40:28', '2018-07-12 18:40:28', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7612', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:40:37', '2018-07-12 18:40:37', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7613', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '18:40:41', '2018-07-12 18:40:41', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7614', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:40:56', '2018-07-12 18:40:56', '201604881', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7615', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:41:16', '2018-07-12 18:41:16', '201604389', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7616', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:41:25', '2018-07-12 18:41:25', '201506012', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7617', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:41:38', '2018-07-12 18:41:38', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7601', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:37:39', '2018-07-12 18:37:39', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7602', 30, 10, 1, 0, 0, 0, 1300, '2018-07-12', '18:38:23', '2018-07-12 18:38:23', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7603', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:38:41', '2018-07-12 18:38:41', '201604389', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7604', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:38:52', '2018-07-12 18:38:52', '201604716', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7605', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:39:09', '2018-07-12 18:39:09', '201604728', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7606', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:39:18', '2018-07-12 18:39:18', '201604835', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7607', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:39:28', '2018-07-12 18:39:28', '201604862', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7608', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:39:51', '2018-07-12 18:39:51', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7594', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:36:14', '2018-07-12 18:36:14', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7595', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:36:25', '2018-07-12 18:36:25', '201604836', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7596', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:36:37', '2018-07-12 18:36:37', '201604377', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7597', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:36:48', '2018-07-12 18:36:48', '201604647', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7598', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:36:58', '2018-07-12 18:36:58', '201604785', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7599', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:37:10', '2018-07-12 18:37:10', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7600', 30, 1, 2, 0, 0, 0, 3000, '2018-07-12', '18:37:25', '2018-07-12 18:37:25', '0', '00', '0', 3000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7588', 17, 29, 1, 0, 0, 0, 1000, '2018-07-12', '18:19:30', '2018-07-12 18:19:30', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7589', 28, 30, 1, 0, 0, 0, 1000, '2018-07-12', '18:27:10', '2018-07-12 18:27:10', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7590', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:35:09', '2018-07-12 18:35:09', '201604642', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7591', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:35:19', '2018-07-12 18:35:19', '201604707', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, 'CARD', '7592', 30, 30, 1, 0, 0, 0, 0, '2018-07-12', '18:35:44', '2018-07-12 18:35:44', '201604358', '02', '0', 0, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 2, 202, '0000', '7593', 30, 1, 1, 0, 0, 0, 1500, '2018-07-12', '18:36:01', '2018-07-12 18:36:01', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7583', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:08:08', '2018-07-12 18:08:08', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7584', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '18:08:38', '2018-07-12 18:08:38', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7585', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:09:04', '2018-07-12 18:09:04', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7586', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '18:09:21', '2018-07-12 18:09:21', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7587', 17, 30, 1, 0, 0, 0, 1100, '2018-07-12', '18:18:59', '2018-07-12 18:18:59', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7579', 1, 25, 1, 2, 0, 0, 2300, '2018-07-12', '18:05:54', '2018-07-12 18:05:54', '0', '00', '0', 1100, 1200, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7580', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:06:42', '2018-07-12 18:06:42', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7581', 1, 25, 0, 1, 0, 0, 600, '2018-07-12', '18:07:43', '2018-07-12 18:07:43', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7582', 1, 25, 0, 1, 0, 0, 600, '2018-07-12', '18:07:56', '2018-07-12 18:07:56', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7576', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:04:52', '2018-07-12 18:04:52', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7577', 1, 25, 0, 1, 0, 0, 600, '2018-07-12', '18:05:09', '2018-07-12 18:05:09', '0', '00', '0', 0, 600, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7578', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:05:27', '2018-07-12 18:05:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7573', 1, 17, 1, 0, 0, 0, 1000, '2018-07-12', '18:03:42', '2018-07-12 18:03:42', '0', '00', '0', 1000, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7574', 1, 28, 0, 1, 0, 0, 700, '2018-07-12', '18:03:59', '2018-07-12 18:03:59', '0', '00', '0', 0, 700, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7575', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '18:04:14', '2018-07-12 18:04:14', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7571', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:03:01', '2018-07-12 18:03:01', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7572', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:03:27', '2018-07-12 18:03:27', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7569', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:02:33', '2018-07-12 18:02:33', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7570', 1, 28, 1, 0, 0, 0, 1300, '2018-07-12', '18:02:48', '2018-07-12 18:02:48', '0', '00', '0', 1300, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7568', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:02:13', '2018-07-12 18:02:13', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7567', 1, 25, 1, 0, 0, 0, 1100, '2018-07-12', '18:01:55', '2018-07-12 18:01:55', '0', '00', '0', 1100, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13'),
('0487526', 'Shravan Baburao Wagh', 589, 'C 12719', 'Rajendra Narayan Khedekar', 532, 'D 13459', '', 0, 'V-Navghar', '01', 'V-Navghar', '01', '142', '699', '12/07/1816:22:04', 1, 202, '0000', '7566', 1, 30, 1, 0, 0, 0, 1500, '2018-07-12', '18:01:39', '2018-07-12 18:01:39', '0', '00', '0', 1500, 0, 'BALAJI', 'Y', 19, '2018-07-13 01:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_city_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_user_city_mst` (
  `fldi_user_id` int(5) NOT NULL,
  `fldi_city_id` int(10) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_admin_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_city_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_user_city_mst_log` (
  `fldi_user_id` int(5) NOT NULL,
  `fldi_city_id` int(10) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_admin_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_department_map`
--

CREATE TABLE IF NOT EXISTS `tbl_user_department_map` (
  `fldi_user_id` int(4) NOT NULL,
  `fldi_department_id` int(4) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_login_id` int(4) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_depot`
--

CREATE TABLE IF NOT EXISTS `tbl_user_depot` (
  `fldi_user_id` int(5) NOT NULL,
  `fldi_depot_id` int(5) NOT NULL,
  `fldc_status_flg` varchar(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  KEY `index` (`fldi_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_details`
--

CREATE TABLE IF NOT EXISTS `tbl_user_details` (
  `fldi_user_id` int(4) NOT NULL AUTO_INCREMENT,
  `fldi_user_type` int(1) NOT NULL,
  `fldv_user_code` varchar(10) NOT NULL,
  `fldv_user_name` varchar(300) NOT NULL,
  `fldv_user_password` varchar(300) NOT NULL,
  `fldv_employee_name` varchar(100) NOT NULL,
  `fldv_employee_email` varchar(100) NOT NULL,
  `fldv_employee_phone` varchar(5) NOT NULL,
  `fldi_role_id` int(5) NOT NULL,
  `fldi_city_id` int(5) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_user_mst` (
  `fldi_user_id` int(5) NOT NULL AUTO_INCREMENT,
  `fldv_user_name` varchar(100) DEFAULT NULL,
  `fldv_user_pass` varchar(200) DEFAULT NULL,
  `fldv_name` varchar(100) DEFAULT NULL,
  `fldv_email` varchar(200) DEFAULT NULL,
  `fldv_mob` varchar(15) DEFAULT NULL,
  `fldv_phone` varchar(15) DEFAULT NULL,
  `fldv_city` varchar(100) DEFAULT NULL,
  `fldi_user_type` int(2) DEFAULT NULL,
  `fldi_role_id` int(5) NOT NULL,
  `fldi_admin_id` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `flddt_user_created_date` datetime NOT NULL,
  `flddt_current_date` datetime NOT NULL,
  `fldc_cost_flg` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`fldi_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_user_mst_log` (
  `fldi_user_id` int(5) DEFAULT NULL,
  `fldv_user_name` varchar(100) DEFAULT NULL,
  `fldv_user_pass` varchar(200) DEFAULT NULL,
  `fldv_name` varchar(100) DEFAULT NULL,
  `fldv_email` varchar(200) DEFAULT NULL,
  `fldv_mob` varchar(15) DEFAULT NULL,
  `fldv_phone` varchar(15) DEFAULT NULL,
  `fldv_city` varchar(100) DEFAULT NULL,
  `fldi_user_type` int(2) DEFAULT NULL,
  `fldi_role_id` int(5) NOT NULL,
  `fldi_admin_id` int(5) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `flddt_user_created_date` datetime NOT NULL,
  `flddt_current_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicle_image_str_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_vehicle_image_str_mst` (
  `fldi_cam_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldl_camera_data` longtext,
  `fldv_imei_number` varchar(20) DEFAULT NULL,
  `fldv_latitude` varchar(50) DEFAULT NULL,
  `fldv_longitude` varchar(50) DEFAULT NULL,
  `flddt_gmt_date` date DEFAULT NULL,
  `fldv_gmt_time` varchar(20) DEFAULT NULL,
  `flddt_gmt_date_time` datetime DEFAULT NULL,
  `fldv_image_name` varchar(100) DEFAULT NULL,
  `fldv_image_size` varchar(20) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  `flddt_image_created_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_cam_id`),
  KEY `idVehGmtDate` (`flddt_gmt_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_veh_dist_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_veh_dist_mst` (
  `fldv_imei_nmber` varchar(15) DEFAULT NULL,
  `flddt_date` date DEFAULT NULL,
  `fldi_distance` float DEFAULT NULL,
  `fldi_time_diff` float DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_vendor_mst` (
  `fldi_vendor_id` bigint(30) NOT NULL AUTO_INCREMENT,
  `fldv_vendor_name` varchar(50) NOT NULL,
  `fldi_vendor_contact_no` int(11) NOT NULL,
  `fldi_vendor_alternate_contact_no` int(11) NOT NULL,
  `fldm_vendor_address` mediumtext NOT NULL,
  `fldi_user_id` int(30) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_vendor_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vvmt_heading_col1`
--

CREATE TABLE IF NOT EXISTS `tbl_vvmt_heading_col1` (
  `fldm_heading_text` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flddt_last_upd_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vvmt_heading_col2`
--

CREATE TABLE IF NOT EXISTS `tbl_vvmt_heading_col2` (
  `fldm_heading_text` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flddt_last_upd_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vvmt_ticket_fare`
--

CREATE TABLE IF NOT EXISTS `tbl_vvmt_ticket_fare` (
  `fldi_actual_fare` int(20) NOT NULL,
  `fldm_ticket_fare` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flddt_last_upd_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_actual_details`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_actual_details` (
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_employee_code` varchar(100) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) DEFAULT NULL,
  `fldi_shift_id` bigint(60) DEFAULT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) DEFAULT NULL,
  `fldv_sterring_time` varchar(10) DEFAULT NULL,
  `fldv_actual_duty_kms` int(15) DEFAULT NULL,
  `fldv_scheduled_kms` int(15) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_bus_details`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_bus_details` (
  `fldi_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fldv_waybill_no` varchar(20) NOT NULL,
  `fldv_bus_no` varchar(20) NOT NULL,
  `fldt_date_time` datetime NOT NULL,
  PRIMARY KEY (`fldi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_change_status_log`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_change_status_log` (
  `fldv_conductor_employee_code` varchar(100) NOT NULL,
  `fldv_conductor_name` varchar(100) NOT NULL,
  `flddt_date` date NOT NULL,
  `fldv_waybill_status` varchar(10) NOT NULL,
  `fldv_waybill_no` varchar(20) NOT NULL,
  `fldi_user_id` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_conductor_issue_details`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_conductor_issue_details` (
  `fldi_coupon_allocation_id` bigint(60) NOT NULL,
  `fldi_issue_clerk_allocation_id` bigint(60) NOT NULL,
  `fldi_coupon_id` bigint(60) NOT NULL,
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_employee_code` varchar(100) DEFAULT NULL,
  `fldv_coupon_type` varchar(50) DEFAULT NULL,
  `fldi_coupon_amount` double(10,2) DEFAULT NULL,
  `fldv_coupon_blok_no` varchar(10) DEFAULT NULL,
  `fldi_coupon_start_number` bigint(60) DEFAULT NULL,
  `fldi_coupon_end_number` bigint(60) DEFAULT NULL,
  `fldv_etm_number` varchar(5) DEFAULT NULL,
  `fldv_tray_no` varchar(100) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_tray_value` double(25,2) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  KEY `idAmount` (`fldi_coupon_amount`),
  KEY `idConductorEmpCode` (`fldv_conductor_employee_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_driver_link`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_driver_link` (
  `fldi_id` bigint(30) NOT NULL AUTO_INCREMENT,
  `fldv_waybill_no` varchar(50) NOT NULL,
  `fldv_driver_name` varchar(150) NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  `fldv_conductor` varchar(50) NOT NULL,
  `fldv_busno` varchar(50) NOT NULL,
  `flddt_driver_time` time NOT NULL,
  `fldt_conductor_time` time NOT NULL,
  PRIMARY KEY (`fldi_id`),
  KEY `fldv_waybill_no` (`fldv_waybill_no`,`fldv_driver_name`,`flddt_last_updated`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_handheld_smartcard_data`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_handheld_smartcard_data` (
  `fldi_smart_card_id` bigint(100) NOT NULL AUTO_INCREMENT,
  `fldv_waybill_no` varchar(20) NOT NULL,
  `fldv_conductor_name` varchar(100) NOT NULL,
  `fldv_driver_name` varchar(100) NOT NULL,
  `fldv_vehicle_number` varchar(25) NOT NULL,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldv_division_code` varchar(5) NOT NULL,
  `fldv_depot_name` varchar(100) NOT NULL,
  `fldv_depot_code` varchar(5) NOT NULL,
  `fldv_schedule` varchar(10) NOT NULL,
  `fldv_etm_number` varchar(5) NOT NULL,
  `fldv_waybill_date_time` varchar(50) NOT NULL,
  `fldl_smartcard_data` longtext NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  PRIMARY KEY (`fldi_smart_card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_mst` (
  `fldi_waybill_id` bigint(60) NOT NULL AUTO_INCREMENT,
  `fldv_waybill_no` varchar(20) NOT NULL,
  `fldi_conductor_id` int(50) NOT NULL,
  `fldv_conductor_employee_code` varchar(100) NOT NULL,
  `fldv_conductor_name` varchar(100) NOT NULL,
  `fldi_driver_id` int(5) NOT NULL,
  `fldv_driver_employee_code` varchar(100) NOT NULL,
  `fldv_driver_name` varchar(100) NOT NULL,
  `fldv_vehicle_id` int(5) NOT NULL,
  `fldv_vehicle_number` varchar(25) NOT NULL,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldv_division_code` varchar(5) NOT NULL,
  `fldv_depot_name` varchar(100) NOT NULL,
  `fldv_depot_code` varchar(5) NOT NULL,
  `fldv_schedule` varchar(10) NOT NULL,
  `fldi_etim_id` bigint(50) NOT NULL,
  `fldv_etm_number` varchar(5) NOT NULL,
  `fldv_duty_number` varchar(25) NOT NULL,
  `flddt_date` date NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldv_waybill_created_date` varchar(16) NOT NULL,
  `fldi_shift_id` int(5) NOT NULL,
  `fldc_trip_status` char(1) NOT NULL,
  `fldv_start_time` varchar(10) NOT NULL,
  `fldv_end_time` varchar(10) NOT NULL,
  `fldc_waybill_open_close_status` char(1) NOT NULL DEFAULT 'N',
  `fldc_handheld_open_close_status` char(1) NOT NULL DEFAULT 'N',
  `fldc_handheld_no_data` char(1) NOT NULL DEFAULT 'N',
  `flddt_handheld_close_datetime` datetime NOT NULL,
  `fldc_coupon_open_close_status` char(1) NOT NULL DEFAULT 'N',
  `fldc_coupon_no_data` char(1) NOT NULL DEFAULT 'N',
  `flddt_coupon_close_datetime` datetime NOT NULL,
  `fldc_collection_open_close_status` char(1) NOT NULL DEFAULT 'N',
  `fldc_collection_no_data` char(1) NOT NULL DEFAULT 'N',
  `flddt_collection_close_datetime` datetime NOT NULL,
  `fldv_impress_given` varchar(10) NOT NULL,
  `fldm_remark` mediumtext NOT NULL,
  `fldv_tray_value` varchar(50) NOT NULL,
  `fldc_driver_status` char(1) NOT NULL DEFAULT 'N',
  `fldi_handheld_close_userid` int(5) NOT NULL DEFAULT '0',
  `fldi_coupon_close_userid` int(5) NOT NULL DEFAULT '0',
  `fldi_collection_close_userid` int(5) NOT NULL DEFAULT '0',
  `flddt_waybill_open_close_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`fldi_waybill_id`),
  KEY `WayBillNo` (`fldv_waybill_no`),
  KEY `WaybillDate` (`flddt_date`),
  KEY `idx_waybill_cond` (`fldv_conductor_employee_code`,`fldc_status`),
  KEY `idx_openstatus` (`fldc_waybill_open_close_status`,`fldc_status`,`flddt_last_upd_date`),
  KEY `idx_waybillclose` (`flddt_waybill_open_close_datetime`,`fldc_waybill_open_close_status`,`fldc_status`,`fldv_waybill_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=473810 ;

--
-- Dumping data for table `tbl_waybill_mst`
--

INSERT INTO `tbl_waybill_mst` (`fldi_waybill_id`, `fldv_waybill_no`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_conductor_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_driver_name`, `fldv_vehicle_id`, `fldv_vehicle_number`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldi_etim_id`, `fldv_etm_number`, `fldv_duty_number`, `flddt_date`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`, `fldv_waybill_created_date`, `fldi_shift_id`, `fldc_trip_status`, `fldv_start_time`, `fldv_end_time`, `fldc_waybill_open_close_status`, `fldc_handheld_open_close_status`, `fldc_handheld_no_data`, `flddt_handheld_close_datetime`, `fldc_coupon_open_close_status`, `fldc_coupon_no_data`, `flddt_coupon_close_datetime`, `fldc_collection_open_close_status`, `fldc_collection_no_data`, `flddt_collection_close_datetime`, `fldv_impress_given`, `fldm_remark`, `fldv_tray_value`, `fldc_driver_status`, `fldi_handheld_close_userid`, `fldi_coupon_close_userid`, `fldi_collection_close_userid`, `flddt_waybill_open_close_datetime`) VALUES
(473539, '0487526', 589, 'C 12719', 'Shravan Baburao Wagh', 532, 'D 13459', 'Rajendra Narayan Khedekar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '142', 379, '470', '284', '2018-07-12', 'Y', 28, '2018-07-12 16:22:04', '12/07/1816:22:04', 2, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 01:22:14', 'Y', 'N', '2018-07-13 01:24:56', 'Y', 'N', '2018-07-13 01:27:36', '', '', '11219', 'N', 19, 19, 19, '2018-07-13 01:27:36'),
(473523, '0487546', 310, 'C 12443', 'Ramesh Sarichand Rathod', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', 354, '389', '2GB', '2018-07-12', 'Y', 83, '2018-07-12 15:42:48', '12/07/1815:42:48', 2, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 02:39:25', 'Y', 'Y', '2018-07-13 02:37:38', 'Y', 'N', '2018-07-13 02:37:52', '', 'mh48k370D 13032', '12151', 'N', 51, 51, 51, '2018-07-13 02:37:52'),
(473418, '0487405', 986, 'BC 18037', 'Sainath Balaji Gaikwad', 775, 'D 13700', 'Sunil Tanaji Gaikwad', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '70', 360, '395', '140', '2018-07-12', 'Y', 39, '2018-07-12 12:31:57', '12/07/1812:31:57', 2, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 02:41:24', 'Y', 'Y', '2018-07-13 02:38:40', 'Y', 'N', '2018-07-13 02:38:48', '', '', '3751', 'N', 51, 51, 51, '2018-07-13 02:38:48'),
(473537, '0487524', 914, 'BC 17060', 'Bhushan Vilas Dhamoda', 374, 'D 13248', 'Sandip Ladakya Medha', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '14', 336, '371', '28', '2018-07-12', 'Y', 83, '2018-07-12 16:17:00', '12/07/1816:17:00', 2, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 02:43:23', 'Y', 'Y', '2018-07-13 02:39:37', 'Y', 'N', '2018-07-13 02:39:46', '', 'mh48k1387', '25706', 'N', 51, 51, 51, '2018-07-13 02:39:46'),
(473542, '0487529', 469, 'C 12598', 'Vinod Uttam Pawar', 755, 'D 13681', 'Anantkumar  Hauslaprasad Pandey', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '6', 309, '775', '12', '2018-07-12', 'Y', 83, '2018-07-12 16:29:03', '12/07/1816:29:03', 2, 'R', '', '', 'N', 'Y', 'N', '2018-07-13 04:41:07', 'Y', 'Y', '2018-07-13 04:38:10', 'Y', 'N', '2018-07-13 04:40:32', '', 'mh48k190', '18237', 'N', 51, 51, 51, '2018-07-13 04:40:32'),
(473569, '0487556', 10, 'C 12142', 'Ajay  Balkrishna  Raut', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '89', 346, '381', '176', '2018-07-12', 'Y', 83, '2018-07-12 20:21:52', '12/07/1820:21:52', 2, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 05:37:51', 'Y', 'Y', '2018-07-13 05:35:15', 'Y', 'N', '2018-07-13 05:36:18', '', '', '6783', 'N', 51, 51, 51, '2018-07-13 05:36:18'),
(473633, '0487620', 700, 'C 12828', 'Mahadu Manglya Bhoye', 977, 'BD 17585', 'Ganesh Baburao Vaze', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 364, '684', '517', '2018-07-13', 'Y', 37, '2018-07-13 05:38:02', '13/07/1805:38:02', 0, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 05:42:36', 'Y', 'N', '2018-07-13 05:42:42', '', '', '15249', 'N', 0, 37, 37, '2018-07-13 05:42:42'),
(473519, '0487506', 952, 'BC 18004', 'Rupesh Raghunath Raut', 383, 'D 13245', 'Santosh Shahu Ambre', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '144', 382, '702', '287', '2018-07-12', 'Y', 28, '2018-07-12 15:17:42', '12/07/1815:17:42', 3, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 05:55:27', 'Y', 'Y', '2018-07-13 05:52:44', 'Y', 'N', '2018-07-13 05:53:44', '', '', '15970', 'N', 19, 19, 19, '2018-07-13 05:53:44'),
(473574, '0487561', 878, 'BC 17022', 'Gokul Ruksharaj Gite', 884, 'D 13809', 'Pravin Kashiram Ghatal', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '287', 371, '691', '574', '2018-07-12', 'Y', 37, '2018-07-12 22:25:44', '12/07/1822:25:44', 3, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 06:01:20', 'Y', 'Y', '2018-07-13 05:58:53', 'Y', 'N', '2018-07-13 05:59:53', '', '', '15462', 'N', 37, 37, 37, '2018-07-13 05:59:53'),
(473571, '0487558', 940, 'BC 17083', 'Dipesh Vaman Kudu', 938, 'BD 17546', 'Ravindra Bablya Mohite', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '64', 355, '390', '128', '2018-07-12', 'Y', 83, '2018-07-12 20:56:42', '12/07/1820:56:42', 3, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 06:15:04', 'Y', 'Y', '2018-07-13 06:12:13', 'Y', 'N', '2018-07-13 06:13:13', '', '', '10974', 'N', 51, 51, 51, '2018-07-13 06:13:13'),
(473404, '0487391', 632, 'C 12761', 'Subodh Narayan Bhure', 799, 'D 13724', 'Umesh Arjun Valvi', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '151', 287, '753', '301', '2018-07-12', 'Y', 28, '2018-07-12 12:16:40', '12/07/1812:16:40', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 06:17:00', 'Y', 'N', '2018-07-13 06:18:16', 'Y', 'N', '2018-07-13 06:19:49', '', '', '11957', 'N', 19, 19, 19, '2018-07-13 06:19:49'),
(473662, '0487649', 916, 'BC 17046', 'Mohammed Ameen Hafiz Abdur Rauf Kamle', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 51, '2018-07-13 06:14:43', '13/07/1806:14:43', 0, 'E', '05:00', '01:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 06:20:56', 'Y', 'N', '2018-07-13 06:22:49', '', 'TRAY BOX USE', '17964', 'N', 0, 51, 51, '2018-07-13 06:22:49'),
(473669, '0487656', 741, 'C 12869', 'Vijay Kashinath rathod', 1031, 'BD 18538', 'Dinesh Shantaram Khanvilkar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '22', 123, '551', '43', '2018-07-13', 'Y', 51, '2018-07-13 06:25:46', '13/07/1806:25:46', 1, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 06:29:32', 'Y', 'N', '2018-07-13 06:29:37', '', '', '9861', 'N', 0, 51, 51, '2018-07-13 06:29:37'),
(473428, '0487415', 344, 'C 12503', 'Rajendra Vishnu Katela', 1034, 'BD 18541', 'Santosh Kalusingh Batale', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '183', 0, '', '365', '2018-07-12', 'Y', 28, '2018-07-12 12:38:49', '12/07/1812:38:49', 1, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 06:37:45', 'Y', 'N', '2018-07-13 06:38:00', '', 'TRY BOX USE', '17333', 'N', 0, 19, 19, '2018-07-13 06:38:00'),
(473580, '0487567', 789, 'C 12916', 'Laxman Bhimrao Rathod', 285, 'D 13207', 'Somnath Tukaram Gaikwad', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '133', 288, '754', '265', '2018-07-13', 'Y', 19, '2018-07-13 00:55:22', '13/07/1800:55:22', 1, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 06:56:39', 'Y', 'N', '2018-07-13 06:56:50', '', '', '27464', 'N', 0, 19, 19, '2018-07-13 06:56:50'),
(473587, '0487574', 577, 'C 12707', 'Sudam Ananta Bhoir', 777, 'D 13702', 'Santosh Raoji Khatle', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '176', 385, '705', '351', '2018-07-13', 'Y', 19, '2018-07-13 01:09:37', '13/07/1801:09:37', 1, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 06:57:47', 'Y', 'N', '2018-07-13 06:57:57', '', '', '32290', 'N', 0, 19, 19, '2018-07-13 06:57:57'),
(473692, '0487679', 213, 'C 12344', 'Sandesh Narayan Iravati', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 09:28:06', '13/07/1809:28:06', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 09:32:07', 'Y', 'N', '2018-07-13 09:32:19', '', 'FOR TICKET ISSUE.', '17175', 'N', 0, 15, 15, '2018-07-13 09:32:19'),
(473693, '0487680', 682, 'C 12810', 'Mahesh Ramchandra Pawar', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 09:37:44', '13/07/1809:37:44', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 09:41:59', 'Y', 'N', '2018-07-13 09:42:14', '', 'FOR TICKET ISSUE.', '74155', 'N', 0, 15, 15, '2018-07-13 09:42:14'),
(473694, '0487681', 344, 'C 12503', 'Rajendra Vishnu Katela', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 09:54:44', '13/07/1809:54:43', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 09:59:47', 'Y', 'N', '2018-07-13 10:00:09', '', 'FOR TICKET ISSUE.', '17333', 'N', 0, 15, 15, '2018-07-13 10:00:09'),
(473695, '0487682', 604, 'C 12733', 'Nakul Bhaskar Bhoye', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 10:12:35', '13/07/1810:12:35', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 10:16:49', 'Y', 'N', '2018-07-13 10:17:03', '', 'FOR TICKET ISSUE.', '15130', 'N', 0, 15, 15, '2018-07-13 10:17:03'),
(473696, '0487683', 354, 'C 12516', 'Rahul Ankush Kamble', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 10:28:10', '13/07/1810:28:10', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 10:29:36', 'Y', 'N', '2018-07-13 10:29:45', '', 'FOR TICKET ISSUE.', '14244', 'N', 0, 15, 15, '2018-07-13 10:29:45'),
(473697, '0487684', 632, 'C 12761', 'Subodh Narayan Bhure', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 15, '2018-07-13 10:33:56', '13/07/1810:33:56', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 10:35:00', 'Y', 'N', '2018-07-13 10:35:16', '', 'FOR TICKET ISSUE.', '6323', 'N', 0, 15, 15, '2018-07-13 10:35:16'),
(473698, '0487685', 384, 'C 12553', 'Kishor Kawarsingh Pawar', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 10:42:51', '13/07/1810:42:51', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 10:46:00', 'Y', 'N', '2018-07-13 10:46:25', '', 'FOR TICKET ISSUE.', '18304', 'N', 0, 15, 15, '2018-07-13 10:46:25'),
(473699, '0487686', 106, 'C 12343', 'Jaydev Ram Kamble', 781, 'D 13706', 'Haresh Bhaskar Patil', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '85', 123, '551', '170', '2018-07-13', 'Y', 30, '2018-07-13 10:48:15', '13/07/1810:48:15', 2, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 10:59:25', 'Y', 'N', '2018-07-13 10:59:31', '', 'mh-04-hy-2693', '17379', 'N', 0, 69, 69, '2018-07-13 10:59:31'),
(473702, '0487689', 130, 'C 12302', 'Govinda Chandu Thakare', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 15, '2018-07-13 11:32:28', '13/07/1811:32:28', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 11:34:28', 'Y', 'N', '2018-07-13 11:34:47', '', 'FOR TICKET ISSUE.', '3943', 'N', 0, 15, 15, '2018-07-13 11:34:47'),
(473592, '0487579', 749, 'C 12877', 'Sandip Ganpat Badade', 507, 'D 13434', 'Vaibhav Arun Vartak', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '86', 407, '101', '171', '2018-07-13', 'Y', 51, '2018-07-13 04:22:00', '13/07/1804:22:00', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 11:51:01', 'Y', 'Y', '2018-07-13 11:47:23', 'Y', 'N', '2018-07-13 11:48:29', '', '', '16624', 'N', 69, 69, 69, '2018-07-13 11:48:29'),
(473704, '0487691', 432, 'C 12485', 'Suresh Dattaram Rasam', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 11:53:02', '13/07/1811:53:02', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 12:00:18', 'Y', 'N', '2018-07-13 12:00:28', '', 'FOR TICKET ISSUE.', '21969', 'N', 0, 15, 15, '2018-07-13 12:00:28'),
(473579, '0487566', 707, 'c 12835', 'Sampatkumar Jayram Rathod', 629, 'D 13556', 'Navnath Hariba Kalel', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 366, '686', '477', '2018-07-13', 'Y', 37, '2018-07-13 00:55:20', '13/07/1800:55:20', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:14:45', 'Y', 'N', '2018-07-13 14:26:10', 'Y', 'N', '2018-07-13 12:11:54', '', '', '16252', 'N', 78, 29, 78, '2018-07-13 12:11:54'),
(473594, '0487581', 362, 'C 12509', 'Santosh Yashwant Jadhav', 591, 'D 13516', 'Ramesh Navsu Tumbada', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '1', 337, '372', '1', '2018-07-13', 'Y', 51, '2018-07-13 04:25:50', '13/07/1804:25:50', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:24:36', 'Y', 'Y', '2018-07-13 12:21:36', 'Y', 'N', '2018-07-13 12:22:49', '', '', '9274', 'N', 69, 69, 69, '2018-07-13 12:22:49'),
(473707, '0487694', 818, 'C 12945', 'Salil Bachchu Kadali', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 12:23:43', '13/07/1812:23:43', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 12:28:53', 'Y', 'N', '2018-07-13 12:29:07', '', 'FOR TICKET ISSUE.', '19724', 'N', 0, 15, 15, '2018-07-13 12:29:07'),
(473601, '0487588', 187, 'C 12247', 'Amol Bhimrav Lokhande', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '103', 339, '374', '205', '2018-07-13', 'Y', 51, '2018-07-13 04:54:23', '13/07/1804:54:23', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:32:26', 'Y', 'Y', '2018-07-13 12:29:33', 'Y', 'N', '2018-07-13 12:30:25', '', '', '15765', 'N', 69, 69, 69, '2018-07-13 12:30:25'),
(473596, '0487583', 470, 'C 12599', 'Prashant Pandurang Patil', 86, 'D 12069', 'Chintu Vithoba Gorad', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '57', 347, '382', '113', '2018-07-13', 'Y', 51, '2018-07-13 04:37:06', '13/07/1804:37:06', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:36:23', 'Y', 'Y', '2018-07-13 12:32:42', 'Y', 'N', '2018-07-13 12:33:32', '', '', '3938', 'N', 69, 69, 69, '2018-07-13 12:33:32'),
(473607, '0487594', 918, 'BC 17061', 'Kundan Harishchandra Rane', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 270, '736', '', '2018-07-13', 'Y', 19, '2018-07-13 05:11:25', '13/07/1805:11:25', 0, 'E', '05:00', '14:00', 'Y', 'Y', 'N', '2018-07-13 12:36:24', 'Y', 'Y', '2018-07-13 12:33:13', 'Y', 'N', '2018-07-13 12:35:28', '', 'DUTY 265 D 13431', '12260', 'N', 83, 83, 83, '2018-07-13 12:35:28'),
(473591, '0487578', 810, 'C 12937', 'Vinayak Anant Dalvi', 57, 'D 12011', 'Kailash Anandrao Patil', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '69', 402, '722', '137', '2018-07-13', 'Y', 51, '2018-07-13 04:05:22', '13/07/1804:05:22', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:40:17', 'Y', 'Y', '2018-07-13 12:36:43', 'Y', 'N', '2018-07-13 12:38:34', '', '', '12432', 'N', 69, 69, 69, '2018-07-13 12:38:34'),
(473599, '0487586', 790, 'C 12917', 'Sagar Prakash Chavan', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 393, '713', '', '2018-07-13', 'Y', 51, '2018-07-13 04:52:07', '13/07/1804:52:07', 0, 'E', '05:00', '01:00', 'Y', 'Y', 'N', '2018-07-13 12:44:14', 'Y', 'Y', '2018-07-13 12:40:56', 'Y', 'N', '2018-07-13 12:43:18', '', 'DUTY NO 173', '15039', 'N', 69, 69, 69, '2018-07-13 12:43:18'),
(473575, '0487562', 79, 'C 12179', 'Pandarinath Rohidas  Shirsath', 839, 'D 13764', 'Dilavar Mohmad Amin Shaikh', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 375, '695', '581', '2018-07-13', 'Y', 37, '2018-07-13 00:50:55', '13/07/1800:50:55', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:48:09', 'Y', 'Y', '2018-07-13 12:44:53', 'Y', 'N', '2018-07-13 12:45:36', '', 'C- 12830 Waybill Open issue in controler id', '0', 'N', 78, 78, 78, '2018-07-13 12:45:36'),
(473711, '0487698', 726, 'C 12854', 'Bhushan Murlidhar Patil', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 12:41:24', '13/07/1812:41:24', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 12:45:37', 'Y', 'N', '2018-07-13 12:45:59', '', 'FOR TICKET ISSUE.', '25650', 'N', 0, 15, 15, '2018-07-13 12:45:59'),
(473593, '0487580', 508, 'C 12637', 'Santosh Kisan Gavit', 87, 'D 12070', 'Duryodhan Sakharam Sule', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '70', 348, '383', '139', '2018-07-13', 'Y', 51, '2018-07-13 04:23:53', '13/07/1804:23:53', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:48:09', 'Y', 'Y', '2018-07-13 12:44:33', 'Y', 'N', '2018-07-13 12:49:13', '', '', '17424', 'N', 69, 69, 69, '2018-07-13 12:49:13'),
(473582, '0487569', 610, 'c 12739', 'Jagdish Kisan Bambale', 137, 'D 13030', 'Vijay Madhukar Patil', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 322, '357', '479', '2018-07-13', 'Y', 37, '2018-07-13 00:56:38', '13/07/1800:56:38', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 12:52:02', 'Y', 'Y', '2018-07-13 12:50:16', 'Y', 'N', '2018-07-13 12:51:05', '', '', '15446', 'N', 78, 78, 78, '2018-07-13 12:51:05'),
(473718, '0487705', 861, 'BC 17005', 'Sandip Motilal Chavhan', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 15, '2018-07-13 12:54:33', '13/07/1812:54:33', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 12:56:33', 'Y', 'N', '2018-07-13 12:56:41', '', 'FOR TICKET ISSUE.', '5699', 'N', 0, 15, 15, '2018-07-13 12:56:41'),
(473583, '0487570', 513, 'C 12642', 'Sandip Harishchandra Bhoir', 657, 'D 13583', 'Prashant  Balwant Thange', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 329, '364', '465', '2018-07-13', 'Y', 37, '2018-07-13 00:58:24', '13/07/1800:58:24', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:03:45', 'Y', 'Y', '2018-07-13 13:01:53', 'Y', 'N', '2018-07-13 13:02:58', '', '', '15727', 'N', 78, 78, 78, '2018-07-13 13:02:58'),
(473595, '0487582', 865, 'BC 17009', 'Vaibhav Pandurang Gaikwad', 871, 'D 13796', 'Avinash Jiwan Rathod', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '73', 394, '714', '145', '2018-07-13', 'Y', 51, '2018-07-13 04:36:01', '13/07/1804:36:01', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:09:36', 'Y', 'Y', '2018-07-13 13:07:27', 'Y', 'N', '2018-07-13 13:08:52', '', '', '14924', 'N', 19, 19, 19, '2018-07-13 13:08:52'),
(473719, '0487706', 590, 'C 12720', 'Santosh Maruti Kowale', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 15, '2018-07-13 13:03:46', '13/07/1813:03:46', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 13:08:44', 'Y', 'N', '2018-07-13 13:09:01', '', 'FOR TICKET ISSUE.', '6747', 'N', 0, 15, 15, '2018-07-13 13:09:01'),
(473576, '0487563', 685, 'C 12813', 'Rajaram Santu Mote', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 328, '363', '583', '2018-07-13', 'Y', 37, '2018-07-13 00:52:19', '13/07/1800:52:19', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:11:32', 'Y', 'Y', '2018-07-13 13:08:21', 'Y', 'N', '2018-07-13 13:09:10', '', 'Driver - Raju Bhogale', '23749', 'N', 78, 78, 78, '2018-07-13 13:09:10'),
(473600, '0487587', 27, 'C 12356', 'Nitesh Kashinath Kanoja', 613, 'D 13540', 'Sudam Limbaji Bhatane', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '9', 324, '359', '17', '2018-07-13', 'Y', 51, '2018-07-13 04:52:52', '13/07/1804:52:52', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:11:34', 'Y', 'Y', '2018-07-13 13:09:46', 'Y', 'N', '2018-07-13 13:10:44', '', '', '17986', 'N', 19, 19, 19, '2018-07-13 13:10:44'),
(473581, '0487568', 519, 'C 12648', 'Tulshiram Rama Thakare', 271, 'D 13193', 'Ashish Ashok Mahajan', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '134', 301, '767', '267', '2018-07-13', 'Y', 19, '2018-07-13 00:56:10', '13/07/1800:56:10', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:11:33', 'Y', 'Y', '2018-07-13 13:09:52', 'Y', 'N', '2018-07-13 13:10:59', '', '', '35422', 'N', 83, 83, 83, '2018-07-13 13:10:59'),
(473617, '0487604', 783, 'C 12910', 'Kashinath  Kisan  Rathod', 658, 'D 13584.', 'Bhavesh Appa Chaure', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '66', 399, '719', '131', '2018-07-13', 'Y', 51, '2018-07-13 05:23:15', '13/07/1805:23:15', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:13:31', 'Y', 'Y', '2018-07-13 13:11:30', 'Y', 'N', '2018-07-13 13:12:26', '', '', '8807', 'N', 19, 19, 19, '2018-07-13 13:12:26'),
(473598, '0487585', 287, 'C 12398', 'Laxman Chanrakant Thakre', 1018, 'BD 18522', 'Imraj Laxman Sule', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '71', 336, '371', '141', '2018-07-13', 'Y', 51, '2018-07-13 04:43:43', '13/07/1804:43:43', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:15:29', 'Y', 'Y', '2018-07-13 13:13:17', 'Y', 'N', '2018-07-13 13:14:38', '', '', '9117', 'N', 19, 19, 19, '2018-07-13 13:14:38'),
(473724, '0487711', 733, 'C 12861', 'Hirendra Durvesh Bhurkud', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 15, '2018-07-13 13:13:00', '13/07/1813:13:00', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 13:16:39', 'Y', 'N', '2018-07-13 13:16:55', '', 'FOR TICKET ISSUE.', '5992', 'N', 0, 15, 15, '2018-07-13 13:16:55'),
(473572, '0487559', 153, 'C 12320', 'Maruti Maurlidhar Shinde', 449, 'D 13376', 'Arun Laxman Madvi', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '287', 311, '346', '573', '2018-07-12', 'Y', 37, '2018-07-12 21:47:01', '12/07/1821:47:01', 3, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:17:26', 'Y', 'Y', '2018-07-13 13:15:11', 'Y', 'N', '2018-07-13 13:18:17', '', '', '15727', 'N', 78, 78, 78, '2018-07-13 13:18:17'),
(473626, '0487613', 661, 'c 12789', 'Bhavesh Somnath Gaikwad', 116, 'D 13003', 'Nitin Shankar Kini', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 320, '355', '567', '2018-07-13', 'Y', 37, '2018-07-13 05:32:20', '13/07/1805:32:20', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:21:19', 'Y', 'Y', '2018-07-13 13:19:42', 'Y', 'N', '2018-07-13 13:20:20', '', '', '8534', 'N', 78, 78, 78, '2018-07-13 13:20:20'),
(473584, '0487571', 387, 'C 12559', 'Sitaram Soma Dhumak', 486, 'D 13413', 'Bhaskar Gopinath Aade', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '128', 271, '737', '255', '2018-07-13', 'Y', 19, '2018-07-13 01:00:24', '13/07/1801:00:24', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:23:16', 'Y', 'Y', '2018-07-13 13:19:49', 'Y', 'N', '2018-07-13 13:20:55', '', '', '15960', 'N', 83, 83, 83, '2018-07-13 13:20:55'),
(473621, '0487608', 507, 'C 12636', 'Dinesh  Dharma Bhoye', 342, 'D 13283', 'Ramesh Mangalya Baraf', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '300', 334, '369', '599', '2018-07-13', 'Y', 37, '2018-07-13 05:29:31', '13/07/1805:29:31', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:25:14', 'Y', 'Y', '2018-07-13 13:22:14', 'Y', 'N', '2018-07-13 13:23:48', '', '', '6592', 'N', 78, 78, 78, '2018-07-13 13:23:48'),
(473634, '0487621', 489, 'C 12612', 'Keshav Krishna Bhoye', 132, 'D 13025', 'Santosh Sukhdeo Sanap', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '11', 392, '712', '21', '2018-07-13', 'Y', 51, '2018-07-13 05:38:03', '13/07/1805:38:03', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:27:12', 'Y', 'Y', '2018-07-13 13:24:32', 'Y', 'N', '2018-07-13 13:25:04', '', '', '13445', 'N', 19, 19, 19, '2018-07-13 13:25:04'),
(473632, '0487619', 98, 'C 12258', 'Navnath Ashok Mate', 620, 'D 13547', 'Rahul Chandrakant Dhole', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '2', 346, '381', '3', '2018-07-13', 'Y', 51, '2018-07-13 05:37:15', '13/07/1805:37:15', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:27:12', 'Y', 'Y', '2018-07-13 13:25:02', 'Y', 'N', '2018-07-13 13:26:07', '', '', '19002', 'N', 39, 39, 39, '2018-07-13 13:26:07'),
(473586, '0487573', 818, 'C 12945', 'Salil Bachchu Kadali', 663, 'D 13589', 'Nilesh Ramchandra Pashte', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '148', 269, '735', '295', '2018-07-13', 'Y', 19, '2018-07-13 01:06:17', '13/07/1801:06:17', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:27:12', 'Y', 'Y', '2018-07-13 13:24:28', 'Y', 'N', '2018-07-13 13:26:19', '', '', '19724', 'N', 83, 83, 83, '2018-07-13 13:26:19'),
(473625, '0487612', 698, 'C 12826', 'Chandrakant Tulshiram Thalekar', 640, 'D 13567', 'Sainath Bhagwan Ozare', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 317, '352', '569', '2018-07-13', 'Y', 37, '2018-07-13 05:31:34', '13/07/1805:31:34', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:27:13', 'Y', 'Y', '2018-07-13 13:25:22', 'Y', 'N', '2018-07-13 13:26:22', '', '', '11401', 'N', 78, 78, 78, '2018-07-13 13:26:22'),
(473603, '0487590', 188, 'C 12231', 'Baliram  Shivdas  Rathod', 105, 'D 12104', 'Amar Shantaram Hirlekar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '20', 388, '708', '39', '2018-07-13', 'Y', 51, '2018-07-13 05:06:28', '13/07/1805:06:28', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:29:07', 'Y', 'Y', '2018-07-13 13:25:58', 'Y', 'N', '2018-07-13 13:27:02', '', '', '9708', 'N', 19, 19, 19, '2018-07-13 13:27:02'),
(473604, '0487591', 466, 'C 12595', 'Prakash Shrikrishna Sadvelkar', 515, 'D 13442', 'Mohan Sukhdev Pukale', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '74', 400, '720', '147', '2018-07-13', 'Y', 51, '2018-07-13 05:07:16', '13/07/1805:07:16', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:31:04', 'Y', 'N', '2018-07-13 13:29:19', 'Y', 'N', '2018-07-13 13:31:02', '', '', '6110', 'N', 19, 19, 19, '2018-07-13 13:31:02'),
(473629, '0487616', 96, 'C 12350', 'Yuvraj Hansraj Chavan', 119, 'D 13007', 'Sanjay Kashtya Shelke', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 363, '683', '513', '2018-07-13', 'Y', 37, '2018-07-13 05:34:34', '13/07/1805:34:34', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:31:04', 'Y', 'Y', '2018-07-13 13:28:52', 'Y', 'N', '2018-07-13 13:31:33', '', '', '22465', 'N', 78, 78, 78, '2018-07-13 13:31:33'),
(473612, '0487599', 549, 'C 12678', 'Pramod Laxman Bhoye', 664, 'D 13590', 'Bandu Gorakhnath Najan', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '10', 401, '721', '19', '2018-07-13', 'Y', 51, '2018-07-13 05:15:30', '13/07/1805:15:30', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:34:58', 'Y', 'Y', '2018-07-13 13:32:14', 'Y', 'N', '2018-07-13 13:32:38', '', '', '7736', 'N', 19, 19, 19, '2018-07-13 13:32:38'),
(473619, '0487606', 244, 'C 12194', 'Deepak   Ankush Tambe', 163, 'D 13071', 'Sachin Sukhadeo Madne', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 372, '692', '481', '2018-07-13', 'Y', 37, '2018-07-13 05:26:56', '13/07/1805:26:56', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:34:59', 'Y', 'Y', '2018-07-13 13:33:24', 'Y', 'N', '2018-07-13 13:33:53', '', '', '12447', 'N', 78, 78, 78, '2018-07-13 13:33:53'),
(473639, '0487626', 560, 'C 12690', 'Anil Keshav Gavandha', 530, 'D 13457', 'Mohan 	Laxman	Gavali', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '18', 352, '387', '35', '2018-07-13', 'Y', 51, '2018-07-13 05:41:39', '13/07/1805:41:39', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:36:55', 'Y', 'Y', '2018-07-13 13:33:50', 'Y', 'N', '2018-07-13 13:34:41', '', '', '5193', 'N', 19, 19, 19, '2018-07-13 13:34:41'),
(473643, '0487630', 891, 'BC 17023', 'Hitesh Murlidhar Meher', 148, 'D 13046', 'Deepak Kashinath Basvant', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '79', 345, '380', '157', '2018-07-13', 'Y', 51, '2018-07-13 05:44:30', '13/07/1805:44:30', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:38:51', 'Y', 'Y', '2018-07-13 13:35:35', 'Y', 'N', '2018-07-13 13:36:21', '', '', '11956', 'N', 19, 19, 19, '2018-07-13 13:36:21'),
(473577, '0487564', 421, 'C 12537', 'Ashwinikumar Sadanand Rane', 441, 'D 13368', 'Shivaji Sarjerao Dhamal', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 370, '690', '561', '2018-07-13', 'Y', 37, '2018-07-13 00:53:20', '13/07/1800:53:20', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:38:51', 'Y', 'Y', '2018-07-13 13:35:58', 'Y', 'N', '2018-07-13 13:36:54', '', '', '14314', 'N', 78, 78, 78, '2018-07-13 13:36:54'),
(473613, '0487600', 144, 'C 12309', 'Dinesh  Raghunath Chavan', 548, 'D 13474', 'Raju Chabulal Mulani', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '59', 409, '103', '117', '2018-07-13', 'Y', 51, '2018-07-13 05:16:25', '13/07/1805:16:25', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:41:07', 'Y', 'Y', '2018-07-13 13:37:27', 'Y', 'N', '2018-07-13 13:38:07', '', '', '13788', 'N', 19, 19, 19, '2018-07-13 13:38:07'),
(473570, '0487557', 571, 'C 12701', 'Ananta Maruti Mahale', 543, 'D 13470', 'Jotiba  Gavdu Patil', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 318, '353', '474', '2018-07-12', 'Y', 37, '2018-07-12 20:52:31', '12/07/1820:52:31', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:45:02', 'Y', 'Y', '2018-07-13 13:42:40', 'Y', 'N', '2018-07-13 13:43:08', '', '', '17872', 'N', 78, 78, 78, '2018-07-13 13:43:08'),
(473628, '0487615', 461, 'C 12590', 'Nilesh Dattaram Sawant', 737, 'D 13663', 'Sagar Namdev Kolekar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '7', 410, '104', '13', '2018-07-13', 'Y', 51, '2018-07-13 05:34:13', '13/07/1805:34:13', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:47:00', 'Y', 'Y', '2018-07-13 13:44:34', 'Y', 'N', '2018-07-13 13:44:59', '', '', '22185', 'N', 19, 19, 19, '2018-07-13 13:44:59'),
(473635, '0487622', 751, 'C 12879', 'Gokul Valmik Rathod', 777, 'D 13702', 'Santosh Raoji Khatle', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '176', 310, '776', '351', '2018-07-13', 'Y', 19, '2018-07-13 05:38:18', '13/07/1805:38:18', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:47:00', 'Y', 'Y', '2018-07-13 13:43:26', 'Y', 'N', '2018-07-13 13:45:19', '', '', '11897', 'N', 83, 83, 83, '2018-07-13 13:45:19'),
(473640, '0487627', 463, 'C 12592', 'Sandesh Kisan Sambre', 70, 'D 12044', 'Gorakhnath Ramprasad Shukla', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '60', 353, '388', '119', '2018-07-13', 'Y', 51, '2018-07-13 05:42:28', '13/07/1805:42:28', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:48:56', 'Y', 'Y', '2018-07-13 13:45:45', 'Y', 'N', '2018-07-13 13:46:30', '', '', '10356', 'N', 19, 19, 19, '2018-07-13 13:46:30'),
(473616, '0487603', 853, 'c 12980', 'MaheshSomnath Vartha', 449, 'D 13376', 'Arun Laxman Madvi', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 323, '358', '601', '2018-07-13', 'Y', 37, '2018-07-13 05:21:50', '13/07/1805:21:50', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:48:56', 'Y', 'Y', '2018-07-13 13:47:08', 'Y', 'N', '2018-07-13 13:47:55', '', '', '12870', 'N', 78, 78, 78, '2018-07-13 13:47:55'),
(473610, '0487597', 224, 'C 12192', 'Pundlik  Apparao  Kamble', 376, 'D 13246', 'Ravindra Dharma Pawar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '3', 378, '698', '5', '2018-07-13', 'Y', 51, '2018-07-13 05:13:46', '13/07/1805:13:46', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:50:53', 'Y', 'Y', '2018-07-13 13:47:21', 'Y', 'N', '2018-07-13 13:48:31', '', '', '22122', 'N', 19, 19, 19, '2018-07-13 13:48:31'),
(473637, '0487624', 317, 'C 12497', 'Ramkrishna Sonnyabapu Bothe', 767, 'D 13692', 'Pravin Suresh Devarukhakar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '15', 338, '373', '29', '2018-07-13', 'Y', 51, '2018-07-13 05:39:47', '13/07/1805:39:47', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:52:48', 'Y', 'Y', '2018-07-13 13:49:50', 'Y', 'N', '2018-07-13 13:50:44', '', '', '6829', 'N', 19, 19, 19, '2018-07-13 13:50:44'),
(473651, '0487638', 11, 'C 12176', 'Pandharinath Narayan Thalekar', 295, 'D 13218', 'Vaibhav Shantaram Vaze', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 313, '348', '463', '2018-07-13', 'Y', 37, '2018-07-13 05:52:52', '13/07/1805:52:52', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:52:49', 'Y', 'Y', '2018-07-13 13:50:34', 'Y', 'N', '2018-07-13 13:50:57', '', '', '11447', 'N', 78, 78, 78, '2018-07-13 13:50:57'),
(473605, '0487592', 334, 'C 12480', 'Rajendra Thansing Jadhav', 512, 'D 13521', 'Munna Vijay  Yadav', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '67', 341, '376', '133', '2018-07-13', 'Y', 51, '2018-07-13 05:08:09', '13/07/1805:08:09', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:54:45', 'Y', 'Y', '2018-07-13 13:51:34', 'Y', 'N', '2018-07-13 13:52:19', '', '', '15138', 'N', 19, 19, 19, '2018-07-13 13:52:19'),
(473622, '0487609', 506, 'C 12635', 'Somnath Baban  Sanap', 378, 'D 13237', 'Sanjay Shantaram  More', 80, 'MH48K244', 'V-Navghar', '01', 'V-Navghar', '01', '135', 275, '741', '269', '2018-07-13', 'Y', 19, '2018-07-13 05:30:25', '13/07/1805:30:25', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:52:49', 'Y', 'Y', '2018-07-13 13:50:49', 'Y', 'N', '2018-07-13 13:53:15', '', 'C 12631 MACHINE ISSUE AT CONTROLLER ID', '0', 'N', 83, 83, 83, '2018-07-13 13:53:15'),
(473585, '0487572', 607, 'C 12736', 'Rupesh Sitaram Chande', 582, 'D 13508', 'Maruti Balu Khandekar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '130', 289, '755', '259', '2018-07-13', 'Y', 19, '2018-07-13 01:02:32', '13/07/1801:02:32', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:54:45', 'Y', 'Y', '2018-07-13 13:52:38', 'Y', 'N', '2018-07-13 13:53:23', '', '', '24707', 'N', 77, 77, 77, '2018-07-13 13:53:23'),
(473624, '0487611', 715, 'C 12843', 'Krishna Purandas Pawar', 654, 'D 13581', 'Shivaji Shripat Shirke', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '24', 359, '394', '47', '2018-07-13', 'Y', 51, '2018-07-13 05:31:05', '13/07/1805:31:05', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:56:44', 'Y', 'Y', '2018-07-13 13:53:18', 'Y', 'N', '2018-07-13 13:54:03', '', '', '5810', 'N', 19, 19, 19, '2018-07-13 13:54:03'),
(473652, '0487639', 888, 'BC 17034', 'Manoj Laxman Vanga', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 326, '361', '487', '2018-07-13', 'Y', 37, '2018-07-13 05:54:35', '13/07/1805:54:35', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:56:44', 'Y', 'Y', '2018-07-13 13:53:44', 'Y', 'N', '2018-07-13 13:54:19', '', 'Driver - Eknath Patil', '8048', 'N', 78, 78, 78, '2018-07-13 13:54:19'),
(473751, '0487738', 112, 'C 12351', 'Deepak   Baliram Pawar', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 13:51:37', '13/07/1813:51:37', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 13:54:43', 'Y', 'N', '2018-07-13 13:55:11', '', 'FOR TICKET ISSUE.', '14500', 'N', 0, 15, 15, '2018-07-13 13:55:11'),
(473644, '0487631', 890, 'BC 17024', 'Akshay Ramchandra Meher', 637, 'D 13565', 'Mithun Namdev Rathod', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '80', 395, '715', '159', '2018-07-13', 'Y', 51, '2018-07-13 05:45:20', '13/07/1805:45:20', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:58:41', 'Y', 'Y', '2018-07-13 13:55:23', 'Y', 'N', '2018-07-13 13:56:05', '', '', '15270', 'N', 19, 19, 19, '2018-07-13 13:56:05'),
(473653, '0487640', 581, 'C 12711', 'Keshav Jayram Warghade', 966, 'BD 17574', 'Rishikesh Kamlakar Khandagale', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '76', 408, '102', '151', '2018-07-13', 'Y', 51, '2018-07-13 05:59:18', '13/07/1805:59:18', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:00:39', 'Y', 'Y', '2018-07-13 13:57:03', 'Y', 'N', '2018-07-13 13:57:36', '', '', '7705', 'N', 19, 19, 19, '2018-07-13 13:57:36'),
(473665, '0487652', 756, 'C 12884', 'Ganesh Kisan Patara', 989, 'BD 17597', 'Nilesh Vasant Shirke', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '184', 283, '749', '367', '2018-07-13', 'Y', 19, '2018-07-13 06:22:55', '13/07/1806:22:55', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 13:58:40', 'Y', 'Y', '2018-07-13 13:55:36', 'Y', 'N', '2018-07-13 13:58:07', '', 'C 12808 THIS CONDUCTOR USE MACHINE AT CONTROLLER ID', '31668', 'N', 83, 83, 83, '2018-07-13 13:58:07'),
(473578, '0487565', 17, 'c 12400', 'Vitthal Baburao Ugale', 902, 'D 13827', 'Sambhaji Hari Kumbhar', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 321, '356', '563', '2018-07-13', 'Y', 37, '2018-07-13 00:54:14', '13/07/1800:54:14', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:00:39', 'Y', 'Y', '2018-07-13 13:58:05', 'Y', 'N', '2018-07-13 13:58:45', '', '', '15649', 'N', 78, 78, 78, '2018-07-13 13:58:45'),
(473611, '0487598', 527, 'C 12663', 'Pravin Baban  Avtar', 1027, 'BD 18534', 'Gansing Bharatsing Sathe', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '58', 351, '386', '115', '2018-07-13', 'Y', 51, '2018-07-13 05:14:41', '13/07/1805:14:41', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:00:39', 'Y', 'Y', '2018-07-13 13:58:29', 'Y', 'N', '2018-07-13 13:59:27', '', '', '9472', 'N', 19, 19, 19, '2018-07-13 13:59:27'),
(473656, '0487643', 122, 'C 12357', 'Isram Bhiva Morgha', 880, 'D 13805', 'Krishna Sopanrao Jadhav', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '177', 291, '757', '353', '2018-07-13', 'Y', 19, '2018-07-13 06:01:33', '13/07/1806:01:33', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:06:29', 'Y', 'Y', '2018-07-13 14:03:40', 'Y', 'N', '2018-07-13 14:04:48', '', 'MH04AY5750', '25395', 'N', 77, 77, 77, '2018-07-13 14:04:48'),
(473761, '0487748', 960, 'BC 18013', 'Ambadas Baban Thombare', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 15, '2018-07-13 14:02:16', '13/07/1814:02:16', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 14:05:01', 'Y', 'N', '2018-07-13 14:05:15', '', 'FOR TICKET ISSUE.', '10093', 'N', 0, 15, 15, '2018-07-13 14:05:15'),
(473618, '0487605', 736, 'c 12864', 'Nitin Suresh Patil', 647, 'D 13574', 'Ramu Palanja  Khadake', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 368, '688', '565', '2018-07-13', 'Y', 37, '2018-07-13 05:26:03', '13/07/1805:26:03', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:02:36', 'Y', 'Y', '2018-07-13 14:06:57', 'Y', 'N', '2018-07-13 14:07:31', '', '', '12103', 'N', 78, 78, 78, '2018-07-13 14:07:31'),
(473641, '0487628', 181, 'C 12361', 'Sachin  Parshuram Yadav', 705, 'D 13631', 'Avinash Jagannath Rathod', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '21', 354, '389', '41', '2018-07-13', 'Y', 51, '2018-07-13 05:43:22', '13/07/1805:43:22', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:10:23', 'Y', 'Y', '2018-07-13 14:07:48', 'Y', 'N', '2018-07-13 14:08:50', '', '', '13910', 'N', 19, 19, 19, '2018-07-13 14:08:50'),
(473663, '0487650', 637, 'c 12766', 'Ganesh Madan Girdhole', 884, 'D 13809', 'Pravin Kashiram Ghatal', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 369, '689', '605', '2018-07-13', 'Y', 37, '2018-07-13 06:15:38', '13/07/1806:15:38', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:14:17', 'Y', 'Y', '2018-07-13 14:11:08', 'Y', 'N', '2018-07-13 14:11:36', '', '', '12309', 'N', 78, 78, 78, '2018-07-13 14:11:36'),
(473649, '0487636', 360, 'C 12510', 'Harishchandra Parshuram Khirari', 843, 'D 13768', 'Dhananjay Namdeo Waghmare', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '28', 389, '709', '55', '2018-07-13', 'Y', 51, '2018-07-13 05:51:34', '13/07/1805:51:34', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:14:17', 'Y', 'Y', '2018-07-13 14:11:44', 'Y', 'N', '2018-07-13 14:13:01', '', '', '16233', 'N', 19, 19, 19, '2018-07-13 14:13:01'),
(473655, '0487642', 770, 'C 12898', 'Sunil Deu Andher', 113, 'D 12117', 'Mangesh Shantaram Ghadi', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 209, '001', '471', '2018-07-13', 'Y', 37, '2018-07-13 06:01:25', '13/07/1806:01:25', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:16:13', 'Y', 'Y', '2018-07-13 14:13:06', 'Y', 'N', '2018-07-13 14:13:53', '', '', '10776', 'N', 78, 78, 78, '2018-07-13 14:13:53'),
(473772, '0487759', 594, 'C 12724', 'Dattu Ganpati Rajpankhe', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 14:13:19', '13/07/1814:13:19', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 14:14:27', 'Y', 'N', '2018-07-13 14:14:39', '', 'FOR TICKET ISSUE.', '11543', 'N', 0, 15, 15, '2018-07-13 14:14:39'),
(473630, '0487617', 675, 'C 12803', 'Sandip Keshav Ghose', 460, 'D 13387', 'Kiran Janardhan Bhoir', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 367, '687', '515', '2018-07-13', 'Y', 37, '2018-07-13 05:35:40', '13/07/1805:35:40', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:18:11', 'Y', 'Y', '2018-07-13 14:14:56', 'Y', 'N', '2018-07-13 14:16:38', '', '', '3233', 'N', 78, 78, 78, '2018-07-13 14:16:38'),
(473627, '0487614', 231, 'C 12180', 'Akshay  Sahebrao Shirsath', 608, 'D 13535', 'Vivek Vishram Raut', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '203', 381, '701', '405', '2018-07-13', 'Y', 19, '2018-07-13 05:33:48', '13/07/1805:33:48', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:20:10', 'Y', 'Y', '2018-07-13 14:16:30', 'Y', 'N', '2018-07-13 14:18:10', '', 'C 12733 THIS CONDUCTOR USE THIS MACHINE AT CONTROLLER ID', '0', 'N', 77, 77, 77, '2018-07-13 14:18:10'),
(473668, '0487655', 944, 'BC 17087', 'Manoj Suresh  Govari', 288, 'D 13211', 'Ramesh Uddhav  Gaikwad', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '25', 290, '756', '49', '2018-07-13', 'Y', 51, '2018-07-13 06:24:57', '13/07/1806:24:57', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:22:08', 'Y', 'Y', '2018-07-13 14:18:56', 'Y', 'N', '2018-07-13 14:19:28', '', '', '22370', 'N', 19, 19, 19, '2018-07-13 14:19:28'),
(473657, '0487644', 643, 'C 12772', 'Manoj Gulab Malche', 1022, 'BD 18529', 'Dipak Prashant Mohire', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 365, '685', '489', '2018-07-13', 'Y', 37, '2018-07-13 06:02:57', '13/07/1806:02:57', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:22:07', 'Y', 'Y', '2018-07-13 14:20:13', 'Y', 'N', '2018-07-13 14:21:34', '', '', '21717', 'N', 78, 78, 78, '2018-07-13 14:21:34'),
(473659, '0487646', 857, 'BC 17001', 'Vijay Sanjay Devare', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '61', 390, '710', '121', '2018-07-13', 'Y', 51, '2018-07-13 06:05:41', '13/07/1806:05:41', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:24:04', 'Y', 'Y', '2018-07-13 14:21:58', 'Y', 'N', '2018-07-13 14:23:15', '', '', '9691', 'N', 39, 39, 39, '2018-07-13 14:23:15'),
(473664, '0487651', 432, 'C 12485', 'Suresh Dattaram Rasam', 350, 'D 13291', 'Baban Gajendra Devkule', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '150', 302, '768', '299', '2018-07-13', 'Y', 19, '2018-07-13 06:21:22', '13/07/1806:21:22', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:26:00', 'Y', 'Y', '2018-07-13 14:23:29', 'Y', 'N', '2018-07-13 14:25:14', '', '', '21969', 'N', 83, 83, 83, '2018-07-13 14:25:14'),
(473658, '0487645', 176, 'C 12416', 'Manilal Vankat Chavan', 319, 'D 13266', 'Yashwant Dattaram Padate', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 134, '562', '507', '2018-07-13', 'Y', 37, '2018-07-13 06:04:30', '13/07/1806:04:30', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:27:59', 'Y', 'Y', '2018-07-13 14:25:08', 'Y', 'N', '2018-07-13 14:25:46', '', '', '7556', 'N', 78, 78, 78, '2018-07-13 14:25:46'),
(473654, '0487641', 935, 'BC 17078', 'Avinash Vishwas Devraj', 661, 'D 13587', 'Suresh Galbahaddur Yadav', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 371, '691', '571', '2018-07-13', 'Y', 37, '2018-07-13 06:00:31', '13/07/1806:00:31', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:29:57', 'Y', 'Y', '2018-07-13 14:27:11', 'Y', 'N', '2018-07-13 14:27:47', '', '', '18786', 'N', 78, 78, 78, '2018-07-13 14:27:47'),
(473778, '0487765', 774, 'C 12901', 'Salman Sadik Shaikh', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 14:27:33', '13/07/1814:27:33', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 14:28:41', 'Y', 'N', '2018-07-13 14:28:59', '', '', '2522', 'N', 0, 15, 15, '2018-07-13 14:28:59'),
(473648, '0487635', 925, 'BC 17068', 'Navnath Madhukar Atpadkar', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '105', 391, '711', '209', '2018-07-13', 'Y', 51, '2018-07-13 05:50:49', '13/07/1805:50:49', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:31:55', 'Y', 'Y', '2018-07-13 14:28:35', 'Y', 'N', '2018-07-13 14:30:03', '', '', '8571', 'N', 39, 39, 39, '2018-07-13 14:30:03'),
(473661, '0487648', 313, 'C 12442', 'Kartarsing Eknath Rathod', 793, 'D 13718', 'Santosh Laxman Gawade', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 60, '488', '585', '2018-07-13', 'Y', 37, '2018-07-13 06:11:00', '13/07/1806:11:00', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:31:55', 'Y', 'Y', '2018-07-13 14:29:41', 'Y', 'N', '2018-07-13 14:30:06', '', '', '11444', 'N', 78, 78, 78, '2018-07-13 14:30:06'),
(473650, '0487637', 546, 'c 12673', 'Umesh Waman Dhum', 442, 'D 13369', 'Santosh Narayan Kini', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 325, '360', '497', '2018-07-13', 'Y', 37, '2018-07-13 05:51:50', '13/07/1805:51:50', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:33:51', 'Y', 'Y', '2018-07-13 14:31:38', 'Y', 'N', '2018-07-13 14:33:15', '', '', '35749', 'N', 78, 78, 78, '2018-07-13 14:33:15'),
(473602, '0487589', 99, 'C 12363', 'Vijay Kashiram Jadhav', 914, 'D 13840', 'Santosh  Shantaram Tare', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '104', 360, '395', '207', '2018-07-13', 'Y', 51, '2018-07-13 05:00:39', '13/07/1805:00:39', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:33:51', 'Y', 'N', '2018-07-13 14:32:29', 'Y', 'N', '2018-07-13 14:34:58', '', '', '28297', 'N', 19, 19, 19, '2018-07-13 14:34:58'),
(473620, '0487607', 612, 'C 12741', 'Ajay Mahadu Gavit', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 331, '366', '', '2018-07-13', 'Y', 37, '2018-07-13 05:28:23', '13/07/1805:28:23', 0, 'E', '05:40', '00:00', 'Y', 'Y', 'N', '2018-07-13 14:39:43', 'Y', 'Y', '2018-07-13 14:37:20', 'Y', 'N', '2018-07-13 14:38:30', '', 'Duty no-529 Driver - 17545', '24512', 'N', 78, 78, 78, '2018-07-13 14:38:30'),
(473782, '0487769', 610, 'C 12739', 'Jagdish Kisan Bambale', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 29, '2018-07-13 14:34:28', '13/07/1814:34:28', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 14:38:23', 'Y', 'N', '2018-07-13 14:38:38', '', 'Tray Box Use For date -11-07-2018', '15446', 'N', 0, 29, 29, '2018-07-13 14:38:38'),
(473673, '0487660', 741, 'C 12869', 'Vijay Kashinath rathod', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 396, '716', '', '2018-07-13', 'Y', 54, '2018-07-13 06:39:24', '13/07/1806:39:24', 0, 'E', '07:00', '17:00', 'Y', 'Y', 'N', '2018-07-13 14:41:40', 'Y', 'Y', '2018-07-13 14:39:21', 'Y', 'N', '2018-07-13 14:40:24', '', 'Duty No-43,MH04FK1167\r\nDRIVER-18538.', '9861', 'N', 39, 39, 39, '2018-07-13 14:40:24'),
(473647, '0487634', 655, 'C 12784', 'Shankar GurunathDalvi', 868, 'D 13793', 'Naresh Bhalchandra Vaze', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '250', 314, '349', '499', '2018-07-13', 'Y', 37, '2018-07-13 05:50:04', '13/07/1805:50:04', 2, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:43:37', 'Y', 'Y', '2018-07-13 14:40:55', 'Y', 'N', '2018-07-13 14:42:09', '', '', '9739', 'N', 78, 78, 78, '2018-07-13 14:42:09'),
(473675, '0487662', 856, 'C 12983', 'Dipak Manik Rasal', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '13', 398, '718', '25', '2018-07-13', 'Y', 51, '2018-07-13 06:40:35', '13/07/1806:40:35', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:45:32', 'Y', 'Y', '2018-07-13 14:42:21', 'Y', 'N', '2018-07-13 14:43:13', '', '', '6965', 'N', 39, 39, 39, '2018-07-13 14:43:13'),
(473786, '0487773', 907, 'BC 17051', 'Ganesh Tulshidas Patil', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 29, '2018-07-13 14:40:06', '13/07/1814:40:06', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 14:44:18', 'Y', 'N', '2018-07-13 14:44:36', '', 'Tray Box Use For Date - 11-07-2018', '10751', 'N', 0, 29, 29, '2018-07-13 14:44:36'),
(473646, '0487633', 544, 'C 12675', 'Ajay Padya Sambare', 825, 'D 13750', 'Hareshwar Padmakar Kindre', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 362, '682', '501', '2018-07-13', 'Y', 37, '2018-07-13 05:48:07', '13/07/1805:48:07', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:47:31', 'Y', 'Y', '2018-07-13 14:43:55', 'Y', 'N', '2018-07-13 14:44:52', '', '', '14776', 'N', 78, 78, 78, '2018-07-13 14:44:52'),
(473690, '0487677', 569, 'C 12699', 'Sadanand Krishna Chavan', 710, 'D 13636', 'Mohan Ladkya Chipat', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '138', 379, '699', '275', '2018-07-13', 'Y', 83, '2018-07-13 08:26:25', '13/07/1808:26:25', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:49:29', 'Y', 'Y', '2018-07-13 14:46:43', 'Y', 'N', '2018-07-13 14:47:51', '', '', '0', 'N', 77, 77, 77, '2018-07-13 14:47:51'),
(473788, '0487775', 11, 'C 12176', 'Pandharinath Narayan Thalekar', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 29, '2018-07-13 14:46:21', '13/07/1814:46:21', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 14:50:14', 'Y', 'N', '2018-07-13 14:50:31', '', 'Tray Box Use For Date - 11-07-2018, Duty No -463', '11447', 'N', 0, 29, 29, '2018-07-13 14:50:31'),
(473666, '0487653', 838, 'C 12965', 'Mahesh Pandurang Patil', 827, 'D 13752', 'Vinayak Ramchandra Kashid', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 333, '368', '587', '2018-07-13', 'Y', 37, '2018-07-13 06:23:48', '13/07/1806:23:48', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:53:24', 'Y', 'Y', '2018-07-13 14:51:17', 'Y', 'N', '2018-07-13 14:51:43', '', '', '14483', 'N', 78, 78, 78, '2018-07-13 14:51:43'),
(473681, '0487668', 378, 'C 12558', 'Sanjay Ramnath Wagh', 915, 'D 13841', 'Firoz Hasanmiya Shaikh', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '187', 272, '738', '373', '2018-07-13', 'Y', 83, '2018-07-13 07:11:03', '13/07/1807:11:03', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:55:22', 'Y', 'Y', '2018-07-13 14:52:43', 'Y', 'N', '2018-07-13 14:54:08', '', '', '14793', 'N', 77, 77, 77, '2018-07-13 14:54:08'),
(473670, '0487657', 528, 'C 12664', 'Babasaheb Shankar Patil', 977, 'BD 17585', 'Ganesh Baburao Vaze', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '259', 319, '354', '517', '2018-07-13', 'Y', 37, '2018-07-13 06:27:00', '13/07/1806:27:00', 2, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:55:22', 'Y', 'Y', '2018-07-13 14:52:54', 'Y', 'N', '2018-07-13 14:54:11', '', '', '19374', 'N', 78, 78, 78, '2018-07-13 14:54:11');
INSERT INTO `tbl_waybill_mst` (`fldi_waybill_id`, `fldv_waybill_no`, `fldi_conductor_id`, `fldv_conductor_employee_code`, `fldv_conductor_name`, `fldi_driver_id`, `fldv_driver_employee_code`, `fldv_driver_name`, `fldv_vehicle_id`, `fldv_vehicle_number`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldi_etim_id`, `fldv_etm_number`, `fldv_duty_number`, `flddt_date`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`, `fldv_waybill_created_date`, `fldi_shift_id`, `fldc_trip_status`, `fldv_start_time`, `fldv_end_time`, `fldc_waybill_open_close_status`, `fldc_handheld_open_close_status`, `fldc_handheld_no_data`, `flddt_handheld_close_datetime`, `fldc_coupon_open_close_status`, `fldc_coupon_no_data`, `flddt_coupon_close_datetime`, `fldc_collection_open_close_status`, `fldc_collection_no_data`, `flddt_collection_close_datetime`, `fldv_impress_given`, `fldm_remark`, `fldv_tray_value`, `fldc_driver_status`, `fldi_handheld_close_userid`, `fldi_coupon_close_userid`, `fldi_collection_close_userid`, `flddt_waybill_open_close_datetime`) VALUES
(473660, '0487647', 726, 'C 12854', 'Bhushan Murlidhar Patil', 159, 'D 13067', 'Manoj Ramesh Chavan', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '139', 383, '703', '277', '2018-07-13', 'Y', 19, '2018-07-13 06:10:08', '13/07/1806:10:08', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:55:23', 'Y', 'Y', '2018-07-13 14:54:23', 'Y', 'N', '2018-07-13 14:56:33', '', '', '25650', 'N', 83, 83, 83, '2018-07-13 14:56:33'),
(473795, '0487782', 841, 'C 12968', 'Samadhan Shivram Rathod', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 29, '2018-07-13 14:53:01', '13/07/1814:53:01', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 14:56:32', 'Y', 'N', '2018-07-13 14:56:50', '', 'Tray Box Use For Date - 11-07-2018,Duty no- 482', '8700', 'N', 0, 29, 29, '2018-07-13 14:56:50'),
(473677, '0487664', 39, 'C 12141', 'Sunil Shantaram Ghadi', 857, 'D 13782', 'Dipesh Ramchandra Mokashi', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '151', 385, '705', '301', '2018-07-13', 'Y', 19, '2018-07-13 06:58:26', '13/07/1806:58:26', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 14:57:19', 'Y', 'Y', '2018-07-13 14:55:42', 'Y', 'N', '2018-07-13 14:57:21', '', '', '18567', 'N', 77, 77, 77, '2018-07-13 14:57:21'),
(473797, '0487784', 976, 'BC 18035', 'Ashok Yadav Paratwagh', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 15, '2018-07-13 14:57:31', '13/07/1814:57:31', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 14:59:48', 'Y', 'N', '2018-07-13 14:59:58', '', 'FOR TICKET ISSUE.', '9081', 'N', 0, 15, 15, '2018-07-13 14:59:58'),
(473588, '0487575', 606, 'C 12735', 'Sunil Vishnu Kasar', 962, 'BD 17570', 'Gautam Bhimrao Kharat', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '178', 278, '744', '355', '2018-07-13', 'Y', 19, '2018-07-13 01:11:43', '13/07/1801:11:43', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 15:01:11', 'Y', 'Y', '2018-07-13 14:58:36', 'Y', 'N', '2018-07-13 15:00:05', '', '', '21745', 'N', 77, 77, 77, '2018-07-13 15:00:05'),
(473636, '0487623', 621, 'C 12750', 'Nilesh Shantaram jadyar', 655, 'D 13582', 'Jitendra Vasant  Mahale', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 361, '681', '519', '2018-07-13', 'Y', 37, '2018-07-13 05:39:03', '13/07/1805:39:03', 0, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 15:03:09', 'Y', 'Y', '2018-07-13 15:00:54', 'Y', 'N', '2018-07-13 15:01:21', '', '', '6681', 'N', 78, 78, 78, '2018-07-13 15:01:21'),
(473701, '0487688', 168, 'C 12249', 'Nitin  Narayan Vaidya', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '132', 276, '742', '263', '2018-07-13', 'Y', 83, '2018-07-13 11:03:39', '13/07/1811:03:39', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 15:03:08', 'Y', 'Y', '2018-07-13 15:00:36', 'Y', 'N', '2018-07-13 15:01:36', '', '', '0', 'N', 83, 83, 83, '2018-07-13 15:01:36'),
(473800, '0487787', 561, 'C 12691', 'Kashinath Chataru Pawar', 266, 'D 13188', 'Satishchandra Devraj Yadav', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '58', 398, '718', '116', '2018-07-13', 'Y', 39, '2018-07-13 15:01:25', '13/07/1815:01:25', 2, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 15:05:41', 'Y', 'N', '2018-07-13 15:05:49', '', '', '6014', 'N', 0, 39, 39, '2018-07-13 15:05:49'),
(473799, '0487786', 528, 'C 12664', 'Babasaheb Shankar Patil', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'C', 29, '2018-07-13 15:00:13', '13/07/1815:00:12', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 15:06:07', 'Y', 'N', '2018-07-13 15:06:22', '', 'Tray Box Use For Date - 11-07-2018,Duty no - 487', '19374', 'N', 0, 29, 29, '2018-07-13 15:06:22'),
(473678, '0487665', 280, 'C 12389', 'Sunil Tukaram Awhad', 742, 'D 13668', 'Vilas Sahebrao Rathod', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '142', 288, '754', '283', '2018-07-13', 'Y', 19, '2018-07-13 06:59:25', '13/07/1806:59:25', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-13 15:09:00', 'Y', 'Y', '2018-07-13 15:07:24', 'Y', 'N', '2018-07-13 15:12:01', '', '', '15243', 'N', 83, 83, 83, '2018-07-13 15:12:01'),
(473808, '0487795', 765, 'C 12893', 'Sunil Pandurang Nokti', 0, '', '', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '0', 0, '', '', '2018-07-13', 'Y', 29, '2018-07-13 15:08:03', '13/07/1815:08:03', 0, 'E', '00:00', '00:00', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'N', '2018-07-13 15:16:11', 'Y', 'N', '2018-07-13 15:16:25', '', 'Tray Box Use For Date - 11-07-2018,Duty no -469,D no- 13449', '8833', 'N', 0, 29, 29, '2018-07-13 15:16:25'),
(473685, '0487672', 877, 'BC 17021', 'Sunil Daji Gorad', 0, '', '', 23, 'MH04FK1162', 'V-Navghar', '01', 'V-Navghar', '01', '6', 397, '717', '11', '2018-07-13', 'Y', 54, '2018-07-13 07:29:14', '13/07/1807:29:14', 1, 'R', '', '', 'Y', 'N', 'N', '0000-00-00 00:00:00', 'Y', 'Y', '2018-07-13 15:18:42', 'Y', 'N', '2018-07-13 15:19:06', '', 'D 13771,Balaji Udhav Waghmare', '10797', 'N', 0, 39, 39, '2018-07-13 15:19:06'),
(471160, '0485147', 106, 'C 12343', 'Jaydev Ram Kamble', 781, 'D 13706', 'Haresh Bhaskar Patil', 0, '', 'V-Navghar', '01', 'V-Navghar', '01', '85', 387, '707', '169', '2018-07-02', 'Y', 78, '2018-07-02 00:54:08', '02/07/1800:54:08', 1, 'R', '', '', 'Y', 'Y', 'N', '2018-07-02 11:40:08', 'Y', 'Y', '2018-07-02 17:33:00', 'Y', 'N', '2018-07-02 11:32:29', '', '', '2071', '\0', 69, 69, 83894304, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_mst_log`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_mst_log` (
  `fldi_waybill_id` bigint(60) NOT NULL,
  `fldv_waybill_no` varchar(20) NOT NULL,
  `fldi_conductor_id` int(50) NOT NULL,
  `fldv_conductor_employee_code` varchar(100) NOT NULL,
  `fldv_conductor_name` varchar(100) NOT NULL,
  `fldi_driver_id` int(5) NOT NULL,
  `fldv_driver_employee_code` varchar(100) NOT NULL,
  `fldv_driver_name` varchar(100) NOT NULL,
  `fldv_vehicle_id` int(5) NOT NULL,
  `fldv_vehicle_number` varchar(25) NOT NULL,
  `fldv_division_name` varchar(100) NOT NULL,
  `fldv_division_code` varchar(5) NOT NULL,
  `fldv_depot_name` varchar(100) NOT NULL,
  `fldv_depot_code` varchar(5) NOT NULL,
  `fldv_schedule` varchar(10) NOT NULL,
  `fldi_etim_id` bigint(50) NOT NULL,
  `fldv_etm_number` varchar(5) NOT NULL,
  `fldv_duty_number` varchar(25) NOT NULL,
  `flddt_date` date NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `fldi_user_id` int(5) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL,
  `fldv_waybill_created_date` varchar(16) NOT NULL,
  `fldi_shift_id` int(5) NOT NULL,
  `fldc_trip_status` char(1) NOT NULL,
  `fldv_start_time` varchar(10) NOT NULL,
  `fldv_end_time` varchar(10) NOT NULL,
  `fldv_impress_given` varchar(10) NOT NULL,
  `fldm_remark` mediumtext NOT NULL,
  `fldv_tray_value` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_no_mst`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_no_mst` (
  `fldi_waybill_no_cnt` bigint(20) NOT NULL DEFAULT '0',
  `fldi_user_id` int(5) NOT NULL,
  `fldc_status` char(1) NOT NULL,
  `flddt_last_upd_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_schedule_details`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_schedule_details` (
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_employee_code` varchar(100) DEFAULT NULL,
  `fldv_duty_number` varchar(25) DEFAULT NULL,
  `fldi_route_no` varchar(10) DEFAULT NULL,
  `fldv_scedule_number` varchar(25) DEFAULT NULL,
  `fldi_trip_no` int(5) DEFAULT NULL,
  `fldi_shift_id` bigint(60) DEFAULT NULL,
  `fldv_from_stage` varchar(200) DEFAULT NULL,
  `fldv_to_stage` varchar(200) DEFAULT NULL,
  `fldv_from_time_hr` varchar(10) DEFAULT NULL,
  `fldv_from_time_min` varchar(10) DEFAULT NULL,
  `fldv_to_time_hr` varchar(10) DEFAULT NULL,
  `fldv_to_time_min` varchar(10) DEFAULT NULL,
  `fldv_duty_km` varchar(100) DEFAULT NULL,
  `fldv_spread_over_time` varchar(10) DEFAULT NULL,
  `fldv_sterring_time` varchar(10) DEFAULT NULL,
  `fldv_actual_duty_kms` int(15) DEFAULT NULL,
  `fldv_scheduled_kms` int(15) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT NULL,
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_ticket_handheld_data`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_ticket_handheld_data` (
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldv_driver_name` varchar(100) DEFAULT NULL,
  `fldv_vehicle_number` varchar(25) DEFAULT NULL,
  `fldv_division_name` varchar(100) DEFAULT NULL,
  `fldv_division_code` varchar(5) DEFAULT NULL,
  `fldv_depot_name` varchar(100) DEFAULT NULL,
  `fldv_depot_code` varchar(5) DEFAULT NULL,
  `fldv_schedule` varchar(10) DEFAULT NULL,
  `fldv_etm_number` varchar(5) DEFAULT NULL,
  `fldv_waybill_date_time` varchar(50) DEFAULT NULL,
  `fldv_ticket_data` varchar(400) DEFAULT NULL,
  `fldv_vendor_name` varchar(50) NOT NULL,
  `fldc_status` char(1) DEFAULT 'N',
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  KEY `idxwayupdate` (`fldv_waybill_no`,`fldv_etm_number`),
  KEY `Status` (`fldc_status`,`flddt_last_upd_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_ticket_handheld_data_dummy`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_ticket_handheld_data_dummy` (
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldv_driver_name` varchar(100) DEFAULT NULL,
  `fldv_vehicle_number` varchar(25) DEFAULT NULL,
  `fldv_division_name` varchar(100) DEFAULT NULL,
  `fldv_division_code` varchar(5) DEFAULT NULL,
  `fldv_depot_name` varchar(100) DEFAULT NULL,
  `fldv_depot_code` varchar(5) DEFAULT NULL,
  `fldv_schedule` varchar(10) DEFAULT NULL,
  `fldv_etm_number` varchar(5) DEFAULT NULL,
  `fldv_waybill_date_time` varchar(50) DEFAULT NULL,
  `fldv_ticket_data` varchar(400) DEFAULT NULL,
  `fldv_vendor_name` varchar(50) NOT NULL,
  `fldc_status` char(1) DEFAULT 'N',
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL,
  KEY `idxstatus` (`fldc_status`),
  KEY `idxwayupdate` (`fldv_waybill_no`,`fldv_etm_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_waybill_ticket_handheld_data_dummy`
--

INSERT INTO `tbl_waybill_ticket_handheld_data_dummy` (`fldv_waybill_no`, `fldv_conductor_name`, `fldv_driver_name`, `fldv_vehicle_number`, `fldv_division_name`, `fldv_division_code`, `fldv_depot_name`, `fldv_depot_code`, `fldv_schedule`, `fldv_etm_number`, `fldv_waybill_date_time`, `fldv_ticket_data`, `fldv_vendor_name`, `fldc_status`, `fldi_user_id`, `flddt_last_upd_date`) VALUES
('0487526', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '12/07/1816:22:04\n', '0487526 01 114 00000022 001 002 03 00 00 00 0002100 12/07/18 16:25:33              00 0 0002100 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-25 15:06:03'),
('0487526', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '12/07/1816:22:04\n', '0487526 01 114 00000021 001 002 02 00 00 00 0001400 12/07/18 16:25:21              00 0 0001400 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-25 15:06:03'),
('0487526', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '12/07/1816:22:04\n', '0487526 01 114 00000020 001 002 01 00 00 00 0000700 12/07/18 16:25:15              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-25 15:06:02'),
('0487691', 'C 12485   ', '          ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '13/07/1811:53:02\n', '0487691 01 114 00000019 001 002 01 00 00 00 0000700 13/07/18 11:53:19              00 0 0000700 0000000 C 12485    564 ', 'BALAJI', 'N', 12398, '2018-07-20 14:45:26'),
('0487620', 'C 12828   ', 'BD 17585  ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '13/07/1805:38:02\n', '0487620 01 114 00000016 001 002 01 00 00 00 0000700 13/07/18 07:14:13              00 0 0000700 0000000 C 12828    564 ', 'BALAJI', 'N', 12398, '2018-07-20 13:57:14'),
('0487691', 'C 12485   ', '          ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '13/07/1811:53:02\n', '0487691 01 114 00000018 001 002 02 00 00 00 0001400 13/07/18 11:53:15              00 0 0001400 0000000 C 12485    564 ', 'BALAJI', 'N', 12398, '2018-07-20 14:45:26'),
('0487620', 'C 12828   ', 'BD 17585  ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '0   ', '564', '13/07/1805:38:02\n', '0487620 01 114 00000017 001 002 03 00 00 00 0002100 13/07/18 07:14:18              00 0 0002100 0000000 C 12828    564 ', 'BALAJI', 'N', 12398, '2018-07-20 13:57:14'),
('0487664', 'Sunil Shantaram Ghadi', 'Dipesh Ramchandra Mokashi', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '151 ', '564', '13/07/1806:58:26\n', '0487664 01 114 00000015 001 002 01 00 00 00 0000700 13/07/18 06:58:45              00 0 0000700 0000000 C 12141    564 ', 'BALAJI', 'N', 12398, '2018-07-19 19:40:20'),
('0487664', 'Sunil Shantaram Ghadi', 'Dipesh Ramchandra Mokashi', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '151 ', '564', '13/07/1806:58:26\n', '0487664 01 114 00000014 001 002 01 00 00 00 0000700 13/07/18 06:58:40              00 0 0000700 0000000 C 12141    564 ', 'BALAJI', 'N', 12398, '2018-07-19 19:40:20'),
('0487664', 'Sunil Shantaram Ghadi', 'Dipesh Ramchandra Mokashi', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '151 ', '470', '13/07/1806:58:26\n', '0487664 01 101 00000038 001 002 05 00 00 00 0002500 13/07/18 06:59:10              00 0 0002500 0000000 C 12141    470 ', 'BALAJI', 'N', 12398, '2018-07-19 19:34:16'),
('0487664', 'Sunil Shantaram Ghadi', 'Dipesh Ramchandra Mokashi', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '151 ', '470', '13/07/1806:58:26\n', '0487664 01 101 00000037 001 002 02 00 00 00 0001000 13/07/18 06:59:05              00 0 0001000 0000000 C 12141    470 ', 'BALAJI', 'N', 12398, '2018-07-19 19:34:16'),
('0487405', 'Sainath Balaji Gaikwad', 'Sunil Tanaji Gaikwad', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '70  ', '564', '12/07/1812:31:57\n', '0487405 01 114 00000013 001 002 05 00 00 00 0003500 12/07/18 12:32:26              00 0 0003500 0000000 BC 18037   564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:49:40'),
('0487546', 'Ramesh Sarichand Rathod', '', '          ', 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '564', '12/07/1815:42:48\n', '0487546 01 114 00000012 001 002 01 00 00 00 0000700 12/07/18 15:43:29              00 0 0000700 0000000 C 12443    564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:46:20'),
('0487546', 'Ramesh Sarichand Rathod', '', '          ', 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '564', '12/07/1815:42:48\n', '0487546 01 114 00000011 001 002 02 00 00 00 0001400 12/07/18 15:43:12              00 0 0001400 0000000 C 12443    564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:46:20'),
('0487546', 'Ramesh Sarichand Rathod', '', '          ', 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '564', '12/07/1815:42:48\n', '0487546 01 114 00000012 001 002 01 00 00 00 0000700 12/07/18 15:43:29              00 0 0000700 0000000 C 12443    564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:45:28'),
('0487546', 'Ramesh Sarichand Rathod', '', '          ', 'V-Navghar', '01', 'V-Navghar', '01', 'VSE2', '564', '12/07/1815:42:48\n', '0487546 01 114 00000011 001 002 02 00 00 00 0001400 12/07/18 15:43:12              00 0 0001400 0000000 C 12443    564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:45:28'),
('0487526', 'Shravan Baburao Wagh', 'Rajendra Narayan Khedekar', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '12/07/1816:22:04\n', '0487526 01 114 00000010 001 002 02 00 00 00 0001400 12/07/18 16:26:16              00 0 0001400 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:17:35'),
('0487526', 'Shravan Baburao Wagh', 'Rajendra Narayan Khedekar', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '12/07/1816:22:04\n', '0487526 01 114 00000009 001 002 05 00 00 00 0003500 12/07/18 16:26:10              00 0 0003500 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:17:35'),
('0487526', 'Shravan Baburao Wagh', 'Rajendra Narayan Khedekar', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '12/07/1816:22:04\n', '0487526 01 114 00000008 001 002 01 00 00 00 0000700 12/07/18 16:26:06              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-19 18:17:35'),
('0488880', NULL, NULL, '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-19 15:15:15'),
('0488880', NULL, NULL, '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-19 15:15:15'),
('0488880', NULL, NULL, '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-19 15:15:15'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:27:35'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:27:34'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:27:34'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:24:11'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:24:11'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:24:11'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:14:52'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:14:52'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:14:52'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:11:41'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:11:41'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:11:41'),
('N048888', '0C 12719  ', ' D 13459  ', '          ', ' V-Navgha', 'r0', '1V-Navgha', 'r0', '1142', ' 56', ' 17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:08:38'),
('N048888', '0C 12719  ', ' D 13459  ', '          ', ' V-Navgha', 'r0', '1V-Navgha', 'r0', '1142', ' 56', ' 17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:08:38'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-17 18:40:54'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-17 18:40:54'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-17 18:40:55'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 13:12:44'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 13:12:47'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 13:12:47'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:23:10'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:23:10'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:23:10'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:41:22'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:41:22'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:41:22'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:42:43'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:42:43'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:42:43'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:43:54'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:43:54'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:43:54'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:57:57'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:57:57'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 14:57:57'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 15:58:36'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 15:58:36'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 15:58:36'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:00:52'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:00:52'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:00:52'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:05:49'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000005 001 002 01 00 00 00 0000700 17/07/18 17:24:53              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:05:49'),
('N048888', '0C 12719  ', ' D 13459  ', '          ', ' V-Navgha', 'r0', '1V-Navgha', 'r0', '1142', ' 56', ' 17/07/1817:22:53\n', '0488880 01 114 00000004 001 002 01 00 00 00 0000700 17/07/18 17:24:50              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:08:38'),
('0488880', 'C 12719   ', 'D 13459   ', '          ', 'V-Navghar', '01', 'V-Navghar', '01', '142 ', '564', '17/07/1817:22:53\n', '0488880 01 114 00000006 001 002 01 00 00 00 0000700 17/07/18 17:24:56              00 0 0000700 0000000 C 12719    564 ', 'BALAJI', 'N', 12398, '2018-07-18 16:05:49'),
('0000002', 'SHYAM     ', 'ASHISH    ', 'MP09E4321 ', 'VASAI    ', '01', 'VASAI    ', '05', '1230', '470', '13/07/1816:51:44\n', '0000002 01 101 00000030 001 002 01 00 00 00 0000500 13/07/18 16:52:25              00 0 0000500 0000000 SHYAM      470 ', 'BALAJI', 'N', 12398, '2018-07-17 17:58:33'),
('0000002', 'SHYAM     ', 'ASHISH    ', 'MP09E4321 ', 'VASAI    ', '01', 'VASAI    ', '05', '1230', '470', '13/07/1816:51:44\n', '0000002 01 101 00000029 001 002 02 00 00 00 0001000 13/07/18 16:52:19              00 0 0001000 0000000 SHYAM      470 ', 'BALAJI', 'N', 12398, '2018-07-17 17:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waybill_ticket_handheld_data_old`
--

CREATE TABLE IF NOT EXISTS `tbl_waybill_ticket_handheld_data_old` (
  `fldv_waybill_no` varchar(20) DEFAULT NULL,
  `fldv_conductor_name` varchar(100) DEFAULT NULL,
  `fldv_driver_name` varchar(100) DEFAULT NULL,
  `fldv_vehicle_number` varchar(25) DEFAULT NULL,
  `fldv_division_name` varchar(100) DEFAULT NULL,
  `fldv_division_code` varchar(5) DEFAULT NULL,
  `fldv_depot_name` varchar(100) DEFAULT NULL,
  `fldv_depot_code` varchar(5) DEFAULT NULL,
  `fldv_schedule` varchar(10) DEFAULT NULL,
  `fldv_etm_number` varchar(5) DEFAULT NULL,
  `fldv_waybill_date_time` varchar(50) DEFAULT NULL,
  `fldv_ticket_data` varchar(400) DEFAULT NULL,
  `fldc_status` char(1) DEFAULT 'N',
  `fldi_user_id` int(5) DEFAULT NULL,
  `flddt_last_upd_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT=' tbl_waybill_ticket_handheld_data_old';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waypoint`
--

CREATE TABLE IF NOT EXISTS `tbl_waypoint` (
  `fldi_route_no` int(10) NOT NULL,
  `fldi_stop_name` varchar(200) NOT NULL,
  `fldv_latitude` float NOT NULL,
  `fldv_longitude` float NOT NULL,
  `flddt_last_updated` datetime NOT NULL,
  `fldi_waypoint_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fldi_waypoint_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=514 ;

-- --------------------------------------------------------

--
-- Table structure for table `temp1`
--

CREATE TABLE IF NOT EXISTS `temp1` (
  `fldv_ticket_data` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp`
--

CREATE TABLE IF NOT EXISTS `tmp` (
  `cabnumber` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
