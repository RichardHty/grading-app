DROP DATABASE GradingApp;
CREATE DATABASE GradingApp;
USE GradingApp;


CREATE TABLE Class (
    ClassID INT AUTO_INCREMENT PRIMARY KEY,
    CourseNumber VARCHAR(64),
    Semester VARCHAR(64)
);

CREATE TABLE AssignmentCategory (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    ClassID INT NOT NULL,
    Name VARCHAR(128) NOT NULL,
    Weight INT
);

CREATE TABLE Assignment (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    ClassID INT NOT NULL,
    CategoryID INT NOT NULL,
    Name VARCHAR(255) NOT NULL,
    MaxPoints INT NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (CategoryID) REFERENCES AssignmentCategory(CategoryID)
);

CREATE TABLE Student (
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) PRIMARY KEY,
    BUID VARCHAR(20)
);

CREATE TABLE Enrolled (
    StudentID VARCHAR(255),
    ClassID INT,
    PRIMARY KEY (StudentID, ClassID),
    FOREIGN KEY (StudentID) REFERENCES Student(Email),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE Grade (
    AssignmentID INT,
    StudentID VARCHAR(255),
    LostPoints INT DEFAULT 0,
    PRIMARY KEY (AssignmentID, StudentID),
    FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Student(Email)
);

INSERT INTO Class(ClassID, CourseNumber, Semester) VALUES (1, "CS591", "Fall 2018");
INSERT INTO Class(ClassID, CourseNumber, Semester) VALUES (2, "CS591", "Spring 2019");
INSERT INTO Class(ClassID, CourseNumber, Semester) VALUES (3, "CS506", "Fall 2018");
INSERT INTO Class(ClassID, CourseNumber, Semester) VALUES (4, "CS460", "Spring 2019");
