-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2025 at 09:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event management database`
--
CREATE DATABASE IF NOT EXISTS `event management database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `event management database`;

-- --------------------------------------------------------

--
-- Table structure for table `attendee`
--

DROP TABLE IF EXISTS `attendee`;
CREATE TABLE `attendee` (
  `ATT_ID` int(5) NOT NULL,
  `ATT_FNAME` varchar(40) NOT NULL,
  `ATT_LNAME` varchar(40) NOT NULL,
  `ATT_PHONE_NUM` char(12) NOT NULL,
  `ATT_EMAIL` varchar(80) NOT NULL,
  `ATT_REG_DATE` date NOT NULL,
  `ATT_MEM_STATUS` enum('Member','Non_Member') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendee`
--

INSERT INTO `attendee` (`ATT_ID`, `ATT_FNAME`, `ATT_LNAME`, `ATT_PHONE_NUM`, `ATT_EMAIL`, `ATT_REG_DATE`, `ATT_MEM_STATUS`) VALUES
(40001, 'Liam', 'Johnson', '317-555-1001', 'liam.johnson@email.com', '2025-06-01', 'Member'),
(40002, 'Olivia', 'Smith', '312-555-2034', 'olivia.smith@email.com', '2025-06-03', 'Member'),
(40003, 'Noah', 'Brown', '219-555-3045', 'noah.brown@email.com', '2025-06-05', 'Non_Member'),
(40004, 'Emma', 'Davis', '765-555-4076', 'emma.davis@email.com', '2025-06-07', 'Non_Member'),
(40005, 'Aiden', 'Martinez', '574-555-5087', 'aiden.martinez@email.com', '2025-06-08', 'Non_Member'),
(40006, 'Sophia', 'Taylor', '317-555-6098', 'sophia.taylor@email.com', '2025-06-10', 'Non_Member');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `BOOKING_ID` int(8) NOT NULL,
  `BOOKING_DATE` datetime NOT NULL,
  `BOOKING_QUANTITY` int(3) NOT NULL,
  `BOOKING_STATUS` enum('Completed','Pending','Cancelled') DEFAULT NULL,
  `BOOKING_EXP_TIME` datetime DEFAULT NULL,
  `ATT_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BOOKING_ID`, `BOOKING_DATE`, `BOOKING_QUANTITY`, `BOOKING_STATUS`, `BOOKING_EXP_TIME`, `ATT_ID`) VALUES
(60000001, '2025-08-01 10:00:00', 2, 'Completed', '2025-08-01 10:30:00', 40001),
(60000002, '2025-08-02 12:15:00', 1, 'Pending', '2025-08-02 12:45:00', 40002),
(60000003, '2025-08-03 09:30:00', 3, 'Cancelled', '2025-08-03 10:00:00', 40003),
(60000004, '2025-08-04 14:00:00', 1, 'Completed', '2025-08-04 14:30:00', 40004),
(60000005, '2025-08-05 11:20:00', 4, 'Pending', '2025-08-05 11:50:00', 40005),
(60000006, '2025-08-06 15:10:00', 2, 'Completed', '2025-08-06 15:40:00', 40006),
(60000007, '2025-08-07 13:00:00', 1, 'Pending', '2025-08-07 13:30:00', 40001);

-- --------------------------------------------------------

--
-- Stand-in structure for view `booking_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `booking_summary`;
CREATE TABLE `booking_summary` (
`BOOKING_ID` int(8)
,`ATT_FNAME` varchar(40)
,`ATT_LNAME` varchar(40)
,`BOOKING_STATUS` enum('Completed','Pending','Cancelled')
,`PAY_STATUS` enum('Completed','Pending','Cancelled')
);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `EVENT_ID` int(6) NOT NULL,
  `EVENT_NAME` varchar(50) NOT NULL,
  `EVENT_TYPE` enum('Field Event','Indoor Event') NOT NULL,
  `EVENT_DATE` datetime NOT NULL,
  `ORG_ID` int(6) NOT NULL,
  `EVENT_CAPACITY` int(5) DEFAULT NULL,
  `EVENT_STATUS` varchar(20) NOT NULL,
  `EVENT_ACCESS` enum('Public','Private') NOT NULL,
  `FACILITY_ID` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`EVENT_ID`, `EVENT_NAME`, `EVENT_TYPE`, `EVENT_DATE`, `ORG_ID`, `EVENT_CAPACITY`, `EVENT_STATUS`, `EVENT_ACCESS`, `FACILITY_ID`) VALUES
