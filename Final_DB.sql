DROP TABLE IF EXISTS Staff_ID_0;
DROP TABLE IF EXISTS Staff_ID_1;
DROP TABLE IF EXISTS Staff_ID_2;
DROP TABLE IF EXISTS staffStudyRoom;
DROP TABLE IF EXISTS staffTransaction_t;
DROP TABLE IF EXISTS studentTransaction_t;
DROP TABLE IF EXISTS transactionMedia_t;
DROP TABLE IF EXISTS bookTransaction_t;
DROP TABLE IF EXISTS studyRoom_t;
DROP TABLE IF EXISTS Student_t;
DROP TABLE IF EXISTS Media_t;
DROP TABLE IF EXISTS Event_t;
DROP TABLE IF EXISTS Transaction_t;
DROP TABLE IF EXISTS Book_t;
DROP TABLE IF EXISTS Staff_1;
DROP TABLE IF EXISTS Staff_t;

-- Start of main tables
CREATE TABLE Staff_t (
    Staff_Id		VARCHAR(10),
	Username		VARCHAR(20),
	Password		VARCHAR(20),
	Email			VARCHAR(20),
	Role			VARCHAR(20),
CONSTRAINT Staff_PK PRIMARY KEY (Staff_Id)
);

CREATE TABLE Book_t (
	Book_ID		    VARCHAR(50),
	Author			VARCHAR(20),
	ISBN 			VARCHAR(20),
	Cataloged		VARCHAR(20),
	Holds			VARCHAR(20),
CONSTRAINT Book_t_PK PRIMARY KEY (Book_ID)
);

