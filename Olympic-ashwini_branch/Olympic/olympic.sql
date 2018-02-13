-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2017 at 06:24 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olympic`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSportsdetails` (IN `sports_id` INT)  NO SQL
BEGIN
select o.location,s.Sports_Name, a.Name ,r.Rank , c.Cname from results r join olympic_venue o on r.Olympic_id = o.Olympic_Id join sports s on r.Sports_id = s.sports_id join athletes a on r.Athletes_id = a.Athletes_Id JOIN country c on c.Country_id=r.Country_Id
where s.sports_id=sports_id
ORDER by o.Year ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setResult` (IN `sports` INT, IN `medals` VARCHAR(50), IN `athlete` VARCHAR(50))  READS SQL DATA
BEGIN
DECLARE atheleteid varchar(10);
DECLARE countryid varchar(10);

select Athletes_Id INTO atheleteid from athletes where Name = athlete;

select Country_id INTO countryid from athletes where Name = athlete;

insert into results ( Olympic_id, Sports_id, Athletes_id, Rank, Country_Id) VALUES (1,sports,atheleteid,medals,countryid);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `athletes`
--

CREATE TABLE `athletes` (
  `Athletes_Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athletes`
--

INSERT INTO `athletes` (`Athletes_Id`, `Name`, `Sex`, `Country_id`) VALUES
(1, 'V.Sindhu Pusarla', 'Female', 1),
(2, 'Saina Nehwal', 'Female', 1),
(3, 'Caroline Marin', 'Female', 6),
(4, 'Nozomi Okuhara', 'Female', 5),
(5, 'Yihan Wing', 'Female', 2),
(6, 'Xueruni LI', 'Female', 2),
(7, 'Hyejin Chang', 'Female', 7),
(8, 'Lisa Unrh', 'Female', 8),
(9, 'Bo Bae Ki', 'Female', 7),
(10, 'Aida Roma', 'Female', 13),
(11, 'Mariana Avitia', 'Female', 13),
(12, 'Ning Ding', 'Female', 2),
(13, 'Xiaoxia LI', 'Female', 2),
(14, 'Song I Kim', 'Female', 11),
(15, 'Tianwai Feng', 'Female', 12),
(16, 'Natalie Geisen Berger', 'Female', 8),
(17, 'Tatjana Huefner', 'Female', 8),
(18, 'Erin Hamlin', 'Female', 3),
(19, 'Nina Reithmayer', 'Female', 8),
(20, 'Elizabeth Yarnold', 'Female', 4),
(21, 'Noelle Pikus -Pace', 'Female', 3),
(22, 'Elena Nikitna', 'Female', 10),
(23, 'Amy Williams', 'Female', 4),
(24, 'Kerstin Szymkowiak', 'Female', 8),
(25, 'Anja Huber', 'Female', 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `athletes_check`
-- (See below for the actual view)
--
CREATE TABLE `athletes_check` (
`Athletes_Id` int(11)
,`sports_id` int(11)
,`Name` varchar(50)
,`Cname` varchar(100)
,`Sports_Name` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `Country_id` int(11) NOT NULL,
  `Cname` varchar(100) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `President` varchar(100) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `Registation_Date` varchar(30) DEFAULT NULL,
  `Medal_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`Country_id`, `Cname`, `Title`, `Website`, `President`, `Address`, `Registation_Date`, `Medal_count`) VALUES