(100001, 'NFL League Match', 'Field Event', '2025-09-15 18:30:00', 200001, 70000, 'Scheduled', 'Public', 'FH1'),
(100002, 'Monster Energy AMA Supercross', 'Field Event', '2025-10-02 19:00:00', 200002, 70000, 'Scheduled', 'Public', 'FH1'),
(100003, 'Ed Sheeran – LOOP Tour Concert', 'Indoor Event', '2025-11-20 20:00:00', 200003, 1800, 'Scheduled', 'Public', 'EH1'),
(100004, 'WrestleMania Fan Experience', 'Indoor Event', '2025-12-05 17:00:00', 200004, 1500, 'Scheduled', 'Public', 'FH1'),
(100005, 'Corporate Leadership Training', 'Indoor Event', '2025-08-10 09:00:00', 200005, 200, 'Scheduled', 'Private', 'MR1'),
(100006, 'Annual Awards Banquet', 'Indoor Event', '2025-09-22 18:00:00', 200006, 1200, 'Scheduled', 'Private', 'LOP1'),
(100007, 'Wedding Reception Dinner', 'Indoor Event', '2025-10-18 16:00:00', 200007, 150, 'Scheduled', 'Private', 'QBS1'),
(100008, 'Corporate Networking Luncheon', 'Indoor Event', '2025-11-05 12:00:00', 200001, 150, 'Scheduled', 'Private', 'MR2'),
(100009, 'Club Lounge Match Screening Night', 'Indoor Event', '2025-12-12 19:30:00', 200001, 500, 'Scheduled', 'Public', 'WCL1');

-- --------------------------------------------------------

--
-- Table structure for table `event_coordinator`
--

DROP TABLE IF EXISTS `event_coordinator`;
CREATE TABLE `event_coordinator` (
  `COORD_ID` varchar(3) NOT NULL,
  `COORD_FNAME` varchar(30) NOT NULL,
  `COORD_LNAME` varchar(30) NOT NULL,
  `COORD_PHONE_NUM` char(12) NOT NULL,
  `COORD_EMAIL` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_coordinator`
--

INSERT INTO `event_coordinator` (`COORD_ID`, `COORD_FNAME`, `COORD_LNAME`, `COORD_PHONE_NUM`, `COORD_EMAIL`) VALUES
('CD1', 'Alex', 'Toon', '317-555-1201', 'mohid.qadeer@lucasevents.com'),
('CD2', 'Sarah', 'Johnson', '312-555-2345', 'sarah.johnson@lucasevents.com'),
('CD3', 'David', 'Miller', '219-555-6789', 'david.miller@lucasevents.com'),
('CD4', 'Ayesha', 'Khan', '765-555-4821', 'ayesha.khan@lucasevents.com'),
('CD5', 'Robert', 'Brown', '574-555-9103', 'robert.brown@lucasevents.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `event_details`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `event_details`;
CREATE TABLE `event_details` (
`EVENT_NAME` varchar(50)
,`EVENT_DATE` datetime
,`FACILITY_TYPE` varchar(30)
,`ORG_NAME` varchar(60)
);

-- --------------------------------------------------------

--
-- Table structure for table `event_sponsor`
--

DROP TABLE IF EXISTS `event_sponsor`;
CREATE TABLE `event_sponsor` (
  `EVENT_ID` int(6) NOT NULL,
  `SPONSOR_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_sponsor`
--

INSERT INTO `event_sponsor` (`EVENT_ID`, `SPONSOR_ID`) VALUES
(100001, 800001),
(100001, 800002),
(100003, 800001),
(100003, 800004),
(100006, 800002),
(100006, 800005),
(100009, 800003);

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
  `FACILITY_ID` varchar(4) NOT NULL,
  `FACILITY_TYPE` varchar(30) NOT NULL,
  `FACILITY_CAPACITY` int(6) NOT NULL,
  `FACILITY_LEVEL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`FACILITY_ID`, `FACILITY_TYPE`, `FACILITY_CAPACITY`, `FACILITY_LEVEL`) VALUES
