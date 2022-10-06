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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,9),(2,12),(3,15),(4,19);
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
INSERT INTO `apply` VALUES (1,1),(7,2),(15,3),(6,4),(12,5),(13,6),(1,7),(4,8),(5,9),(17,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email`
--

LOCK TABLES `bulk_email` WRITE;
/*!40000 ALTER TABLE `bulk_email` DISABLE KEYS */;
INSERT INTO `bulk_email` VALUES (1,'Welcome to ABC Jobs Pte Ltd','Welcome to the community portal, your way to the world. I would like to thank you all for becoming a part of the first few members of the website, feel free to recommend this to your friends and colleagues and enjoy your journey to a better future. Happy coding!','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',1),(2,'Notice of deactivation','Our system noticed that your account has been spamming or has been posting innapropriate or malicious threads, if you think this is a mistake, please feel free to contact our support team.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com','sent',1),(3,'Announcement for march','Doe Corporation has a work environment that promotes diversity, embraces change, and provides leadership opportunities to every team member. We are on a fast track within the applications industry and are seeking highly skilled professionals to take us even further.\n\n			So if you are looking to make a move and are a highly motivated professional who welcomes new challenges, take a look at Doe Corporation... We have your next GREAT OPPORTUNITY!','dada@gmail.comamacelroy0@delicious.com\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',2),(4,'New Job Opportunity','The Technical Support Division has positions open for two technical support representatives in the Springfield office. Both positions require a B.S. in computer science and three years experience in the software industry. The closing date for applications is May 5. Interested persons should submit an application with a resume and a cover letter.\n			Technical support representatives provide telephone and on-line assistance to users of Doe\'s Vision and Mainline software products. Duties include:\n				- handling telephone inquiries\n				- answering on-line questions\n				- faxing hardcopy answers from our database\n			Questions concerning these positions can be answered by Eric Doe in Human Resources, extension 5555.','rfideler8@mapquest.com,\n						bheady9@howstuffworks.com,\n						cedlingtona@cmu.edu,\n						dspurdensb@hc360.com','sent',3),(5,'Anniversary celebration','We have come a long way…. We thank you for helping us achieve the 1 year milestone. To show our gratitude, we invite you to join us in the upcoming webinar to celebrate the anniversary of the website. We hope that you will attend.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',4),(6,'Announement for november','Greetings users, we are letting you know that we are improving our security system, thus we are also updating the Terms and Services, Privacy Policy,  and Cookie Policy. The services will take its effect on January 1, 2030.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',2),(7,'Catching up….','Hi user, you haven\'t used your account and it is temporarily disabled. To enable your account, please log in using the same credentials in registration. Have a nice day','delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com','draft',1),(8,'Site down','Dear users, our website is facing a problem with the server, please bear with us as we try to fix this issues.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','sent',3),(9,'Techniques popular nowadays','Dear user, we have found out that you have interest aligned to this webinar, we are inviting you to join this webinar entitled \"trends in IT industry\". We hope that you\'ll attend and listen to what our guest speakers will say and hopefully you\'ll get to know more about the IT world.','bcummingsc@msu.edu,\n				ksaylord@alexa.com','draft',4),(10,'Invite your colleagues','Dear user, we hope that our community portal is to your liking. Please do recommend this to your friends or colleagues. It is not required but we would appreciate it if you do so. Below is the attached questionnaire about your satisfaction. Thank you for your time reading this email.','amacelroy0@delicious.com,\n				bsterzaker1@chronoengine.com,\n				jpooly2@blogs.com,\n				bseebert3@apache.org,\n				edurtnall4@paginegialle.it,\n				cblazeby5@jigsy.com,\n				delliott6@51.la,\n				thazleton7@examiner.com,\n				rfideler8@mapquest.com,\n				bheady9@howstuffworks.com,\n				cedlingtona@cmu.edu,\n				dspurdensb@hc360.com,\n				bcummingsc@msu.edu,\n				ksaylord@alexa.com,\n				rhackeltone@diigo.com,\n				jbonwellf@123-reg.co.uk,\n				glehrerg@tuttocitta.it,\n				agideonh@123-reg.co.uk,\n				lcornbelli@paginegialle.it,\n				akenfordj@icio.us','draft',1);
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
INSERT INTO `can_manage` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,13),(2,14),(2,20);
/*!40000 ALTER TABLE `can_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educational_background`
--

DROP TABLE IF EXISTS `educational_background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educational_background` (
  `EB_ID` int NOT NULL AUTO_INCREMENT COMMENT 'This is the ID of the education background entry',
  `EB_YearEnd` int NOT NULL COMMENT 'This is the year ended of the education or study',
  `EB_YearStart` int NOT NULL COMMENT 'This is the year started of the study',
  `EB_Degree` varchar(50) NOT NULL COMMENT 'This is the degree attained by the user on that study',
  `EB_Achievements` varchar(60) NOT NULL COMMENT 'This contains the achievement attained by the user on that school',
  `EB_SchoolName` varchar(60) NOT NULL COMMENT 'This holds the name of the university the user went to for that study',
  `UserInfo_ID` int NOT NULL COMMENT 'this references to user info ID',
  `eb_achievement` varchar(255) DEFAULT NULL,
  `eb_school_name` varchar(255) DEFAULT NULL,
  `user_info_id` int DEFAULT NULL,
  `eb_year_end` int DEFAULT NULL,
  `eb_year_start` int DEFAULT NULL,
  PRIMARY KEY (`EB_ID`),
  KEY `ix_SchoolInfo` (`EB_SchoolName`),
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
  `Job_desc` text NOT NULL COMMENT 'This is the description or the details of the job offered',
  `Job_Salary` char(10) NOT NULL COMMENT 'This is the salary to be offered by the employer for the position',
  `Job_Application` varchar(255) NOT NULL COMMENT 'This refers to the status of the job vaccancy',
  `User_ID` int NOT NULL COMMENT 'references to the user ID who posted the job opportunity',
  PRIMARY KEY (`Job_ID`),
  KEY `ix_CompanyName` (`Job_Company`),
  KEY `job_fk_userID` (`User_ID`),
  CONSTRAINT `job_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Web Developer','Riffwire','We are looking for an outstanding Web Developer to be responsible for the coding, innovative design and layout of our website. Web developer responsibilities include building our website from concept all the way to completion from the bottom up, fashioning everything from the home page to site layout and function.','$45,978.11','Open',7),(2,'Web Developer','Meetz','We are looking for a skilled web developer who will be responsible for developing and/or designing websites for our company. You will be working alongside a team of other developers in creating, maintaining, and updating our websites. In order for you to succeed in this role, you will need to be proficient in JavaScript, HTML, CSS, and have solid knowledge and experience in programming application.','$17,706.99','Open',2),(3,'Application Development Engineer','Browseblab','we understand that our web and mobile applications are at the heart of our success. We’re looking for a talented application developer to spearhead our application development process and support the maintenance of our existing apps. If you’re passionate about creating high-quality applications and working as part of a collaborative team, we’d love to hear from you!','$37,337.21','Closed',20),(4,'Front End Developer','Avaveo','You will have the opportunity to be part of a global high-performing dynamic software team, doing what you do best. The role is focused on designing and building the best solutions for our users in over 120 countries, whilst maintaining best practices in software development.','$16,776.48','Closed',12),(5,'Software Engineer','Skipfire','Are you looking for a supportive, collaborative workplace with great teams and inspiring leaders? You’ve come to the right place. We’re looking for ambitious people who share our values and want to make every day better for people around the world. If this sounds like you, and the career below sounds exciting, we’d like to hear from you. Manulife Core Engineering and Transformation is seeking a self-motivated F ull-Stack Software Engineer ( NodeJS ) , who is obsessed with delivering value, is forward-thinking, and excited to see the successful implementation of the products they deliver. They will have experience in designing, developing, testing, maintaining and improving application APIs as a member of a team, works across key data, orchestration, rules and transactional stacks through the entire application and system development life cycle.','$25,210.57','Closed',11),(6,'Web Developer','Browseblab','Must have a strong passion for animals. We’re looking for smart, driven, web developer to help take us to the next level as we continue our expansion. This is a role for an animal lover, driven, high attention to detail, people’s person and eager to please. The WordPress Developer role will be in charge of maintaining building out new products and features across our suite of websites. This is a remote role.','$55,160.95','Open',20),(7,'Java Developer','Cogibox','Analyze, design develop, troubleshoot and debug software programs for commercial or end user applications. Writes code, completes programming and performs testing and debugging of applications. As a member of the software engineering division, you will perform high-level design based on provided external specifications. Specify, design and implement minor changes to existing software architecture. Build highly complex enhancements and resolve complex bugs. Build and execute unit tests and unit plans. Review integration and regression test plans created by QA. Communicate with QA and porting engineering as necessary to discuss minor changes to product functionality and to ensure quality and consistency across specific products. Duties and tasks are varied and complex needing independent judgment. Fully competent in own area of expertise. May have project lead role and or supervise lower level personnel.','$25,386.34','Open',10),(8,'Programmer Analyst','Meetz','We are looking for a programmer analyst to be responsible for writing, developing, and updating programs and software. The responsibilities of a programmer analyst include working on computer systems, developing systems that meet the needs of the company, and performing cost analysis. To be successful as a programmer analyst, you should be proficient in solving system problems, have programming experience, and excellent time management skills. Ultimately, a top-notch programmer analyst should have effective communication skills, be willing to work long hours and be certified in CompTIA A+.','$27,052.11','Closed',2),(9,'Back End Developer','Riffwire','Write stable, reusable codes, and libraries. Improving the performance of the front-end of the website according to the needs of the customer. Optimize applications for better performance. Take care of the technical feasibility of UI/UX designs. Develop, modify, maintain specifications and designs for complex applications. Perform analysis of the code, requirements, system risk, and software reliability. Collaborate and discuss with the stakeholders and all the team members.','$22,520.51','Closed',7),(10,'Software Engineer','Skipfire','As a Software Engineer in the Operational Excellence Business Intelligence group, you will play a key role as a member of a team that develops and supports various internal systems and tools that are used by leaders and colleagues. This includes an online dashboard that is used to report key business and financial metrics, a web-based system that is used to track and report client projects, and several custom reports used by stakeholders to support their business needs. The Software Engineer must be able to create full stack components and features that are directly accessed by a user through a UI or API. You will work with the development team (e.g., product leader, QA, testers, analysts) to develop and maintain solutions that meet the business requirements, utilizing the industry standard best practices and software engineering techniques.','$31,881.56','Open',11);
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
  `Msg_Name` char(50) NOT NULL COMMENT 'Just like in email, this refers to the name or topic of the message',
  `Msg_Body` text NOT NULL COMMENT 'this contains the main content or message of the user',
  `Msg_Sender` char(50) NOT NULL COMMENT 'this contains the name of the sender',
  `Msg_Reciever` char(50) NOT NULL COMMENT 'this contains the intended target or receiver of the message',
  `User_ID` int NOT NULL COMMENT 'references to User_ID as sender',
  `ReceivesUser_ID` int NOT NULL COMMENT 'references to User_ID as receiver',
  PRIMARY KEY (`Msg_ID`),
  KEY `msg_fk_userID_Sender` (`User_ID`),
  KEY `msg_fk_userID_Receiver` (`ReceivesUser_ID`),
  CONSTRAINT `msg_fk_userID_Receiver` FOREIGN KEY (`ReceivesUser_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `msg_fk_userID_Sender` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'About the portal','Hello, good day to you, I just recently registered, and I\'ve been having trouble with the GUI, can you guide me through?','Abbe McElroy','Lucille Cornbell',1,19),(2,'About your question…','Certainly, however, all the FAQ can be found in the site\'s FAQ page. Most of your concerns should be addressed there.','Lucille Cornbell','Abbe McElroy',19,1),(3,'I need clarification','I\'ve seen it however, I still don\'t understand the functionality regarding the application on job posts.','Abbe McElroy','Lucille Cornbell',1,19),(4,'To expound,','There is a button there where if you click apply, your record will be automatically sent to the employer, you don\'t have to worry about that much','Lucille Cornbell','Abbe McElroy',19,1),(5,'How does it work?','How about the job posting, where do I post job advertisement?','Abbe McElroy','Lucille Cornbell',1,19),(6,'Regarding your question..','Jus head to the job posting page, it can be found on the side panel, then just like in home page you can post.','Lucille Cornbell','Abbe McElroy',19,1),(7,'Thank you','Thank you for your guidance, I found it.','Abbe McElroy','Lucille Cornbell',1,19),(8,'Any thing else you have question with?','Any concerns that I still haven\'t addressed that you have in mind?','Lucille Cornbell','Abbe McElroy',19,1),(9,'To follow up,','To reiterate, the community portal provides a FAQ page where you can find most of your questions, however if you do have question in specific parts that are unclear, feel free to contact the support team.','Lucille Cornbell','Abbe McElroy',19,1),(10,'Have a nice day','Thank you again for the details, I appreciate it. Have a good day.','Abbe McElroy','Lucille Cornbell',1,19);
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
  `User_ID` int NOT NULL COMMENT 'Reference to user ID of the user who comments or reply on thread',
  `Th_ID` int NOT NULL COMMENT 'Reference to thread which the user replied to',
  `Reply_Body` text NOT NULL COMMENT 'The body of the comment',
  PRIMARY KEY (`Reply_ID`),
  KEY `reply_fk_userID` (`User_ID`),
  KEY `reply_fk_ThID` (`Th_ID`),
  CONSTRAINT `reply_fk_ThID` FOREIGN KEY (`Th_ID`) REFERENCES `thread` (`Th_ID`),
  CONSTRAINT `reply_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,4,1,'Thank you, that is really helpful.'),(2,8,1,'Impressive, keep it up.'),(3,17,1,'Do you have to have a solid graps of html css and js first?'),(4,12,1,'Thank you for the information.'),(5,18,1,'What are the alternatives of this framework?'),(6,16,1,'What is the difference between react and other JS framework?'),(7,5,1,'That\'s useful.'),(8,19,1,'Do you have any tips regarding react?'),(9,2,1,'Thank you for this information.'),(10,15,1,'Is this framework backward compatible?');
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
  `Th_Subject` char(50) NOT NULL COMMENT 'This contains the subject or topic that the user is intending to tackle on their thread',
  `Th_Body` text NOT NULL COMMENT 'This contains the main subject of the thread',
  `User_ID` int NOT NULL COMMENT 'this references to the user ID as the one who posts',
  PRIMARY KEY (`Th_ID`),
  KEY `th_fk_userID` (`User_ID`),
  CONSTRAINT `th_fk_userID` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (1,'React JS','Front End','React is one of the most popular JavaScript libraries for building sleek user interfaces. And if you\'re a front end developer, it\'s a useful and marketable skill to learn. Learn More…',3),(2,'Role of color in UX design','Front End','Without a doubt, colour is one of the most beautiful things which may stir various emotions in humans. There are numerous things a human can do just with colors. So why is colour such a powerful force in our day to day lives? How can it effect our bodies and minds? While perceptions of colour are somewhat subjectives and may have different meaning depending on where you live and even different cultures, there are still some colour effects that have universal meaning.',17),(3,'Gestalt Principles','UI/UX','The gestalt principles or the principles of grouping were first proposed by the gestalt psychologist. These principles were proposed by observing humans behavior of grouping the things together, these laws can be used while designing. There are seven laws of Gestalt',9),(4,'Tips on learning Java Programming','Java Developing','Java programming is probably the most widely known coding language out there, so it’s a great skill to learn if you want to start a career in programming. Here are the top tips for anyone who wants to start learning Java: Learn the Basics: As with anything, knowing the basics about Java is the best place to start. This is something you can start straight away – studying the basics online is a huge help to kick-starting your Java programming. Like many things, it can be a bit overwhelming at the start. If you are a complete beginner, code can look like gibberish. Bear in mind, though, everyone starts out at the same point. If you persevere, you can do it! Here’s a good resource for beginners to check out.',1),(5,'Overview of Jquery','Jquery','jQuery is a lightweight, \"write less, do more\", JavaScript library. The purpose of jQuery is to make it much easier to use JavaScript on your website. jQuery takes a lot of common tasks that require many lines of JavaScript code to accomplish, and wraps them into methods that you can call with a single line of code. jQuery also simplifies a lot of the complicated things from JavaScript, like AJAX calls and DOM manipulation.',18),(6,'Help, how do I set up github account','Question','Hi there, a lot of programmers use github and I want to use one, however I am not familiar with it, can anyone help me?',11),(7,'Learning never stops!','Web Development','Learn HTML! Done? Learn CSS! Done? Learn JavaScript! Done? Learn Git! Done? Learn React! Done? Learn Node.js! Done? Learn MongoDB! Done? Learn Python! Done? Learn Blockchain! Done? ........ Never stop learning! There are lots of opportunities waiting for you',13),(8,'List of careers in IT industry','Careers','Best #coding #careers available today Web Developer Software Developer Quality Assurance (QA engineer) Data Scientist Game Developer Mobile App Developer Business Intelligence Analyst',4),(9,'Information Security Overview','Cybersecurity','Information security analysts are the gatekeepers or security guards of information systems. To explain it another way: These professionals plan and execute security measures to shield an organization\'s computer systems and networks from infiltration and cyberattacks.',10),(10,'Tip For the Day in UX','Gestalt Principle','1. The law of proximity\nThe principle of proximity states that things that are close together appear to be more related than things that are spaced farther apart. For example, look at the following elements, both have the same elements but in first the elements are closed to each other, and in the other, they are separated apart.',5);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
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
  `User_Password` varchar(20) NOT NULL COMMENT 'this contains the user password',
  `User_Email` varchar(30) NOT NULL COMMENT 'this contains the user email',
  `Role_ID` int NOT NULL DEFAULT '1' COMMENT 'this reference to role table',
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `User_Email` (`User_Email`),
  KEY `user_fk_roleID` (`Role_ID`) USING BTREE,
  FULLTEXT KEY `ix_Name` (`User_FirstName`,`User_LastName`),
  CONSTRAINT `User_fk_roleID` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`Role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Abbe','MacElroy','O1tg8W','amacelroy0@delicious.com',1),(2,'Bucky','Sterzaker','hYy3B7q6TeWX','bsterzaker1@chronoengine.com',1),(3,'Julee','Pooly','GZVmgc','jpooly2@blogs.com',1),(4,'Barny','Seebert','4gwMmGn94i','bseebert3@apache.org',1),(5,'Erma','Durtnall','eiPmCebe','edurtnall4@paginegialle.it',1),(6,'Carleton','Blazeby','3WxGfk','cblazeby5@jigsy.com',1),(7,'Dot','Elliott','GmkUXszsiem','delliott6@51.la',1),(8,'Theda','Hazleton','SHtQSH','thazleton7@examiner.com',1),(9,'Rosita','Fideler','ftJRUTzq4lf','rfideler8@mapquest.com',2),(10,'Bruce','Heady','1p9nR3op','bheady9@howstuffworks.com',1),(11,'Constantia','Edlington','y8Ogr0s3yIk','cedlingtona@cmu.edu',1),(12,'Dominic','Spurdens','KumfANxVp11d','dspurdensb@hc360.com',2),(13,'Beck','Cummings','ayrnqSf17Bc','bcummingsc@msu.edu',1),(14,'Kev','Saylor','jLQhm26','ksaylord@alexa.com',1),(15,'Regan','Hackelton','by1CWwhCEx','rhackeltone@diigo.com',2),(16,'Jsandye','Bonwell','06rjfJY','jbonwellf@123-reg.co.uk',1),(17,'Gael','Lehrer','8ThVXSS7','glehrerg@tuttocitta.it',1),(18,'Ad','Gideon','9ux8ZhxV','agideonh@123-reg.co.uk',1),(19,'Lucille','Cornbell','QrOmvUuK6','lcornbelli@paginegialle.it',2),(20,'Adria','Kenford','3rLa5kiI','akenfordj@icio.us',1),(21,'Talyah','Franken','vJvb2rzu','tfranken0@ucla.edu',1),(22,'Janeva','Paolone','U0BHGg','jpaolone1@nydailynews.com',1),(23,'Abbe','Galsworthy','pGc9dqA7','agalsworthy2@geocities.com',1),(24,'Bili','Mastrantone','MTWqW2','bmastrantone3@nasa.gov',1),(25,'Noach','Roskeilly','PMMqPn','nroskeilly4@ucsd.edu',1),(26,'Seward','Proschke','65gDtJbBhB','sproschke5@indiatimes.com',1),(27,'Tremaine','Muckeen','AWnTF8q1u1Px','tmuckeen6@telegraph.co.uk',1),(28,'Hubey','Prover','QC74IgzyU','hprover7@blogs.com',1),(29,'Farly','Fenne','xmkuOn','ffenne8@deliciousdays.com',1),(30,'Raddie','Walcher','yX6VoN43t','rwalcher9@ovh.net',1),(31,'John Daniel','Tejero','dad','johndanieltejero23@gmail.com',1),(32,'John Daniel','Tejero','test','johndanieltejero@gmail.com',1),(33,'Test','User','test','testpass@gmail.com',1),(34,'test','Tejero','test','testpass123@gmail.com',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information`
--

LOCK TABLES `user_information` WRITE;
/*!40000 ALTER TABLE `user_information` DISABLE KEYS */;
INSERT INTO `user_information` VALUES (1,'84-555-514-118','Java Developer','70 Hazelcrest Crossing','Vietnam','Thị Trấn Na Hang','Vietnamese','Kamba',1,NULL,NULL,NULL,'Abbe MacElroy'),(2,'63-921-555-3272','Data Scientist','6687 Eggendart Trail','Philippines','Wright','Filipino','Meetz',2,NULL,NULL,NULL,'Bucky Sterzaker'),(3,'63-932-555-2340','Web Developer','049 Farragut Court','Phillipines','Romblon','Filipino','Dynava',3,NULL,NULL,NULL,'Julee Pooly'),(4,'63-283-555-2040','Software Programmer','06 Warrior Drive','Philippines','Capulaan','Filipino','Jabberbean',4,NULL,NULL,NULL,'Barny Seebert'),(5,'63-910-555-6378','UI/UX Designer','1886 Forest Avenue','Philippines','Tumauini','Filipino','Muxo',5,NULL,NULL,NULL,'Erma Durtnall'),(6,'66-855-559-842','Web Developer','68992 Raven Pass','Thailand','Don Mueang','Thai','Skyvu',6,NULL,NULL,NULL,'Carleton Blazeby'),(7,'86-185-557-07205','Software Programmer','42 Merchant Road','China','Guling','Chinese','Riffwire',7,NULL,NULL,NULL,'Dot Elliott'),(8,'62-812-555-503','UI/UX Designer','47566 Chive Road','Indonesia','Ciburial','Indonesian','Skipfire',8,NULL,NULL,NULL,'Theda Hazleton'),(9,'62-838-555-685','Java Developer','4192 Hanover Circle','Indonesia','Karanggintung','Indonesian','Dazzlesphere, ABC Jobs Pte. Ltd',9,NULL,NULL,NULL,'Rosita Fideler'),(10,'86-185-557-50801','Database Administrator','659 Buena Vista Crossing','China','Gaojian','Chinese','Cogibox',10,NULL,NULL,NULL,'Bruce Heady'),(11,'86-155-558-09546','Cloud Computing Engineer','55515 Namekagon Lane','China','Long’anqiao','Chinese','Skipfire',11,NULL,NULL,NULL,'Constantia Edlington'),(12,'63-932-555-2938','Cloud Computing Engineer','67695 Basil Circle','Philippines','Lumatil','Filipino','Avaveo, ABC Jobs Pte. Ltd',12,NULL,NULL,NULL,'Dominic Spurdens'),(13,'63-283-555-5940','Web Developer','56 Arapahoe Trail','Philippines','Bulalacao','Filipino','Chatterbridge',13,NULL,NULL,NULL,'Beck Cummings'),(14,'86-185-555-91361','Software Programmer','836 Cardinal Point','China','Bacheng','Chinese','Youopia',14,NULL,NULL,NULL,'Kev Saylor'),(15,'63-922-555-8178','Software Programmer','1 Mifflin Trail','Philippines','Guihulñgan','Filipino','Rooxo, ABC Jobs Pte. Ltd',15,NULL,NULL,NULL,'Regan Hackelton'),(16,'86-135-554-55532','Java Developer','80 Service Park','China','Maojiadian','Chinese','Youtags',16,NULL,NULL,NULL,'Jsandye Bonwell'),(17,'86-185-552-65465','UI/UX Designer','552 Heath Avenue','China','Dasongshu','Chinese','Mydo',17,NULL,NULL,NULL,'Gael Lehrer'),(18,'62-856-555-512','Web Developer','748 Hazelcrest Circle','Indonesia','Gerong','Indonesian','Mydo',18,NULL,NULL,NULL,'Ad Gideon'),(19,'81-805-555-76','UI/UX Designer','310 Valley Edge Park','Japan','Fukuoka-shi','Japanese','Shufflester, ABC Jobs Pte. Ltd',19,NULL,NULL,NULL,'Lucille Cornbell'),(20,'62-878-555-817','Web Developer','4207 Merry Street','Indonesia','Dawuhan','Indonesian','Browseblab',20,NULL,NULL,NULL,'Adria Kenford'),(21,'+63 939 841 6091','default','Pulilan Pulil','Phillipines','Pulilan','filipino','default',32,NULL,NULL,'default','John Daniel Tejero'),(22,'+1 540 422 6171','N/A','Lincolnton, North Carolina(NC), 28092','United States of America','Sample City','american','N/A',33,NULL,NULL,'default','Testing'),(23,'+63 939 841 6091','Software Engineer','Pulilan Pulil','Phillipines','Pulilan','filipino','ABC',31,NULL,NULL,'default','No');
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

-- Dump completed on 2022-05-12 13:36:24
