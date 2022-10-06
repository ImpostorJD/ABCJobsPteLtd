CREATE DATABASE  IF NOT EXISTS `abc_jobs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `abc_jobs`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: abc_jobs
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the primary key for administrator privilege',
  `User_ID` int NOT NULL COMMENT 'this references to user ID',
  PRIMARY KEY (`Admin_ID`),
  KEY `admin_fk_userID` (`User_ID`) USING BTREE,
  CONSTRAINT `Admin_fk_user_ID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,9),(2,12),(3,15),(4,19),(5,35);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `User_ID` int NOT NULL COMMENT 'Reference to user ID of the user who applies for job opportunity',
  `Job_ID` int NOT NULL COMMENT 'Reference to Job opportunity the user applied to',
  PRIMARY KEY (`User_ID`,`Job_ID`),
  KEY `aply_fk_JobID` (`Job_ID`),
  CONSTRAINT `aply_fk_JobID` FOREIGN KEY (`Job_ID`) REFERENCES `job` (`Job_ID`),
  CONSTRAINT `apply_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (47,1),(47,2);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email`
--

DROP TABLE IF EXISTS `bulk_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulk_email` (
  `BE_ID` int NOT NULL AUTO_INCREMENT COMMENT 'this is the primary key for the bulk email to be sent by admin',
  `BE_Name` char(50) NOT NULL COMMENT 'this contains the name or the title of the email',
  `BE_Body` text NOT NULL COMMENT 'this contains the content of the email',
  `BE_Target` text NOT NULL COMMENT 'this contains the email of the receiver',
  `BE_Status` char(10) NOT NULL COMMENT 'this contains the status if the email is sent or still on draft',
  `Admin_ID` int NOT NULL COMMENT 'references the admin id who sent the email',
  PRIMARY KEY (`BE_ID`),
  KEY `BE_fk_AdminID` (`Admin_ID`),
  CONSTRAINT `BE_fk_AdminID` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email`
--

LOCK TABLES `bulk_email` WRITE;
/*!40000 ALTER TABLE `bulk_email` DISABLE KEYS */;
INSERT INTO `bulk_email` VALUES (1,'Welcome to ABC Jobs Pte Ltd','Welcome to the community portal, your way to the world. I would like to thank you all for becoming a part of the first few members of the website, feel free to recommend this to your friends and colleagues and enjoy your journey to a better future. Happy coding!','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',1),(2,'Notice of deactivation','Our system noticed that your account has been spamming or has been posting innapropriate or malicious threads, if you think this is a mistake, please feel free to contact our support team.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com','sent',1),(3,'Announcement for march','Doe Corporation has a work environment that promotes diversity, embraces change, and provides leadership opportunities to every team member. We are on a fast track within the applications industry and are seeking highly skilled professionals to take us even further.\n\n			So if you are looking to make a move and are a highly motivated professional who welcomes new challenges, take a look at Doe Corporation... We have your next GREAT OPPORTUNITY!','dada@gmail.comamacelroy0@delicious.com\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',2),(4,'New Job Opportunity','The Technical Support Division has positions open for two technical support representatives in the Springfield office. Both positions require a B.S. in computer science and three years experience in the software industry. The closing date for applications is May 5. Interested persons should submit an application with a resume and a cover letter.\n			Technical support representatives provide telephone and on-line assistance to users of Doe\'s Vision and Mainline software products. Duties include:\n				- handling telephone inquiries\n				- answering on-line questions\n				- faxing hardcopy answers from our database\n			Questions concerning these positions can be answered by Eric Doe in Human Resources, extension 5555.','rfideler8@mapquest.com,\n						bheady9@howstuffworks.com,\n						cedlingtona@cmu.edu,\n						dspurdensb@hc360.com','sent',3),(5,'Anniversary celebration','We have come a long way…. We thank you for helping us achieve the 1 year milestone. To show our gratitude, we invite you to join us in the upcoming webinar to celebrate the anniversary of the website. We hope that you will attend.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',4),(6,'Announement for november','Greetings users, we are letting you know that we are improving our security system, thus we are also updating the Terms and Services, Privacy Policy,  and Cookie Policy. The services will take its effect on January 1, 2030.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',2),(7,'Catching up….','Hi user, you haven\'t used your account and it is temporarily disabled. To enable your account, please log in using the same credentials in registration. Have a nice day','delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com','draft',1),(8,'Site down','Dear users, our website is facing a problem with the server, please bear with us as we try to fix this issues.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',3),(9,'Techniques popular nowadays','Dear user, we have found out that you have interest aligned to this webinar, we are inviting you to join this webinar entitled \"trends in IT industry\". We hope that you\'ll attend and listen to what our guest speakers will say and hopefully you\'ll get to know more about the IT world.','bcummingsc@msu.edu,\n				ksaylord@alexa.com','draft',4),(10,'Invite your colleagues','Dear user, we hope that our community portal is to your liking. Please do recommend this to your friends or colleagues. It is not required but we would appreciate it if you do so. Below is the attached questionnaire about your satisfaction. Thank you for your time reading this email.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','draft',1),(20,'Test Email','this is just a test email please do not mind','johndanieltejero23@gmail.com, johndanieltejero@gmail.com, ainostasia@gmail.com','sent',5);
/*!40000 ALTER TABLE `bulk_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `can_manage`
--

DROP TABLE IF EXISTS `can_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `can_manage` (
  `Admin_ID` int NOT NULL COMMENT 'Reference to admin who manages other user',
  `User_ID` int NOT NULL COMMENT 'Reference to user ID of the user managed by the admin',
  PRIMARY KEY (`Admin_ID`,`User_ID`),
  KEY `cm_fk_userID` (`User_ID`),
  CONSTRAINT `cm_fk_adminID` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`),
  CONSTRAINT `cm_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_manage`