('BLT1', 'Terrace', 800, 'Terrace Level'),
('ECL1', 'East Club Lounge', 450, 'Street Level'),
('EH1', 'Exhibit Hall', 1800, 'Event Level'),
('EH2', 'Exhibit Hall', 1500, 'Event Level'),
('FH1', 'Field', 70000, 'Event Level'),
('LOP1', 'Lucas Oil Plaza', 1200, 'Street Level'),
('MR1', 'Meeting Room', 200, 'Event Level'),
('MR2', 'Meeting Room', 150, 'Event Level'),
('MR3', 'Meeting Room', 300, 'Event Level'),
('QBS1', 'QuarterBack Suite', 150, 'Upper Suite Level'),
('WCL1', 'West Club Lounge', 500, 'Street Level');

-- --------------------------------------------------------

--
-- Table structure for table `facility_service`
--

DROP TABLE IF EXISTS `facility_service`;
CREATE TABLE `facility_service` (
  `SERVICE_ID` int(4) NOT NULL,
  `SERVICE_CATEGORY` varchar(30) NOT NULL,
  `SERVICE_DESC` varchar(200) NOT NULL,
  `SERVICE_COST` decimal(8,2) NOT NULL,
  `EVENT_ID` int(6) NOT NULL,
  `VENDOR_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facility_service`
--

INSERT INTO `facility_service` (`SERVICE_ID`, `SERVICE_CATEGORY`, `SERVICE_DESC`, `SERVICE_COST`, `EVENT_ID`, `VENDOR_ID`) VALUES
(1001, 'Catering', 'Buffet lunch and beverages per attendee', 25.00, 100005, 10001),
(1002, 'Security', 'Event security personnel per hour', 40.00, 100001, 10002),
(1003, 'Internet', 'High-speed internet setup for event', 500.00, 100003, 10003),
(1004, 'Audio & Visual', 'Sound and video equipment rental', 300.00, 100004, 10004),
(1005, 'Cleaning', 'Venue cleaning before and after event', 200.00, 100006, 10005),
(1006, 'Beverages', 'Soft drinks and coffee for attendees', 10.00, 100005, 10001),
(1007, 'Dessert Service', 'Cakes and pastries per attendee', 8.00, 100005, 10001);

-- --------------------------------------------------------

--
-- Table structure for table `organizer`
--

DROP TABLE IF EXISTS `organizer`;
CREATE TABLE `organizer` (
  `ORG_ID` int(6) NOT NULL,
  `ORG_NAME` varchar(60) NOT NULL,
  `ORG_PHONE_NUM` char(12) NOT NULL,
  `ORG_EMAIL` varchar(80) NOT NULL,
  `ORG_TYPE` varchar(30) NOT NULL,
  `COORD_ID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizer`
--

INSERT INTO `organizer` (`ORG_ID`, `ORG_NAME`, `ORG_PHONE_NUM`, `ORG_EMAIL`, `ORG_TYPE`, `COORD_ID`) VALUES
(200001, 'John Williams', '317-555-1011', 'john.williams@org.com', 'Corporate', 'CD1'),
(200002, 'Emily Carter', '312-555-2244', 'emily.carter@org.com', 'Non-Profit', 'CD2'),
(200003, 'Michael Brown', '219-555-3388', 'michael.brown@org.com', 'Educational', 'CD3'),
(200004, 'Aisha Rahman', '765-555-4499', 'aisha.rahman@org.com', 'Government', 'CD4'),
(200005, 'Daniel Thompson', '574-555-5566', 'daniel.thompson@org.com', 'Corporate', 'CD5'),
(200006, 'Sophia Martinez', '317-555-6677', 'sophia.martinez@org.com', 'Community', 'CD1'),
(200007, 'Robert Kim', '312-555-7788', 'robert.kim@org.com', 'Private', 'CD2');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `PAY_ID` int(8) NOT NULL,
  `PAY_AMOUNT` decimal(8,2) NOT NULL,
  `PAY_DATE` datetime DEFAULT NULL,
  `PAY_STATUS` enum('Completed','Pending','Cancelled') NOT NULL,
  `PAY_TRANS_ID` varchar(20) DEFAULT NULL,
  `BOOKING_ID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PAY_ID`, `PAY_AMOUNT`, `PAY_DATE`, `PAY_STATUS`, `PAY_TRANS_ID`, `BOOKING_ID`) VALUES
(70000001, 50.00, '2025-08-01 10:05:00', 'Completed', 'TXN10000001', 60000001),
(70000002, 25.00, '2025-08-02 12:20:00', 'Pending', 'TXN10000002', 60000002),
(70000003, 75.00, '2025-08-03 09:35:00', 'Cancelled', 'TXN10000003', 60000003),
(70000004, 25.00, '2025-08-04 14:10:00', 'Completed', 'TXN10000004', 60000004),
(70000005, 100.00, '2025-08-05 11:25:00', 'Pending', 'TXN10000005', 60000005),
(70000006, 50.00, '2025-08-06 15:20:00', 'Completed', 'TXN10000006', 60000006),
(70000007, 25.00, '2025-08-07 13:10:00', 'Pending', 'TXN10000007', 60000007);

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
CREATE TABLE `sponsor` (
  `SPONSOR_ID` int(6) NOT NULL,
  `SPONSOR_NAME` varchar(100) NOT NULL,
  `SPONSOR_LEVEL` enum('Platinum','Gold','Silver') NOT NULL,
  `SPONSOR_AMOUNT` decimal(10,2) NOT NULL,
  `SPONSOR_EMAIL` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`SPONSOR_ID`, `SPONSOR_NAME`, `SPONSOR_LEVEL`, `SPONSOR_AMOUNT`, `SPONSOR_EMAIL`) VALUES
(800001, 'GlobalTech Industries', 'Platinum', 150000.00, 'contact@globaltech.com'),
(800002, 'Summit Financial Group', 'Gold', 75000.00, 'info@summitfinance.com'),
(800003, 'BrightWave Marketing', 'Silver', 30000.00, 'support@brightwave.com'),
(800004, 'NextGen Energy Solutions', 'Gold', 90000.00, 'partnerships@nextgenenergy.com'),
(800005, 'UrbanLife Beverages', 'Silver', 25000.00, 'sponsor@urbanlifebev.com');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `STAFF_ID` int(6) NOT NULL,
  `STAFF_FNAME` varchar(20) NOT NULL,
  `STAFF_LNAME` varchar(20) NOT NULL,
  `STAFF_ROLE` enum('Front_End','Back_End') NOT NULL,
  `STAFF_SHIFT` time NOT NULL,
  `STAFF_WAGE` decimal(4,2) NOT NULL,
  `EVENT_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`STAFF_ID`, `STAFF_FNAME`, `STAFF_LNAME`, `STAFF_ROLE`, `STAFF_SHIFT`, `STAFF_WAGE`, `EVENT_ID`) VALUES
(300001, 'Alice', 'Johnson', 'Front_End', '09:00:00', 15.50, 100001),
(300002, 'Brian', 'Smith', 'Back_End', '10:00:00', 16.75, 100002),
(300003, 'Carla', 'Lee', 'Front_End', '14:00:00', 18.00, 100003),
(300004, 'Daniel', 'Martinez', 'Back_End', '16:00:00', 17.50, 100004),
(300005, 'Emma', 'Brown', 'Front_End', '08:00:00', 15.25, 100005),
(300006, 'Fiona', 'Clark', 'Back_End', '09:00:00', 16.00, 100005),
(300007, 'George', 'Davis', 'Front_End', '13:00:00', 15.75, 100005);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `TICKET_ID` int(8) NOT NULL,
  `TICKET_TYPE` enum('Standard','VIP') NOT NULL,
  `TICKET_SEAT_NUM` varchar(10) DEFAULT NULL,
  `TICKET_PRICE` decimal(8,2) NOT NULL,
  `TICKET_STATUS` enum('Sold','Active','Cancelled') NOT NULL,
  `EVENT_ID` int(6) NOT NULL,
  `BOOKING_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`TICKET_ID`, `TICKET_TYPE`, `TICKET_SEAT_NUM`, `TICKET_PRICE`, `TICKET_STATUS`, `EVENT_ID`, `BOOKING_ID`) VALUES