CREATE TABLE Transaction_t (
	Transaction_ID	    VARCHAR(20),
	Item_Out			VARCHAR(20),
	Who_Checked_Out 	VARCHAR(20),
	When_Checked_Out 	VARCHAR(20),
	Return_Date 		VARCHAR(20),
CONSTRAINT Transaction_t_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE Media_t (
	Media_ID 		VARCHAR(20),
	Media_Type	    VARCHAR(20),
	Holds			VARCHAR(20),
CONSTRAINT Media_t_PK PRIMARY KEY (Media_ID)
);

CREATE TABLE Event_t (
	Event_ID 				VARCHAR(20),
	Exhibits_On_Display		VARCHAR(20),
	Owner_Of_Exhibit 		VARCHAR(20),
	Start_Date				VARCHAR(20),
	End_Date 				VARCHAR(20),
	Owner_Email 			VARCHAR(20),
	Phone_Number			VARCHAR(20),
CONSTRAINT Event_t_PK PRIMARY KEY (Event_ID)
);

CREATE TABLE Student_t (
	Student_ID 	       VARCHAR(20),
	Username	       VARCHAR(20),
	Password 		   VARCHAR(20),
	Student_Email	   VARCHAR(20),
	Item_Borrowed	   VARCHAR(20),
	Return_Date		   VARCHAR(20),
	Student_Name	   VARCHAR(20),
CONSTRAINT Student_t_PK PRIMARY KEY (Student_ID)
);

CREATE TABLE studyRoom_t (
	studyRoom_ID	VARCHAR(20),
	Student_ID 	    VARCHAR(20),
	timeRequested	VARCHAR(20),
CONSTRAINT studyRoom_t_PK PRIMARY KEY (studyRoom_ID),
CONSTRAINT studyRoom_t_FK1 FOREIGN KEY (Student_ID) REFERENCES Student_t(Student_ID)
);
-- End of main tables

-- Start of mini-tables
CREATE TABLE bookTransaction_t (
  Book_ID			VARCHAR(50),
  Transaction_ID  VARCHAR(20),
CONSTRAINT bookTransaction_t_PK PRIMARY KEY (Book_t_Id),
CONSTRAINT bookTransaction_t_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE transactionMedia_t (
  Media_ID			VARCHAR(20),
  Transaction_ID      VARCHAR(20),
CONSTRAINT transactionMedia_t_PK PRIMARY KEY (Media_ID),
CONSTRAINT transactionMedia_t_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE studentTransaction_t (
  Student_ID      VARCHAR(20),
  Transaction_ID  VARCHAR(20),
CONSTRAINT studentTransaction_t_PK PRIMARY KEY (Student_ID),
CONSTRAINT studentTransaction_t_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE staffTransaction_t (
  Staff_Id			   VARCHAR(20),
  Transaction_ID     VARCHAR(20),
CONSTRAINT bookTransaction_t_PK PRIMARY KEY (Staff_Id),
CONSTRAINT bookTransaction_t_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE staffStudyRoom (
  Staff_Id			VARCHAR(20),
  studyRoom_ID     VARCHAR(20),
CONSTRAINT staffStudyRoom_PK PRIMARY KEY (Staff_Id),
CONSTRAINT staffStudyRoom_PK PRIMARY KEY (studyRoom_ID)
);

CREATE TABLE Staff_ID_2 (
	Staff_ID		VARCHAR(20),
	Event_t_ID		VARCHAR(20),
CONSTRAINT Staff_ID_2_PK PRIMARY KEY (Staff_ID),
CONSTRAINT Staff_ID_2_Event_t_FK FOREIGN KEY (Event_t_ID) REFERENCES Event_t(Event_t_ID)
);

CREATE TABLE Staff_ID_1 (
	Staff_ID		VARCHAR(20),
	Media_t_ID		VARCHAR(20),
CONSTRAINT Staff_ID_1_PK PRIMARY KEY (Staff_ID),
CONSTRAINT Staff_ID_1_Media_t_FK FOREIGN KEY (Media_t_ID) REFERENCES Media_t(Media_t_ID)
);

CREATE TABLE Staff_ID_0 (
	Staff_ID		VARCHAR(20),
	Student_t_ID	VARCHAR(20),
CONSTRAINT Staff_ID_0_PK PRIMARY KEY (Staff_ID),
CONSTRAINT Staff_ID_0_Student_t_FK FOREIGN KEY (Student_t_ID) REFERENCES Student_t(Student_t_ID)
);
-- End of mini-tables



INSERT INTO Student_t
VALUES ('W00875435', 'coynej', 'bubbles', 'coynej@wit.edu', 'Ready Player One', '2018-05-24', 'James Coyne');
INSERT INTO Student_t
VALUES ('W00123456', 'toubeaus', 'bread', 'toubeaus@wit.edu', 'Saga Vol 1', '2018-04-01', 'Shawnathan Toubeau');
INSERT INTO Student_t
VALUES ('W00789654', 'beaucagej', 'pizza', 'beaucagej@wit.edu', 'Eye of the World', '2018-05-03', 'Jeffrey Beaucage');
INSERT INTO Student_t
VALUES ('W00678876', 'seltenreichs', 'notEvil', 'seltenreichs@wit.edu', 'Black Panther Comic', '2019-03-23', 'Sophia Seltenreich');
INSERT INTO Student_t
VALUES ('W00456321', 'kylev', 'coastModern', 'kylev@wit.edu', 'Rogue One', '2019-03-13', 'Vicky Kyle');
INSERT INTO Student_t
VALUES ('W00124567', 'petersena', 'darkchocolate', 'petersena@wit.edu', 'Cracking the Coding Interview', '2018-05-21', 'Abigail Petersen');

INSERT INTO Book_t
VALUES ('Ready Player One', 'Ernest Cline', 8297827818301, 'Book_t', 0);
INSERT INTO Book_t
VALUES ('Saga Vol 1', 'John Cena', 8959120715759, 'Book_t', 3);
INSERT INTO Book_t
VALUES ('Eye of the World', 'Robert Jordan', 7718800405691, 'Book_t', 3);
INSERT INTO Book_t
VALUES ('Black Panther Comic', 'Stan Lee', 6692457568506, 'Book_t', 1);
INSERT INTO Book_t
VALUES ('Rogue One', 'George Lucas', 9757089502679, 'Book_t', 0);
INSERT INTO Book_t
VALUES ('Cracking the Coding Interview', 'Gayle G', 7079559901159, 'Book_t', 0);

INSERT INTO studyRoom_t
VALUES ('1', 'W00875435', 3:00);
INSERT INTO studyRoom_t
VALUES ('2', 'W00123456', 4:30);
INSERT INTO studyRoom_t
VALUES ('3', 'W00789654', 7:45);
INSERT INTO studyRoom_t
VALUES ('4', 'W00678876', 8:15);
INSERT INTO studyRoom_t
VALUES ('5', 'W00456321', 1:15);
INSERT INTO studyRoom_t
VALUES ('6', 'W00124567', 2:30);

INSERT INTO Staff_t
VALUES ('w00985436', 'sheamusp' 'password', 'sheamusp@wit.edu', 'librarian');
INSERT INTO Staff_t
VALUES ('w00988754', 'hellenk' 'cheeseburgers', 'hellenk@wit.edu', 'help desk');
INSERT INTO Staff_t
VALUES ('w00654709', 'mirandao' 'ilovebooks', 'mirandao@wit.edu', 'help desk');
INSERT INTO Staff_t
VALUES ('w00985436', 'perryj' 'funbooks', 'perryj@wit.edu', 'librarian');
INSERT INTO Staff_t
VALUES ('w00546436', 'crosbyc' 'mechanicalkeyboards', 'crosbyc@wit.edu', 'work study');

INSERT INTO Media_t
VALUES ('Star Wars', 'Movie', 3);
INSERT INTO Media_t
VALUES ('The Avengers', 'Movie', 0);
INSERT INTO Media_t
VALUES ('Dark Side of the Moon', 'CD', 1);
INSERT INTO Media_t
VALUES ('Entertainment', 'CD', 15);
INSERT INTO Media_t
VALUES ('Scott Pilgrim vs The World', 'Movie', 0);
INSERT INTO Media_t
VALUES ('After Laughter', 'CD', 7);

INSERT INTO Event_t
VALUES ('Virtual Fractality', 1, 'Ava Poppas', '1-MARCH-2018', '1-APRIL-2018', 'poppasa@wit.edu', '1234567899');
INSERT INTO Event_t
VALUES ('Career Fair', 1, 'Co-op Office', '20-MARCH-2018', '21-MARCH-2018', 'coopoffice@wit.edu', '2034506578');

INSERT INTO Transaction_t
VALUES('svbx3619jf', 'Ready Player One', 'W00875435', '2018-05-24', '2018-05-24');
INSERT INTO Transaction_t
VALUES('mm52ti67mb', 'Saga Vol 1', 'W00123456', '2018-04-16', '2018-05-10');
INSERT INTO Transaction_t
VALUES('mn91g4xhh3', 'Eye of the World', 'W00789654', '2018-05-3', '2018-05-18');
INSERT INTO Transaction_t
VALUES('9hygaqbf5h', 'Black Panther Comic', 'W00678876', '2018-03-7', '2018-03-21');
INSERT INTO Transaction_t
VALUES('7rtg3kqqeq', 'Rogue One', 'W00456321', '2018-03-12', '2018-03-24');
INSERT INTO Transaction_t
VALUES('nz3uz3kicb', 'Cracking the Coding Interview', 'W00124567', '2018-05-7', '2018-05-22');