(1, 'INDIA', 'INDIAN OLYMPIC ASSOCIATION', 'HTTP://WWW.OLYMPIC.IND.IN/', 'MR NARAYANASWAMY RAMACHANDRAN', 'INDIAN OLYMPIC BHAWAN,NEW DELHI INDIA', '01 JANUARY 1997', 30),
(2, 'CHINA', 'CHINESE OLYMPIC COMMITTEE', 'HTTP://WWW.OLYMPIC.CN', 'MR ZHONGWEN GOU', 'TIYUGUAN ROAD 2 BEIJING', '01 JANUARY 1979', 601),
(3, 'USA', 'UNITED STATES OLYMPIC COMMITTEE', 'HTTP://WWW.TEAMUSA.ORG/', 'MR LAWRENCE F', 'OLYMPIC PLAZA COLORADO SPRINGS USA', '01 JANUARY 1894', 2804),
(4, 'ENGLAND', 'BRITISH OLYMPIC ASSOCIATION', 'HTTP://WWW.TEAMGB.COM', 'MR HUGH ROBERTSON', '60 CHARLOTTE STREET LONDON,GREAT BRITAIN', '01 JANUARY 1905', 876),
(5, 'JAPAN', 'JAPANESE OLYMPIC COMMITTEE', 'HTTP://WWW.JOC.OR.JP', 'TSUNEKAZU TAKEDA', 'KISHI MEMORIAL HALL JINNAN TOKYO JAPAN', '01 JANUARY 1912', 484),
(6, 'Spain', 'Spain Olympic', 'HTTP://WWW.COE.ES', 'MR ALEJANDRO BLANCO BRAVO', 'CALLE AREQUIPA 13 GRAN VIA DE HORTALEZA MADRID SPAIN', '01 JANUARY 1912', 152),
(7, 'REPUBLIC OF KOREA', 'KOREAN SPORT & OLYMPIC  COMMITTEE', 'HTTP://WWW.SPORTS.OR.KR/ENG', 'MR KEE-HEUNG LEE', 'OLYMPIC CENTRE 424, OLYMPIC-RO SONGPA-GU SEOUL REPUBLIC OF KOREA', '01 JANUARY 1947', 320),
(8, 'GERMANY', 'DEUTSCHER OLYMPISCHER SPORTBUND', 'HTTP://WWW.DOSB.DE', 'MR ALFONS HoRMANN', 'OTTO-FLECK-SCHNEISE FRANKFURT AM MAIN GERMANY', '01 JANUARY 1895', 825),
(9, 'AUSTRIA', 'Austria Olympic', 'HTTP://WWW.OLYMPIA.AT', 'MR KARL STOSS', 'RENNWEG 46-50/2ND FLOOR/TOP 71030 WIEN AUSTRIA', '01 JANUARY 1912', 305),
(10, 'RUSSIAN FEDERATION', 'RUSSIAN OLYMPIC COMMITTEE', 'HTTP://WWW.ROC.RU', 'MR ALEXANDER ZHUKOV', 'LUZHNETSKAYA NAB.MOSCOW RUSSIAN FEDERATION', '01 JANUARY 1993', 547),
(11, 'DEMOCRATIC PEOPLE\'S REPUBLIC OF KOREA', 'OLYMPIC COMMITTEE OF THE DEMOCRATIC PEOPLE\'S REPUBLIC OF KOREA', 'NULL', 'MR GUK KIM II', 'P.O. BOX 56 KUMSONG-DONG 2 KWANGBOK STREET MANGYONGDAE DISTRICT PYONGYANG DEMOCRATIC PEOPLE\'S REPUBLIC OF KOREA', '01 JANUARY 1957', 320),
(12, 'SINGAPORE', 'SINGAPORE NATIONAL OLYMPIC COUNCIL', 'HTTP://WWW.SINGAPOREOLYMPICS.COM', 'MR CHUAN-JIN TAN', '3 STADIUM DRIVE, 01-02 SINGAPORE 397630 SINGAPORE', '01 JANUARY 1948', 28),
(13, 'MEXICO', 'Mexico Olympic', 'HTTP://WWW.COM.ORG.MX/', 'MR CARLOS PADILLA BECERRA', 'APARTADO POSTAL 36 024 AVENIDA DEL CONSCRIPTO ESQ. ANILLO PERIFERICO, LOMAS DE SOTELO 11200 CIUDAD DE MEXICo MEXICO', '01 JANUARY 1923', 71);

-- --------------------------------------------------------

--
-- Table structure for table `entry_check`
--