(50000001, 'Standard', 'A12', 25.00, 'Sold', 100001, 60000001),
(50000002, 'Standard', 'A13', 25.00, 'Sold', 100001, 60000001),
(50000003, 'VIP', 'V101', 50.00, 'Active', 100003, 60000002),
(50000004, 'Standard', 'B21', 25.00, 'Cancelled', 100003, 60000003),
(50000005, 'Standard', 'B22', 25.00, 'Cancelled', 100004, 60000003),
(50000006, 'VIP', 'VIP1', 75.00, 'Sold', 100004, 60000004),
(50000007, 'Standard', 'C15', 25.00, 'Active', 100009, 60000007);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor` (
  `VENDOR_ID` int(5) NOT NULL,
  `VENDOR_NAME` varchar(100) NOT NULL,
  `VENDOR_CONTACT` varchar(60) NOT NULL,
  `VENDOR_EMAIL` varchar(80) NOT NULL,
  `VENDOR_PHONE_NUM` char(12) NOT NULL,
  `VENDOR_WEBSITE` varchar(80) NOT NULL,
  `VENDOR_PRICE_MODEL` enum('Hourly','Per Event','Per Person') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`VENDOR_ID`, `VENDOR_NAME`, `VENDOR_CONTACT`, `VENDOR_EMAIL`, `VENDOR_PHONE_NUM`, `VENDOR_WEBSITE`, `VENDOR_PRICE_MODEL`) VALUES
(10001, 'Elite Catering Services', 'Laura Mitchell', 'contact@elitecatering.com', '317-555-2101', 'www.elitecatering.com', 'Per Person'),
(10002, 'SecureGuard Solutions', 'Mark Reynolds', 'info@secureguard.com', '312-555-3399', 'www.secureguard.com', 'Hourly'),
(10003, 'NetWave Communications', 'Priya Patel', 'support@netwave.com', '219-555-4477', 'www.netwave.com', 'Per Event'),
(10004, 'SoundPro AV Rentals', 'James Carter', 'sales@soundproav.com', '765-555-5890', 'www.soundproav.com', 'Per Event'),
(10005, 'CleanSpace Facilities', 'Maria Lopez', 'service@cleanspace.com', '574-555-6723', 'www.cleanspace.com', 'Hourly');

-- --------------------------------------------------------

--
-- Structure for view `booking_summary`
--
DROP TABLE IF EXISTS `booking_summary`;

DROP VIEW IF EXISTS `booking_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `booking_summary`  AS SELECT `b`.`BOOKING_ID` AS `BOOKING_ID`, `a`.`ATT_FNAME` AS `ATT_FNAME`, `a`.`ATT_LNAME` AS `ATT_LNAME`, `b`.`BOOKING_STATUS` AS `BOOKING_STATUS`, `p`.`PAY_STATUS` AS `PAY_STATUS` FROM ((`booking` `b` join `attendee` `a` on(`b`.`ATT_ID` = `a`.`ATT_ID`)) join `payment` `p` on(`b`.`BOOKING_ID` = `p`.`BOOKING_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `event_details`
--
DROP TABLE IF EXISTS `event_details`;

DROP VIEW IF EXISTS `event_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_details`  AS SELECT `e`.`EVENT_NAME` AS `EVENT_NAME`, `e`.`EVENT_DATE` AS `EVENT_DATE`, `f`.`FACILITY_TYPE` AS `FACILITY_TYPE`, `o`.`ORG_NAME` AS `ORG_NAME` FROM ((`event` `e` join `facility` `f` on(`e`.`FACILITY_ID` = `f`.`FACILITY_ID`)) join `organizer` `o` on(`e`.`ORG_ID` = `o`.`ORG_ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendee`
--
ALTER TABLE `attendee`
  ADD PRIMARY KEY (`ATT_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BOOKING_ID`),
  ADD KEY `fk_att_id` (`ATT_ID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EVENT_ID`),
  ADD KEY `event_ibfk_1` (`FACILITY_ID`),
  ADD KEY `event_ibfk_2` (`ORG_ID`);

--
-- Indexes for table `event_coordinator`
--
ALTER TABLE `event_coordinator`
  ADD PRIMARY KEY (`COORD_ID`);

--
-- Indexes for table `event_sponsor`
--
ALTER TABLE `event_sponsor`
  ADD PRIMARY KEY (`EVENT_ID`,`SPONSOR_ID`),
  ADD KEY `event_sponsor_ibfk_2` (`SPONSOR_ID`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`FACILITY_ID`);

--
-- Indexes for table `facility_service`
--
ALTER TABLE `facility_service`
  ADD PRIMARY KEY (`SERVICE_ID`),
  ADD KEY `facility_service_ibfk_1` (`EVENT_ID`),
  ADD KEY `facility_service_ibfk_2` (`VENDOR_ID`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`ORG_ID`),
  ADD KEY `organizer_ibfk_1` (`COORD_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PAY_ID`),
  ADD KEY `payment_ibfk_1` (`BOOKING_ID`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`SPONSOR_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`STAFF_ID`),
  ADD KEY `staff_ibfk_1` (`EVENT_ID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TICKET_ID`),
  ADD KEY `BOOKING_ID` (`BOOKING_ID`) USING BTREE,
  ADD KEY `ticket_ibfk_1` (`EVENT_ID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`VENDOR_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_att_id` FOREIGN KEY (`ATT_ID`) REFERENCES `attendee` (`ATT_ID`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`FACILITY_ID`) REFERENCES `facility` (`FACILITY_ID`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`ORG_ID`) REFERENCES `organizer` (`ORG_ID`);

--
-- Constraints for table `event_sponsor`
--
ALTER TABLE `event_sponsor`
  ADD CONSTRAINT `event_sponsor_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`EVENT_ID`),
  ADD CONSTRAINT `event_sponsor_ibfk_2` FOREIGN KEY (`SPONSOR_ID`) REFERENCES `sponsor` (`SPONSOR_ID`);

--
-- Constraints for table `facility_service`
--
ALTER TABLE `facility_service`
  ADD CONSTRAINT `facility_service_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`EVENT_ID`),
  ADD CONSTRAINT `facility_service_ibfk_2` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`VENDOR_ID`);

--
-- Constraints for table `organizer`
--
ALTER TABLE `organizer`
  ADD CONSTRAINT `organizer_ibfk_1` FOREIGN KEY (`COORD_ID`) REFERENCES `event_coordinator` (`COORD_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BOOKING_ID`) REFERENCES `booking` (`BOOKING_ID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`EVENT_ID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`BOOKING_ID`) REFERENCES `booking` (`BOOKING_ID`),
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`EVENT_ID`) REFERENCES `event` (`EVENT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
