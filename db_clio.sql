-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2021 at 01:04 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_clio`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

CREATE TABLE `tbl_address` (
  `id` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `baranggay` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_address`
--

INSERT INTO `tbl_address` (`id`, `street`, `baranggay`, `city`, `province`) VALUES
(1, '536 Dulong Tangke Street', 'Malinta', 'Valenzuela', 'Metropolitan Manila');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(20) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `suffix` varchar(3) DEFAULT NULL,
  `contactNumber` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `email`, `image`, `firstName`, `middleName`, `lastName`, `suffix`, `contactNumber`) VALUES
('IDAA', 'admin', 'admin@gmail.com', '1627555680-187147244_497461041589733_1951990741678585753_n.png', 'Cherry', '', 'Man', 'Jr', '09072840318');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_advisers`
--

CREATE TABLE `tbl_advisers` (
  `id` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `batchID` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `contactNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_advisers`
--

INSERT INTO `tbl_advisers` (`id`, `username`, `email`, `image`, `firstName`, `middleName`, `lastName`, `suffix`, `batchID`, `sectionID`, `contactNumber`) VALUES
('Adviser3', 'adviser3', 'adviser3@gmail.com', NULL, 'Adviser', NULL, 'Three', NULL, 2, 1, '9269035812'),
('Adviser4', 'adviser4', 'adviser4@gmail.com', NULL, 'Adviser', NULL, 'Four', NULL, 2, 2, '9682190508'),
('ASD', 'adviser', 'serad@gmail.com', '1623545305-187147244_497461041589733_1951990741678585753_n.png', 'Ser', '', 'Ad', '', 1, 2, '9393250808'),
('DV015', 'adviser2', 'adver@gmail.com', '1623545344-187552710_156648669747039_3317054057288811876_n.png', 'Adver', '', 'Ser', '', 1, 1, '9062180508');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_announcement`
--

