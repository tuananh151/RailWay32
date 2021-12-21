-- DB CREATE
DROP DATABASE IF EXISTS TESTINGSYSTEM;
CREATE DATABASE TESTINGSYSTEM;
USE TESTINGSYSTEM;


-- TABLE CREATE

DROP TABLE IF EXISTS Department;
CREATE TABLE Department
(
DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName VARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Position;
CREATE TABLE Position
(
PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName ENUM('Dev', 'Test', 'ScrumMaster', 'PM') NOT NULL UNIQUE KEY 
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`
(
AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
UserName VARCHAR(50) NOT NULL UNIQUE KEY,
FullName VARCHAR(50) NOT NULL,
DepartmentID TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
PositionID TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID),
CreateDate DATETIME NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`
(
GroupID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
GroupName VARCHAR(30) NOT NULL UNIQUE KEY,
CreatorID SMALLINT UNSIGNED NOT NULL,
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID),
CreateDate DATETIME NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount
(
GroupID TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
AccountID SMALLINT UNSIGNED NOT NULL,
FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID),
JoinDate DATETIME NOT NULL,
PRIMARY KEY(GroupID, AccountID)
);

                    
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion
(
TypeID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM('Essay', 'Multiple-Choice') NOT NULL UNIQUE KEY
);                    

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion
(
CategoryID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
CategoryName VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question
(
QuestionID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(200) NOT NULL UNIQUE KEY,
CategoryID TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
TypeID TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
CreatorID SMALLINT UNSIGNED NOT NULL,
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID),
CreateDate DATETIME NOT NULL DEFAULT NOW()
);


DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer
(
AnswerID MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
Content VARCHAR(200) NOT NULL,
QuestionID SMALLINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
isCorrect BIT DEFAULT 1
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam
(
ExamID TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`code` CHAR(10) NOT NULL UNIQUE KEY,
Title VARCHAR(100) NOT NULL,
CategoryID TINYINT UNSIGNED NOT NULL,
Duration TINYINT UNSIGNED NOT NULL,
CreatorID SMALLINT UNSIGNED NOT NULL,
CreateDate DATETIME NOT NULL DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);                   
                    

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion
(
ExamID TINYINT UNSIGNED NOT NULL,
QuestionID SMALLINT UNSIGNED NOT NULL,
FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
PRIMARY KEY (ExamID, QuestionID)
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
                                            
                        
  