CREATE TABLE `entry_check` (
  `Athletes_Id` int(11) NOT NULL,
  `sports_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Cname` varchar(100) DEFAULT NULL,
  `Sports_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entry_check`
--

INSERT INTO `entry_check` (`Athletes_Id`, `sports_id`, `Name`, `Cname`, `Sports_Name`) VALUES
(9, 2, 'Bo Bae Ki', 'REPUBLIC OF KOREA', 'ARCHERY'),
(10, 2, 'Aida Roma', 'MEXICO', 'ARCHERY'),
(11, 2, 'Mariana Avitia', 'MEXICO', 'ARCHERY'),
(7, 2, 'Hyejin Chang', 'REPUBLIC OF KOREA', 'ARCHERY'),
(8, 2, 'Lisa Unrh', 'GERMANY', 'ARCHERY'),
(2, 1, 'Saina Nehwal', 'INDIA', 'BADMINTON'),
(5, 1, 'Yihan Wing', 'CHINA', 'BADMINTON'),
(6, 1, 'Xueruni LI', 'CHINA', 'BADMINTON'),
(1, 1, 'V.Sindhu Pusarla', 'INDIA', 'BADMINTON'),
(3, 1, 'Caroline Marin', 'Spain', 'BADMINTON'),
(4, 1, 'Nozomi Okuhara', 'JAPAN', 'BADMINTON'),
(16, 4, 'Natalie Geisen Berger', 'GERMANY', 'LUGE'),
(17, 4, 'Tatjana Huefner', 'GERMANY', 'LUGE'),
(19, 4, 'Nina Reithmayer', 'GERMANY', 'LUGE'),
(18, 4, 'Erin Hamlin', 'USA', 'LUGE'),
(23, 5, 'Amy Williams', 'ENGLAND', 'SKELETON'),
(24, 5, 'Kerstin Szymkowiak', 'GERMANY', 'SKELETON'),
(25, 5, 'Anja Huber', 'GERMANY', 'SKELETON'),
(20, 5, 'Elizabeth Yarnold', 'ENGLAND', 'SKELETON'),
(21, 5, 'Noelle Pikus -Pace', 'USA', 'SKELETON'),
(22, 5, 'Elena Nikitna', 'RUSSIAN FEDERATION', 'SKELETON'),
(12, 3, 'Ning Ding', 'CHINA', 'TABLE TENNIS'),
(13, 3, 'Xiaoxia LI', 'CHINA', 'TABLE TENNIS'),
(15, 3, 'Tianwai Feng', 'SINGAPORE', 'TABLE TENNIS'),
(14, 3, 'Song I Kim', 'DEMOCRATIC PEOPLE\'S REPUBLIC OF KOREA', 'TABLE TENNIS');

-- --------------------------------------------------------

--
-- Table structure for table `olympic_venue`
--

CREATE TABLE `olympic_venue` (
  `Olympic_Id` int(11) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Duration` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `olympic_venue`
--

INSERT INTO `olympic_venue` (`Olympic_Id`, `Location`, `Year`, `Duration`, `Country`) VALUES
(1, 'TOKYO', '2020', '24 JUL - 09 AUG', 'JAPAN'),
(2, 'Vancouver', '2010', '12 Feb-28 Feb', 'Canada'),
(3, 'London', '2012', '27 jul-12 Aug', 'Great britain'),
(4, 'Sochi', '2014', '07 Feb-23 Feb', 'Russian Federaion'),
(5, 'Rio', '2016', '5 Aug-21Aug', 'Brazil');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `Olympic_id` int(11) NOT NULL,
  `Sports_id` int(11) NOT NULL,
  `Athletes_id` int(11) NOT NULL,
  `Rank` char(20) NOT NULL,
  `Country_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`Olympic_id`, `Sports_id`, `Athletes_id`, `Rank`, `Country_Id`) VALUES
(1, 1, 2, 'Silver', 1),
(1, 1, 20, 'Gold', 4),
(1, 2, 8, 'Bronze', 8),
(1, 2, 10, 'Gold', 13),
(1, 2, 11, 'Silver', 13),
(2, 4, 16, 'Bronze', 8),
(2, 4, 17, 'Gold', 8),
(2, 4, 19, 'Silver', 9),
(2, 5, 23, 'Gold', 4),
(2, 5, 24, 'Silver', 8),
(2, 5, 25, 'Bronze', 8),
(3, 1, 2, 'Bronze', 1),
(3, 1, 5, 'Silver', 2),
(3, 1, 6, 'Gold', 2),
(3, 2, 9, 'Gold', 7),
(3, 2, 10, 'Silver', 13),
(3, 2, 11, 'Bronze', 13),
(3, 3, 12, 'Silver', 2),
(3, 3, 13, 'Gold', 2),
(3, 3, 15, 'Bronze', 12),
(4, 4, 16, 'Gold', 8),
(4, 4, 17, 'Silver', 8),
(4, 4, 18, 'Bronze', 3),
(4, 5, 20, 'Gold', 4),
(4, 5, 21, 'Silver', 3),
(4, 5, 22, 'Bronze', 10),
(5, 1, 1, 'Silver', 1),
(5, 1, 3, 'Gold', 6),
(5, 1, 4, 'Bronze', 5),
(5, 2, 7, 'Gold', 7),
(5, 2, 8, 'Silver', 8),
(5, 2, 9, 'Bronze', 7),
(5, 3, 12, 'Gold', 2),
(5, 3, 13, 'Silver', 2),
(5, 3, 14, 'Bronze', 11);

--
-- Triggers `results`
--
DELIMITER $$
CREATE TRIGGER `valid_check` AFTER INSERT ON `results` FOR EACH ROW BEGIN
UPDATE country set country.Medal_count=country.Medal_count+1 
WHERE country.Country_id=new.Country_Id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `sports_id` int(11) NOT NULL,
  `Sports_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`sports_id`, `Sports_Name`) VALUES
(2, 'ARCHERY'),
(1, 'BADMINTON'),
(4, 'LUGE'),
(5, 'SKELETON'),
(3, 'TABLE TENNIS');

-- --------------------------------------------------------

--
-- Structure for view `athletes_check`
--
DROP TABLE IF EXISTS `athletes_check`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `athletes_check`  AS  (select distinct `athletes`.`Athletes_Id` AS `Athletes_Id`,`sports`.`sports_id` AS `sports_id`,`athletes`.`Name` AS `Name`,`country`.`Cname` AS `Cname`,`sports`.`Sports_Name` AS `Sports_Name` from (((`country` join `athletes`) join `sports`) join `results`) where ((`country`.`Country_id` = `athletes`.`Country_id`) and (`athletes`.`Athletes_Id` = `results`.`Athletes_id`) and (`sports`.`sports_id` = `results`.`Sports_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `athletes`
--
ALTER TABLE `athletes`
  ADD PRIMARY KEY (`Athletes_Id`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `Country_id` (`Country_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`Country_id`);

--
-- Indexes for table `olympic_venue`
--
ALTER TABLE `olympic_venue`
  ADD PRIMARY KEY (`Olympic_Id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`Olympic_id`,`Sports_id`,`Athletes_id`),
  ADD KEY `Sports_id` (`Sports_id`),
  ADD KEY `Athletes_id` (`Athletes_id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`sports_id`),
  ADD UNIQUE KEY `Sports_Name` (`Sports_Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `Country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `olympic_venue`
--
ALTER TABLE `olympic_venue`
  MODIFY `Olympic_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `athletes`
--
ALTER TABLE `athletes`
  ADD CONSTRAINT `athletes_ibfk_1` FOREIGN KEY (`Country_id`) REFERENCES `country` (`Country_id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`Olympic_id`) REFERENCES `olympic_venue` (`Olympic_Id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`Sports_id`) REFERENCES `sports` (`sports_id`),
  ADD CONSTRAINT `results_ibfk_3` FOREIGN KEY (`Athletes_id`) REFERENCES `athletes` (`Athletes_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
