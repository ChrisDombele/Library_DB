DROP TABLE IF EXISTS Staff_ID_0;
DROP TABLE IF EXISTS Staff_ID_1;
DROP TABLE IF EXISTS Staff_ID_2;
DROP TABLE IF EXISTS Study_Room;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Media;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Staff_1;
DROP TABLE IF EXISTS Staff_t;


CREATE TABLE Staff_t (
	Staff_ID		VARCHAR(20),
	User_Name		VARCHAR(20),
	Password		VARCHAR(20),
	Email			VARCHAR(20),
	Role			TEXT,
CONSTRAINT Staff_PK PRIMARY KEY (Staff_ID)
);

CREATE TABLE Staff_1 (
	Staff_ID		VARCHAR(20),
	Book_ID			VARCHAR(20),
CONSTRAINT Staff_PK PRIMARY KEY (Staff_ID, Book_ID)
);

CREATE TABLE Book (
	Book_ID			VARCHAR(20),
	Author			VARCHAR(20),
	ISBN 			VARCHAR(20),
	Catalogued		VARCHAR(20),
	Holds			VARCHAR(20),
CONSTRAINT Book_PK PRIMARY KEY (Book_ID)
);

CREATE TABLE Transaction (
	Transaction_ID		VARCHAR(20),
	Item_Out			VARCHAR(20),
	Who_Checked_Out 	VARCHAR(20),
	When_Checked_Out 	VARCHAR(20),
	Return_Date 		VARCHAR(20),
CONSTRAINT Transaction_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE Event (
	Event_ID 				VARCHAR(20),
	Exhibits_On_Display		VARCHAR(20),
	Owner_Of_Exhibit 		VARCHAR(20),
	Start_Date				VARCHAR(20),
	End_Date 				VARCHAR(20),
	Owner_Email 			VARCHAR(20),
	Phone_Number			INT,
CONSTRAINT Event_PK PRIMARY KEY (Event_ID)
);

CREATE TABLE Media (
	Media_ID 		VARCHAR(20),
	Media_Name		TEXT,
	Holds			TEXT,
CONSTRAINT Media_PK PRIMARY KEY (Media_ID)
);

CREATE TABLE Student (
	Student_ID 		VARCHAR(20),
	User_Name		TEXT,
	Password 		VARCHAR(20),
	Student_Email	VARCHAR(20),
	Item_Borrowed	TEXT,
	Return_Date		VARCHAR(20),
	Student_Name	TEXT,
CONSTRAINT Student_PK PRIMARY KEY (Student_ID)
);

CREATE TABLE Study_Room (
	Study_Room_ID	VARCHAR(20),
	room_Numbers	VARCHAR(20),
	Time_Set		INT,
	Student_ID 		VARCHAR(20),
CONSTRAINT Study_Room_PK PRIMARY KEY (Study_Room_ID),
CONSTRAINT Study_Room_Student_FK FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE Staff_ID_2 (
	Staff_ID		VARCHAR(20),
	Event_ID		VARCHAR(20),
CONSTRAINT Staff_ID_2_PK PRIMARY KEY (Staff_ID),
CONSTRAINT Staff_ID_2_Event_FK FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

CREATE TABLE Staff_ID_1 (
	Staff_ID		VARCHAR(20),
	Media_ID		VARCHAR(20),
CONSTRAINT Staff_ID_1_PK PRIMARY KEY (Staff_ID),
CONSTRAINT Staff_ID_1_Media_FK FOREIGN KEY (Media_ID) REFERENCES Media(Media_ID)
);

CREATE TABLE Staff_ID_0 (
	Staff_ID		VARCHAR(20),
	Student_ID		VARCHAR(20),
CONSTRAINT Staff_ID_0_PK PRIMARY KEY (Staff_ID),
CONSTRAINT Staff_ID_0_Student_FK FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);