CREATE TABLE `tbl_announcement` (
  `announcementID` int(11) NOT NULL,
  `announcementFeature` varchar(50) NOT NULL,
  `announcementTopic` varchar(50) NOT NULL,
  `announcement` varchar(1000) NOT NULL,
  `announcementDateTime` datetime NOT NULL,
  `sectionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_announcement`
--

INSERT INTO `tbl_announcement` (`announcementID`, `announcementFeature`, `announcementTopic`, `announcement`, `announcementDateTime`, `sectionID`) VALUES
(10, 'This is a feature', 'The topic is moving', 'announcement', '2021-06-02 08:32:50', 1),
(13, 'Feature1', 'Topic1', 'Announcement1', '2021-07-09 17:51:45', 2),
(14, 'Feat', 'A feature', 'Announce', '2021-07-29 12:45:01', 2),
(16, 'Academics', 'Startup', 'Make  Announcement Make  AnnouncementMake  AnnouncementMake  AnnouncementMake  AnnouncementMake  AnnouncementMake  AnnouncementMake  AnnouncementMake  AnnouncementMake  Announcement', '2021-10-08 05:12:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_batch`
--

CREATE TABLE `tbl_batch` (
  `batchID` int(11) NOT NULL,
  `batchName` varchar(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_batch`
--

INSERT INTO `tbl_batch` (`batchID`, `batchName`, `year`) VALUES
(1, '1', 2000),
(2, '2', 2002);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_calendar`
--

CREATE TABLE `tbl_calendar` (
  `calendarID` int(11) NOT NULL,
  `activity` varchar(500) NOT NULL,
  `expectation` varchar(500) NOT NULL,
  `calendarDateTime` date NOT NULL,
  `batchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_calendar`
--

INSERT INTO `tbl_calendar` (`calendarID`, `activity`, `expectation`, `calendarDateTime`, `batchID`) VALUES
(9, 'A', 'a', '2021-06-16', 2),
(10, 'E', 'e', '2021-06-02', 1),
(12, 'Activity1', 'Expected1', '2021-07-29', 1),
(13, 'Film', 'Movie2', '2021-07-09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `id` int(11) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `addressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`id`, `companyName`, `addressID`) VALUES
(1, 'abc inc.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contactnumber`
--

CREATE TABLE `tbl_contactnumber` (
  `contactNumber` varchar(11) NOT NULL,
  `network` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_contactnumber`
--

INSERT INTO `tbl_contactnumber` (`contactNumber`, `network`) VALUES
('09072840318', 'SUN'),
('33333333333', NULL),
('44444444444', NULL),
('9062180508', NULL),
('9099956231', NULL),
('9269035812', NULL),
('9393250808', NULL),
('9564563218', NULL),
('9682190508', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dtr`
--

CREATE TABLE `tbl_dtr` (
  `dtrID` int(11) NOT NULL,
  `dtrImage` varchar(200) DEFAULT NULL,
  `timeIn` time(6) NOT NULL,
  `timeOut` time(6) NOT NULL,
  `studentNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dtr`
--

INSERT INTO `tbl_dtr` (`dtrID`, `dtrImage`, `timeIn`, `timeOut`, `studentNumber`) VALUES
(1, 'DTR.jpg', '00:59:21.000000', '40:59:21.000000', '18-1234'),
(3, 'DTR.jpg', '00:59:21.000000', '40:59:21.000000', '56456');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gradingsystem`
--

CREATE TABLE `tbl_gradingsystem` (
  `gradingSystemID` int(11) NOT NULL,
  `gradingSystem` varchar(1000) NOT NULL,
  `criteria` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_gradingsystem`
--

INSERT INTO `tbl_gradingsystem` (`gradingSystemID`, `gradingSystem`, `criteria`) VALUES
(1, 'This is the grading system', 'This is the criteria'),
(2, 'This is the grading system', 'This is the criteria'),
(3, 'Another grading system', 'This columns and rows can be increased'),
(4, 'Grading Check', 'Criteria Check!'),
(5, 'System', 'criteria'),
(6, 'System Grading', 'Criteria2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rci`
--

CREATE TABLE `tbl_rci` (
  `rciID` int(11) NOT NULL,
  `topic` varchar(200) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `username` varchar(50) NOT NULL,
  `rciDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `isDone` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rci`
--

INSERT INTO `tbl_rci` (`rciID`, `topic`, `message`, `username`, `rciDateTime`, `isDone`) VALUES
(1, 'Topic', '', 'student', '2021-05-29 00:00:00', 1),
(2, 'topic2', '', 'student', '0000-00-00 00:00:00', 1),
(3, '3', '', 'student', '2021-05-29 20:13:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_section`
--

CREATE TABLE `tbl_section` (
  `sectionID` int(11) NOT NULL,
  `section` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_section`
--

INSERT INTO `tbl_section` (`sectionID`, `section`) VALUES
(1, 'BSIT3-1'),
(2, 'BSIT3-2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `studentNumber` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(20) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `suffix` varchar(3) DEFAULT NULL,
  `totalHours` int(20) DEFAULT NULL,
  `sectionID` int(11) NOT NULL,
  `batchID` int(11) NOT NULL,
  `contactNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`studentNumber`, `username`, `firstName`, `middleName`, `lastName`, `suffix`, `totalHours`, `sectionID`, `batchID`, `contactNumber`) VALUES
('18-1234', 'student', 'Stu', NULL, 'Ent', NULL, 50, 1, 2, '09072840318'),
('180875', 'abeah', 'abe', 'mari', 'ah', '', 50, 2, 1, '9062180508'),
('44444', 'cookhans', 'cook', 'abe', 'hans', 'jr', NULL, 2, 1, '9393250808'),
('55555', 'abesho', 'abe', 'cook', 'sho', '', NULL, 1, 1, '9269035812'),
('56456', 'cookha', 'cook', 'mari', 'ha', 'jr', 50, 1, 1, '9682190508'),
('STD1', 'JohnLloyd', 'John', '', 'Lloyd', '', NULL, 1, 1, '9099956231'),
('STD2', 'PapaArnold', 'Papa', '', 'Arnold', 'jr', NULL, 2, 1, '9564563218'),
('STD3', 'CasaEsta', 'Casa', '', 'Esta', 'Sr', NULL, 1, 1, '33333333333'),
('STD4', 'CherryPie', 'Cherry', '', 'Pie', '', NULL, 1, 1, '44444444444');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supervisor`
--

CREATE TABLE `tbl_supervisor` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `supfirstName` varchar(50) NOT NULL,
  `middleName` varchar(20) DEFAULT NULL,
  `suplastName` varchar(50) NOT NULL,
  `suffix` varchar(3) DEFAULT NULL,
  `contactID` varchar(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `studentNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_supervisor`
--

INSERT INTO `tbl_supervisor` (`id`, `username`, `email`, `supfirstName`, `middleName`, `suplastName`, `suffix`, `contactID`, `companyID`, `studentNumber`) VALUES
(1, 'supervisor', 'supervisor@gmail.com', 'Super', NULL, 'Bisor', NULL, '9062180508', 1, '56456');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `userTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`username`, `password`, `userTypeID`) VALUES
('abeah', 'f5fb13d18961b8f6a4c1e666d6712fe4', 3),
('abesho', 'c5fe25896e49ddfe996db7508cf00534', 3),
('admin', '21232f297a57a5a743894a0e4a801fc3', 1),
('adviser', 'c0f7bbe14aaee1b771e9ea23dd7883ea', 2),
('adviser2', 'c0f7bbe14aaee1b771e9ea23dd7883ea', 2),
('adviser3', 'c0f7bbe14aaee1b771e9ea23dd7883ea', 2),
('adviser4', 'c0f7bbe14aaee1b771e9ea23dd7883ea', 2),
('CasaEsta', 'd6b1bd431c98cee4e13ee14230b776e1', 3),
('CherryPie', '16ad4357c378e2b07cf1730f4ff8db5e', 3),
('cookha', '7cef9fb42008ddb986b37c5e8859d176', 3),
('cookhans', '79b7cdcd14db14e9cb498f1793817d69', 3),
('JohnLloyd', '00698478e5b43998c54d4211273ea8c2', 3),
('PapaArnold', '294ed696bc9b8410cd000c49e272265d', 3),
('student', 'cd73502828457d15655bbd7a63fb0bc8', 3),
('supervisor', '09348c20a019be0318387c08df7a783d', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usertype`
--

CREATE TABLE `tbl_usertype` (
  `userTypeID` int(11) NOT NULL,
  `userType` int(1) NOT NULL,
  `userTypeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_usertype`
--

INSERT INTO `tbl_usertype` (`userTypeID`, `userType`, `userTypeName`) VALUES
(1, 1, 'Admin'),
(2, 2, 'Adviser'),
(3, 3, 'Student'),
(4, 4, 'Supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_weeklyreport`
--

CREATE TABLE `tbl_weeklyreport` (
  `weeklyReportID` int(11) NOT NULL,
  `tasks` varchar(1000) NOT NULL,
  `lesson` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `studentNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_weeklyreport`
--

INSERT INTO `tbl_weeklyreport` (`weeklyReportID`, `tasks`, `lesson`, `date`, `studentNumber`) VALUES
(1, 'Task number 1', 'Lesson Number 1', '2021-05-12', '180875'),
(2, 'Task 2', 'lesson 2', '2021-05-18', '18-1234'),
(3, 'Task 3', 'Lesson 3', '2021-05-12', '56456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `tbl_advisers`
--
ALTER TABLE `tbl_advisers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `batchID` (`batchID`),
  ADD KEY `sectionID` (`sectionID`),
  ADD KEY `contactNumber` (`contactNumber`);

--
-- Indexes for table `tbl_announcement`
--
ALTER TABLE `tbl_announcement`
  ADD PRIMARY KEY (`announcementID`),
  ADD KEY `sectionID` (`sectionID`);

--
-- Indexes for table `tbl_batch`
--
ALTER TABLE `tbl_batch`
  ADD PRIMARY KEY (`batchID`);

--
-- Indexes for table `tbl_calendar`
--
ALTER TABLE `tbl_calendar`
  ADD PRIMARY KEY (`calendarID`),
  ADD KEY `batchID` (`batchID`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addressID` (`addressID`);

--
-- Indexes for table `tbl_contactnumber`
--
ALTER TABLE `tbl_contactnumber`
  ADD PRIMARY KEY (`contactNumber`);

--
-- Indexes for table `tbl_dtr`
--
ALTER TABLE `tbl_dtr`
  ADD PRIMARY KEY (`dtrID`),
  ADD KEY `studentNumber` (`studentNumber`);

--
-- Indexes for table `tbl_gradingsystem`
--
ALTER TABLE `tbl_gradingsystem`
  ADD PRIMARY KEY (`gradingSystemID`);

--
-- Indexes for table `tbl_rci`
--
ALTER TABLE `tbl_rci`
  ADD PRIMARY KEY (`rciID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `tbl_section`
--
ALTER TABLE `tbl_section`
  ADD PRIMARY KEY (`sectionID`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`studentNumber`),
  ADD KEY `sectionID` (`sectionID`),
  ADD KEY `batchID` (`batchID`),
  ADD KEY `username` (`username`),
  ADD KEY `contactNumber` (`contactNumber`);

--
-- Indexes for table `tbl_supervisor`
--
ALTER TABLE `tbl_supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `contactID` (`contactID`),
  ADD KEY `companyID` (`companyID`),
  ADD KEY `studentNumber` (`studentNumber`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `userTypeID` (`userTypeID`);

--
-- Indexes for table `tbl_usertype`
--
ALTER TABLE `tbl_usertype`
  ADD PRIMARY KEY (`userTypeID`);

--
-- Indexes for table `tbl_weeklyreport`
--
ALTER TABLE `tbl_weeklyreport`
  ADD PRIMARY KEY (`weeklyReportID`),
  ADD KEY `studentNumber` (`studentNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_announcement`
--
ALTER TABLE `tbl_announcement`
  MODIFY `announcementID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_calendar`
--
ALTER TABLE `tbl_calendar`
  MODIFY `calendarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_dtr`
--
ALTER TABLE `tbl_dtr`
  MODIFY `dtrID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_gradingsystem`
--
ALTER TABLE `tbl_gradingsystem`
  MODIFY `gradingSystemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_rci`
--
ALTER TABLE `tbl_rci`
  MODIFY `rciID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_section`
--
ALTER TABLE `tbl_section`
  MODIFY `sectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_supervisor`
--
ALTER TABLE `tbl_supervisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_usertype`
--
ALTER TABLE `tbl_usertype`
  MODIFY `userTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_weeklyreport`
--
ALTER TABLE `tbl_weeklyreport`
  MODIFY `weeklyReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD CONSTRAINT `tbl_admin_ibfk_9` FOREIGN KEY (`username`) REFERENCES `tbl_users` (`username`);

--
-- Constraints for table `tbl_advisers`
--
ALTER TABLE `tbl_advisers`
  ADD CONSTRAINT `tbl_advisers_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tbl_users` (`username`),
  ADD CONSTRAINT `tbl_advisers_ibfk_2` FOREIGN KEY (`batchID`) REFERENCES `tbl_batch` (`batchID`),
  ADD CONSTRAINT `tbl_advisers_ibfk_3` FOREIGN KEY (`sectionID`) REFERENCES `tbl_section` (`sectionID`),
  ADD CONSTRAINT `tbl_advisers_ibfk_4` FOREIGN KEY (`contactNumber`) REFERENCES `tbl_contactnumber` (`contactNumber`);

--
-- Constraints for table `tbl_announcement`
--
ALTER TABLE `tbl_announcement`
  ADD CONSTRAINT `tbl_announcement_ibfk_1` FOREIGN KEY (`sectionID`) REFERENCES `tbl_section` (`sectionID`);

--
-- Constraints for table `tbl_calendar`
--
ALTER TABLE `tbl_calendar`
  ADD CONSTRAINT `tbl_calendar_ibfk_1` FOREIGN KEY (`batchID`) REFERENCES `tbl_batch` (`batchID`);

--
-- Constraints for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD CONSTRAINT `tbl_company_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `tbl_address` (`id`);

--
-- Constraints for table `tbl_dtr`
--
ALTER TABLE `tbl_dtr`
  ADD CONSTRAINT `tbl_dtr_ibfk_1` FOREIGN KEY (`studentNumber`) REFERENCES `tbl_student` (`studentNumber`);

--
-- Constraints for table `tbl_rci`
--
ALTER TABLE `tbl_rci`
  ADD CONSTRAINT `tbl_rci_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tbl_users` (`username`);

--
-- Constraints for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD CONSTRAINT `tbl_student_ibfk_1` FOREIGN KEY (`sectionID`) REFERENCES `tbl_section` (`sectionID`),
  ADD CONSTRAINT `tbl_student_ibfk_10` FOREIGN KEY (`username`) REFERENCES `tbl_users` (`username`),
  ADD CONSTRAINT `tbl_student_ibfk_11` FOREIGN KEY (`contactNumber`) REFERENCES `tbl_contactnumber` (`contactNumber`),
  ADD CONSTRAINT `tbl_student_ibfk_2` FOREIGN KEY (`batchID`) REFERENCES `tbl_batch` (`batchID`);

--
-- Constraints for table `tbl_supervisor`
--
ALTER TABLE `tbl_supervisor`
  ADD CONSTRAINT `tbl_supervisor_ibfk_10` FOREIGN KEY (`username`) REFERENCES `tbl_users` (`username`),
  ADD CONSTRAINT `tbl_supervisor_ibfk_11` FOREIGN KEY (`contactID`) REFERENCES `tbl_contactnumber` (`contactNumber`),
  ADD CONSTRAINT `tbl_supervisor_ibfk_12` FOREIGN KEY (`companyID`) REFERENCES `tbl_company` (`id`),
  ADD CONSTRAINT `tbl_supervisor_ibfk_13` FOREIGN KEY (`studentNumber`) REFERENCES `tbl_student` (`studentNumber`);

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`userTypeID`) REFERENCES `tbl_usertype` (`userTypeID`);

--
-- Constraints for table `tbl_weeklyreport`
--
ALTER TABLE `tbl_weeklyreport`
  ADD CONSTRAINT `tbl_weeklyreport_ibfk_2` FOREIGN KEY (`studentNumber`) REFERENCES `tbl_student` (`studentNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
