-- DB CREATE
DROP DATABASE IF EXISTS TESTINGSYSTEM;
CREATE DATABASE TESTINGSYSTEM;
USE TESTINGSYSTEM;


-- TABLE CREATE

DROP TABLE IF EXISTS Department;
CREATE TABLE Department
(
DepartmentID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName VARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Position;
CREATE TABLE Position
(
PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName ENUM('Dev', 'Test', 'ScrumMaster', 'PM') NOT NULL UNIQUE KEY 
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`
(
AccountID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
UserName VARCHAR(50) NOT NULL UNIQUE KEY,
FullName VARCHAR(50) NOT NULL,
DepartmentID INT UNSIGNED NOT NULL,
PositionID INT UNSIGNED NOT NULL,
CreateDate DATETIME NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`
(
GroupID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
GroupName VARCHAR(30) NOT NULL UNIQUE KEY,
CreatorID INT UNSIGNED NOT NULL,
CreateDate DATETIME NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount
(
GroupID INT UNSIGNED NOT NULL PRIMARY KEY,
AccountID INT UNSIGNED NOT NULL,
JoinDate DATETIME NOT NULL
);

                    
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion
(
TypeID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM('Essay', 'Multiple-Choice') NOT NULL UNIQUE KEY
);                    

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion
(
CategoryID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question
(
QuestionID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(200) NOT NULL UNIQUE KEY,
CategoryID INT UNSIGNED NOT NULL,
TypeID INT UNSIGNED NOT NULL,
CreatorID INT UNSIGNED NOT NULL,
CreateDate DATETIME NOT NULL DEFAULT NOW()
);


DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer
(
AnswerID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(1000) NOT NULL,
QuestionID INT UNSIGNED NOT NULL,
isCorrect ENUM('True', 'Fall') NOT NULL
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam
(
ExamID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`code` VARCHAR(30) NOT NULL UNIQUE KEY,
Title VARCHAR(100) NOT NULL,
CategoryID INT UNSIGNED NOT NULL,
Duration INT UNSIGNED NOT NULL,
CreatorID INT UNSIGNED NOT NULL,
CreateDate DATETIME NOT NULL DEFAULT NOW()
);                   
                    

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion
(
ExamID INT UNSIGNED NOT NULL PRIMARY KEY,
QuestionID INT UNSIGNED NOT NULL 
);
                    
-- thêm dữ liệu cho bảng Department
INSERT INTO Department(DepartmentName)
VALUES                (      'Sale'),
					  (      'Ky thuat' ),
                      (      'Marketing'),
                      (      'bao ve');

-- thêm dữ liệu cho bảng Position
INSERT INTO `Position`(PositionName)
VALUES                (      'Dev'),									
                      (      'Test'),
                      (      'ScrumMaster'),
                      (      'PM');
                      
  
  -- thêm dữ liệu cho bảng Account
  INSERT INTO `Account`(Email,          UserName, FullName,      DepartmentID, PositionID)
  VALUES                ('anh@gmail.com', 'NTA', 'Nguyen Tuan Anh', 2,           1),
                        ('thuy@gmail.com', 'NTT', 'Nguyen Thi Thuy', 1,          2),
                        ('nhi@gmail.com', 'NHN', 'Nguyen Hai Nhi', 3,            4 );
                                            
                        
  