--

LOCK TABLES `can_manage` WRITE;
/*!40000 ALTER TABLE `can_manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `can_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educational_background`
--

DROP TABLE IF EXISTS `educational_background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educational_background` (
  `Eb_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the ID of the education background entry',
  `Eb_YearEnd` int NOT NULL COMMENT 'This is the year ended of the education or study',
  `Eb_YearStart` int NOT NULL COMMENT 'This is the year started of the study',
  `Eb_Degree` varchar(50) NOT NULL COMMENT 'This is the degree attained by the user on that study',
  `Eb_Achievements` varchar(60) NOT NULL COMMENT 'This contains the achievement attained by the user on that school',
  `Eb_SchoolName` varchar(60) NOT NULL COMMENT 'This holds the name of the university the user went to for that study',
  `UserInfo_ID` int NOT NULL COMMENT 'this references to user info ID',
  `eb_achievement` varchar(255) DEFAULT NULL,
  `eb_school_name` varchar(255) DEFAULT NULL,
  `user_info_id` int DEFAULT NULL,
  `eb_year_end` int DEFAULT NULL,
  `eb_year_start` int DEFAULT NULL,
  PRIMARY KEY (`Eb_ID`),
  KEY `ix_SchoolInfo` (`Eb_SchoolName`),
  KEY `eb_fk_userInfoID` (`UserInfo_ID`),
  CONSTRAINT `eb_fk_userInfoID` FOREIGN KEY (`UserInfo_ID`) REFERENCES `user_information` (`UserInfo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational_background`
--

LOCK TABLES `educational_background` WRITE;
/*!40000 ALTER TABLE `educational_background` DISABLE KEYS */;
INSERT INTO `educational_background` VALUES (1,2008,2004,'Bachelor of Science in Computer Science','Cum Laude','University of Aviation and Technology',1,NULL,NULL,NULL,NULL,NULL),(2,2000,1998,'Bachelor of Science in Information Technology','none','Bulacan State University',2,NULL,NULL,NULL,NULL,NULL),(3,2002,2000,'Bachelor of Science in Information Technology','none','Saint Mary\'s University',2,NULL,NULL,NULL,NULL,NULL),(4,2002,2000,'Bachelor of Science in Information Technology','none','Information and Communications Technology Academy',3,NULL,NULL,NULL,NULL,NULL),(5,2004,2002,'Bachelor of Science in Computer Science','Summa Cum Laude, Valedictorian, Distinguished Scholar Award','Information and Communications Technology Academy',3,NULL,NULL,NULL,NULL,NULL),(6,1994,1990,'Bachelor of Science in Computer Science','Leadership Award, Cum Laude','Southwestern University',4,NULL,NULL,NULL,NULL,NULL),(7,1991,1987,'Bachelor of Science in Information Technology','National Merit Scholar, Cum Laude','University of Manila',5,NULL,NULL,NULL,NULL,NULL),(8,1997,1993,'Bachelor of Science in Information Technology','none','Qinghai Normal University',7,NULL,NULL,NULL,NULL,NULL),(9,1995,1991,'Bachelor of Science in Information Technology','none','Universitas Semarang',8,NULL,NULL,NULL,NULL,NULL),(10,2004,2000,'Bachelor of Science in Computer Science','none','Feati University',9,NULL,NULL,NULL,NULL,NULL),(11,2001,2000,'Bachelor of Science in Computer Science','none','Taiyuan University of Technology',10,NULL,NULL,NULL,NULL,NULL),(12,2003,2001,'Bachelor of Science in Computer Science','none','Northeast Forest University',10,NULL,NULL,NULL,NULL,NULL),(13,2006,2003,'Bachelor of Science in Information Technology','none','Beijing Polytechnic University',10,NULL,NULL,NULL,NULL,NULL),(14,1996,1992,'Bachelor of Science in Computer Science','Outstanding Thesis Award, Cum Laude','Universitas Gajayana Malang',11,NULL,NULL,NULL,NULL,NULL),(15,1998,1997,'Bachelor of Science in Information Technology','Cum Laude','University of San Carlos',12,NULL,NULL,NULL,NULL,NULL),(16,2002,1998,'Bachelor of Science in Computer Science','none','University of Asia and the Pacific',13,NULL,NULL,NULL,NULL,NULL),(17,2008,2004,'Bachelor of Science in Computer Science','none','Shandong University',14,NULL,NULL,NULL,NULL,NULL),(18,2013,2009,'Bachelor of Science in Information Technology','none','Yunnan Normal University',14,NULL,NULL,NULL,NULL,NULL),(19,2007,2005,'Bachelor of Science in Information Technology','none','Saint Mary\'s University',15,NULL,NULL,NULL,NULL,NULL),(20,2009,2007,'Bachelor of Science in Computer Science','Cum Laude','Saint Mary\'s University',15,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `educational_background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `Job_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the primary key for Job posting',
  `Job_Position` varchar(50) NOT NULL COMMENT 'This is the job position offered by the employer',
  `Job_Company` char(50) NOT NULL COMMENT 'This is the company name of the employer',
  `Job_Overview` text NOT NULL,
  `Job_desc` text NOT NULL COMMENT 'This is the description or the details of the job offered',
  `Job_Responsibilities` text NOT NULL,
  `Job_Salary` char(10) NOT NULL COMMENT 'This is the salary to be offered by the employer for the position',
  `Job_Status` varchar(255) NOT NULL COMMENT 'This refers to the status of the job vaccancy',
  `job_posted` datetime NOT NULL,
  `job_deadline` date NOT NULL,
  `User_ID` int NOT NULL COMMENT 'references to the user ID who posted the job opportunity',
  PRIMARY KEY (`Job_ID`),
  KEY `ix_CompanyName` (`Job_Company`),
  KEY `job_fk_userID` (`User_ID`),
  CONSTRAINT `job_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Software Engineer','ABC','overview','description','dad;\r\ndad;\r\ndad;\r\ndad;\r\ndad;','3000.00','open','2022-05-27 09:13:13','2222-02-22',35),(2,'Software Engineer','ABC','sample','sample','sample\r\n','3000','open','2022-05-27 05:36:23','2222-02-22',35),(3,'dadada','dadadad','adadadad','adadadada','dada;ad;ad;ad;ad;a;da;da;da;d;qad;ad;a','adadad','open','2022-05-28 07:34:21','4332-02-23',35),(4,'adada','adada','dadadad','adadadada','dad;dad;dad;adad;dad;','3000','closed','2022-05-28 07:34:52','2021-05-13',35),(5,'adada','adada','dadadad','adadadada','dad;dad;dad;adad;dad;','3000','closed','2022-05-28 07:34:56','2021-05-13',35),(6,'dadad','adadada','dadada','dada','dadad;','21313','open','2022-05-30 04:31:33','2222-02-22',35),(7,'aaaaaa','aaaaaaaaaaa','aaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaa','aaaaaaa;','300000','open','2022-05-30 04:32:18','2222-02-22',35);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_experiences`
--

DROP TABLE IF EXISTS `job_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_experiences` (
  `JobExp_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the primary key for job experiences',
  `JobExp_Position` varchar(50) NOT NULL COMMENT 'This contains the job position of the user on their experience',
  `JobExp_Company` varchar(50) NOT NULL COMMENT 'This contains the company they used to work to',
  `JobExp_YearStart` int NOT NULL COMMENT 'This contains the year they started to work on that company',
  `JobExp_YearEnd` int NOT NULL COMMENT 'This contains the year they ended their work on that company',
  `UserInfo_ID` int NOT NULL COMMENT 'This reference to User Info',
  PRIMARY KEY (`JobExp_ID`),
  KEY `jobExp_fk_userinfoID` (`UserInfo_ID`),
  CONSTRAINT `jobExp_fk_userinfoID` FOREIGN KEY (`UserInfo_ID`) REFERENCES `user_information` (`UserInfo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_experiences`
--

LOCK TABLES `job_experiences` WRITE;
/*!40000 ALTER TABLE `job_experiences` DISABLE KEYS */;
INSERT INTO `job_experiences` VALUES (1,'Junior Developer','Devbug',2010,2014,1),(2,'Team Leader, Software Developer','Devbug',2014,2018,1),(3,'Frontend developer','Bubblemix',2002,2007,2),(4,'Web Developer','Kaymbo',2014,2017,2),(5,'Software Engineer','Bluejam',2004,2007,3),(6,'Software Engineer','Dablist',2010,2015,3),(7,'Web Developer','Skilith',1996,2000,4),(8,'Frontend developer','Wikibox',2000,2004,4),(9,'UI/UX Designer','Camimbo',2004,2010,4),(10,'Software Engineer','Rhyzio',1995,2000,5),(11,'Information Systems Engineer','Flashset',2001,2003,5),(12,'Information Systems Engineer, Manager','Flashset',2003,2013,5),(13,'Software Engineer','Brainbox',2013,2021,5),(14,'Frontend developer','Realmix',1997,2000,7),(15,'Web Developer','Dynazzy',2001,2003,7),(16,'Web Developer','Quatz',2004,2007,7),(17,'UI/UX Designer','Snaptags',2007,2016,7),(18,'Web Developer','Jaloo',2000,2006,11),(19,'Web Developer, UI/UX Designer','Camido',2006,2010,11),(20,'Software Engineer','Shuffletag',2011,2016,15);
/*!40000 ALTER TABLE `job_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `Msg_ID` int NOT NULL AUTO_INCREMENT COMMENT 'this is the primary key for messages',
  `Msg_Body` text NOT NULL COMMENT 'this contains the main content or message of the user',
  `Msg_Sender` char(50) NOT NULL COMMENT 'this contains the name of the sender',
  `Msg_Reciever` char(50) NOT NULL COMMENT 'this contains the intended target or receiver of the message',
  `Msg_DateSent` date NOT NULL,
  `User_ID` int NOT NULL COMMENT 'references to User_ID as sender',
  `ReceivesUser_ID` int NOT NULL COMMENT 'references to User_ID as receiver',
  PRIMARY KEY (`Msg_ID`),
  KEY `msg_fk_userID_Sender` (`User_ID`),
  KEY `msg_fk_userID_Receiver` (`ReceivesUser_ID`),
  CONSTRAINT `msg_fk_userID_Receiver` FOREIGN KEY (`ReceivesUser_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `msg_fk_userID_Sender` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `Reply_ID` int NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of the replies',
  `Reply_Body` text NOT NULL COMMENT 'The body of the comment',
  `Reply_Date` date NOT NULL,
  `User_ID` int NOT NULL COMMENT 'Reference to user ID of the user who comments or reply on thread',
  `Th_ID` int NOT NULL COMMENT 'Reference to thread which the user replied to',
  PRIMARY KEY (`Reply_ID`),
  KEY `reply_fk_userID` (`User_ID`),
  KEY `reply_fk_ThID` (`Th_ID`),
  CONSTRAINT `reply_fk_ThID` FOREIGN KEY (`Th_ID`) REFERENCES `thread` (`Th_ID`),
  CONSTRAINT `reply_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (12,'aaa','2022-05-31',35,11);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Role_ID` int NOT NULL AUTO_INCREMENT COMMENT 'this is the role primary key',
  `Role_Name` char(50) NOT NULL COMMENT 'This contains the role name either administrator or member',
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'member'),(2,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search` (
  `Search_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the unique identifier of instances a user search for another user',
  `User_ID` int NOT NULL COMMENT 'Reference to user ID of the user who search',
  `UserInfo_ID` int NOT NULL COMMENT 'Reference to userinfo ID to be retrieved when the user searches for them',
  PRIMARY KEY (`Search_ID`),
  KEY `search_fk_userID` (`User_ID`),
  KEY `search_fk_UserInfoID` (`UserInfo_ID`),
  CONSTRAINT `search_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `search_fk_UserInfoID` FOREIGN KEY (`UserInfo_ID`) REFERENCES `user_information` (`UserInfo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES (1,3,1),(2,2,3),(3,1,3),(4,5,3),(5,10,20),(6,11,19),(7,7,2),(8,8,3),(9,2,1),(10,3,15);
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thread` (
  `Th_ID` int NOT NULL AUTO_INCREMENT COMMENT 'this is the primary key for threads',
  `Th_Name` char(50) NOT NULL COMMENT 'This contains the main title of the thread or the caption',
  `Th_ViewType` varchar(45) NOT NULL,
  `Th_Subject` char(50) NOT NULL COMMENT 'This contains the subject or topic that the user is intending to tackle on their thread',
  `Th_Body` text NOT NULL COMMENT 'This contains the main subject of the thread',
  `Th_DatePosted` datetime NOT NULL,
  `User_ID` int NOT NULL COMMENT 'this references to the user ID as the one who posts',
  PRIMARY KEY (`Th_ID`),
  KEY `th_fk_userID` (`User_ID`),
  CONSTRAINT `th_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (11,'AAAAAAAAAAAAAA','publicType','saaaaaaaaasddsdsd','fdjmthgdfkjy','2022-05-29 10:29:42',35);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upvote`
--

DROP TABLE IF EXISTS `upvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upvote` (
  `User_ID` int NOT NULL COMMENT 'Reference to user ID of the user who applies for job opportunity',
  `Th_ID` int NOT NULL COMMENT 'Reference to Job opportunity the user applied to',
  PRIMARY KEY (`User_ID`,`Th_ID`),
  KEY `upvote_fk_id` (`Th_ID`),
  CONSTRAINT `upvote_fk_JobID` FOREIGN KEY (`Th_ID`) REFERENCES `thread` (`Th_ID`),
  CONSTRAINT `upvote_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upvote`
--

LOCK TABLES `upvote` WRITE;
/*!40000 ALTER TABLE `upvote` DISABLE KEYS */;
/*!40000 ALTER TABLE `upvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL AUTO_INCREMENT COMMENT 'User ID primary key',
  `User_FirstName` varchar(30) NOT NULL COMMENT 'this contains the user''s first name',
  `User_LastName` varchar(30) NOT NULL COMMENT 'this contains the user''s last name',
  `User_Password` text NOT NULL COMMENT 'this contains the user password',
  `User_Email` varchar(30) NOT NULL COMMENT 'this contains the user email',
  `Role_ID` int NOT NULL DEFAULT '1' COMMENT 'this reference to role table',
  `User_IsEnabled` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `User_Email` (`User_Email`),
  KEY `user_fk_roleID` (`Role_ID`) USING BTREE,
  FULLTEXT KEY `ix_Name` (`User_FirstName`,`User_LastName`),
  CONSTRAINT `User_fk_roleID` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`Role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Abbe','MacElroy','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','amacelroy0@delicious.com',1,1),(2,'Bucky','Sterzaker','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','bsterzaker1@chronoengine.com',1,1),(3,'Julie','Pooly','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','jpooly2@blogs.com',1,1),(4,'Barny','Seebert','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','bseebert3@apache.org',1,1),(5,'Erma','Durtnall','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','edurtnall4@paginegialle.it',1,1),(6,'Carleton','Blazeby','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','cblazeby5@jigsy.com',1,1),(7,'Dot','Elliott','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','delliott6@51.la',1,1),(8,'Theda','Hazleton','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','thazleton7@examiner.com',1,1),(9,'Rosita','Fideler','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','rfideler8@mapquest.com',2,1),(10,'Bruce','Heady','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','bheady9@howstuffworks.com',1,1),(11,'Constantia','Edlington','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','cedlingtona@cmu.edu',1,1),(12,'Dominic','Spurdens','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','dspurdensb@hc360.com',2,1),(13,'Beck','Cummings','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','bcummingsc@msu.edu',1,1),(14,'Kev','Saylor','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','ksaylord@alexa.com',1,1),(15,'Regan','Hackelton','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','rhackeltone@diigo.com',2,1),(16,'Jsandye','Bonwell','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','jbonwellf@123-reg.co.uk',1,1),(17,'Gael','Lehrer','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','glehrerg@tuttocitta.it',1,1),(18,'Ad','Gideon','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','agideonh@123-reg.co.uk',1,1),(19,'Lucille','Cornbell','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','lcornbelli@paginegialle.it',2,1),(20,'Adria','Kenford','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','akenfordj@icio.us',1,1),(21,'Talyah','Franken','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','tfranken0@ucla.edu',1,1),(22,'Janeva','Paolone','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','jpaolone1@nydailynews.com',1,1),(23,'Abbe','Galsworthy','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','agalsworthy2@geocities.com',1,1),(24,'Bili','Mastrantone','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','bmastrantone3@nasa.gov',1,1),(25,'Noach','Roskeilly','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','nroskeilly4@ucsd.edu',1,1),(26,'Seward','Proschke','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','sproschke5@indiatimes.com',1,1),(27,'Tremaine','Muckeen','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','tmuckeen6@telegraph.co.uk',1,1),(28,'Hubey','Prover','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','hprover7@blogs.com',1,1),(29,'Farly','Fenne','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','ffenne8@deliciousdays.com',1,1),(30,'Raddie','Walcher','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','rwalcher9@ovh.net',1,1),(35,'John Daniel','Tejero','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','johndanieltejero23@gmail.com',2,1),(44,'test','testy','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','testpass@gmail.com',1,1),(46,'Andy','Pass','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','andy@gmail.com',1,1),(47,'Sau','Ra','$2a$10$wd6PbVqrhfXnpxdetV1F3OatqQ9ME/Y2ZqT41xTParoifUvGcU8Hi','saura@gmail.com',1,1),(57,'Aino','Ishmael','$2a$10$XOfd1kQRz7ScABzPWeXkx.bM9Td5qdGhYtnl54FsPOOPgKoGGZ2VO','ainostasia@gmail.com',1,0),(58,'Brad','Guilberts','$2a$10$Y7PkVdsY2xZMopQywUM9xOGIgCsoFlMwOOqUL/4MspWVjT2Fb9gZ2','johndanieltejero@gmail.com',1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_information`
--

DROP TABLE IF EXISTS `user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_information` (
  `UserInfo_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the primary key for the user info ID',
  `UserInfo_ContactNo` varchar(20) NOT NULL COMMENT 'This is the contact number of the user, the reason why it is in character or string format is because there should be no math operations to be done here',
  `UserInfo_Job` varchar(50) NOT NULL COMMENT 'This is the job position of the user.',
  `UserInfo_Address` varchar(255) NOT NULL COMMENT 'This is the user''s address',
  `UserInfo_Country` char(60) NOT NULL COMMENT 'This is the user''s birth country',
  `UserInfo_City` varchar(255) NOT NULL COMMENT 'This is the user''s birth city',
  `UserInfo_Nationality` varchar(50) NOT NULL COMMENT 'This refer to the user''s nationality',
  `UserInfo_Company` varchar(50) NOT NULL COMMENT 'This contains the user''s current company',
  `User_ID` int NOT NULL COMMENT 'This references to the user ID',
  `UserInfo_banner` text,
  `UserInfo_DisplayImg` text,
  `UserInfo_Bio` text,
  `UserInfo_DisplayName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserInfo_ID`),
  UNIQUE KEY `User_ID` (`User_ID`),
  KEY `ix_CountryInformation` (`UserInfo_Country`),
  CONSTRAINT `UserInfo_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information`
--

LOCK TABLES `user_information` WRITE;
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
INSERT INTO `user_information` VALUES (1,'+63 939 841 6091','Java Developer','70 Hazelcrest Crossing','Vietnam','Th Tr\'n Na Hang','Vietnamese','Kamba',1,NULL,NULL,NULL,'Abbe MacElroy'),(2,'+63 921 555 3272','Data Scientist','6687 Eggendart Trail','Philippines','Wright','Filipino','Meetz',2,NULL,NULL,NULL,'Bucky Sterzaker'),(3,'+63 932 555 2340','Web Developer','049 Farragut Court','Phillipines','Romblon','Filipino','Dynava',3,NULL,NULL,NULL,'Julee Pooly'),(4,'63-283-555-2040','Software Programmer','06 Warrior Drive','Philippines','Capulaan','Filipino','Jabberbean',4,NULL,NULL,NULL,'Barny Seebert'),(5,'63-910-555-6378','UI/UX Designer','1886 Forest Avenue','Philippines','Tumauini','Filipino','Muxo',5,NULL,NULL,NULL,'Erma Durtnall'),(6,'66-855-559-842','Web Developer','68992 Raven Pass','Thailand','Don Mueang','Thai','Skyvu',6,NULL,NULL,NULL,'Carleton Blazeby'),(7,'86-185-557-07205','Software Programmer','42 Merchant Road','China','Guling','Chinese','Riffwire',7,NULL,NULL,NULL,'Dot Elliott'),(8,'62-812-555-503','UI/UX Designer','47566 Chive Road','Indonesia','Ciburial','Indonesian','Skipfire',8,NULL,NULL,NULL,'Theda Hazleton'),(9,'62-838-555-685','Java Developer','4192 Hanover Circle','Indonesia','Karanggintung','Indonesian','Dazzlesphere, ABC Jobs Pte. Ltd',9,NULL,NULL,NULL,'Rosita Fideler'),(10,'86-185-557-50801','Database Administrator','659 Buena Vista Crossing','China','Gaojian','Chinese','Cogibox',10,NULL,NULL,NULL,'Bruce Heady'),(11,'86-155-558-09546','Cloud Computing Engineer','55515 Namekagon Lane','China','Long’anqiao','Chinese','Skipfire',11,NULL,NULL,NULL,'Constantia Edlington'),(12,'63-932-555-2938','Cloud Computing Engineer','67695 Basil Circle','Philippines','Lumatil','Filipino','Avaveo, ABC Jobs Pte. Ltd',12,NULL,NULL,NULL,'Dominic Spurdens'),(13,'63-283-555-5940','Web Developer','56 Arapahoe Trail','Philippines','Bulalacao','Filipino','Chatterbridge',13,NULL,NULL,NULL,'Beck Cummings'),(14,'+86 185 555 9131','Software Programmer','836 Cardinal Point','China','Bacheng','Chinese','Youopia',14,NULL,NULL,NULL,'Kev Saylor'),(15,'63-922-555-8178','Software Programmer','1 Mifflin Trail','Philippines','Guihulñgan','Filipino','Rooxo, ABC Jobs Pte. Ltd',15,NULL,NULL,NULL,'Regan Hackelton'),(16,'86-135-554-55532','Java Developer','80 Service Park','China','Maojiadian','Chinese','Youtags',16,NULL,NULL,NULL,'Jsandye Bonwell'),(17,'86-185-552-65465','UI/UX Designer','552 Heath Avenue','China','Dasongshu','Chinese','Mydo',17,NULL,NULL,NULL,'Gael Lehrer'),(18,'62-856-555-512','Web Developer','748 Hazelcrest Circle','Indonesia','Gerong','Indonesian','Mydo',18,NULL,NULL,NULL,'Ad Gideon'),(19,'81-805-555-76','UI/UX Designer','310 Valley Edge Park','Japan','Fukuoka-shi','Japanese','Shufflester, ABC Jobs Pte. Ltd',19,NULL,NULL,NULL,'Lucille Cornbell'),(20,'+62 878 555 8171','Web Developer','4207 Merry Street','Indonesia','Dawuhan','Indonesian','Browseblab',20,NULL,NULL,NULL,'Adria Kenford'),(32,'+63 454 566 7863','default','default','default','default','default','default',25,NULL,NULL,'default','Noach Roskeilly'),(40,'+63 939 841 6091','Software Engineer','Bulacan','Singapore','Bulacan','Filipino','ABC',57,NULL,NULL,'default','Display'),(41,'+63 962 832 2134','Frontend Developer','Tondo, Manila','Phillipines','Manila','filipino','ABC',35,'Danielpngtree-modern-double-color-futuristic-neon-background-image_351866.jpg','DanielUIF logo header.png','default','Daniel');
/*!40000 ALTER TABLE `user_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `views` (
  `Views_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the unique identifier of instances a user view another user',
  `User_ID` int NOT NULL COMMENT 'Reference to user ID of the user who views other user',
  `UserInfo_ID` int NOT NULL COMMENT 'Reference to userinfo ID to be viewed',
  PRIMARY KEY (`Views_ID`),
  KEY `views_fk_userID` (`User_ID`),
  KEY `views_fk_userInfoID` (`UserInfo_ID`),
  CONSTRAINT `views_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `views_fk_userInfoID` FOREIGN KEY (`UserInfo_ID`) REFERENCES `user_information` (`UserInfo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,3,1),(2,2,3),(3,1,3),(4,5,3),(5,10,20),(6,11,19),(7,7,2),(8,8,3),(9,2,1),(10,3,15);
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 11:54:22
