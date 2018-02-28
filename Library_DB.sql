DROP TABLE IF EXISTS Study_Room_t;
DROP TABLE IF EXISTS Student_t;
DROP TABLE IF EXISTS Media_t;
DROP TABLE IF EXISTS Event_t;
DROP TABLE IF EXISTS Transaction_t;
DROP TABLE IF EXISTS Book_t;
DROP TABLE IF EXISTS Staff_t;


CREATE TABLE Staff_t (
	Staff_ID		VARCHAR(10),
	User_Name		VARCHAR(20),
	Password		VARCHAR(20),
	Email			VARCHAR(20),
	Role			TEXT,
CONSTRAINT Staff_PK PRIMARY KEY (Staff_ID)
);

CREATE TABLE Book_t (
	Book_ID			VARCHAR(20),
	Author			VARCHAR(20),
	ISBN 			VARCHAR(20),
	Catalogued		VARCHAR(20),
	Holds			VARCHAR(20),
CONSTRAINT Book_PK PRIMARY KEY (Book_ID)
);

CREATE TABLE Transaction_t (
	Transaction_ID		VARCHAR(20),
	Item_Out			VARCHAR(20),
	Who_Checked_Out 	VARCHAR(20),
	When_Checked_Out 	VARCHAR(20),
	Return_Date 		VARCHAR(20),
CONSTRAINT Transaction_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE Event_t (
	Event_ID 				VARCHAR(20),
	Exhibits_On_Display		VARCHAR(20),
	Owner_Of_Exhibit 		VARCHAR(20),
	Start_Date				VARCHAR(20),
	End_Date 				VARCHAR(20),
	Owner_Email 			VARCHAR(20),
	Phone_Number			INT,
CONSTRAINT Event_PK PRIMARY KEY (Event_ID)
);

CREATE TABLE Media_t (
	Media_ID 		VARCHAR(20),
	Media_Name		TEXT,
	Holds			TEXT,
CONSTRAINT Media_PK PRIMARY KEY (Media_ID)
);

CREATE TABLE Student_t (
	Student_ID 		VARCHAR(20),
	User_Name		TEXT,
	Password 		VARCHAR(20),
	Student_Email	VARCHAR(20),
	Item_Borrowed	TEXT,
	Return_Date		VARCHAR(20),
	Student_Name	TEXT,
CONSTRAINT Student_PK PRIMARY KEY (Student_ID)
);

CREATE TABLE Study_Room_t (
	Study_Room_ID	VARCHAR(20),
	Student_ID 		VARCHAR(20),
	room_Numbers	VARCHAR(20),
	Time_Set		INT,
CONSTRAINT Study_Room_PK PRIMARY KEY (Study_Room_ID),
CONSTRAINT Study_Room_FK1 FOREIGN KEY (Student_ID) REFERENCES Student_t(Student_ID)
);
