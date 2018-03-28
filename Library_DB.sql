DROP TABLE IF EXISTS staffBook_t;
DROP TABLE IF EXISTS staffStudent_t;
DROP TABLE IF EXISTS staffMedia_t;
DROP TABLE IF EXISTS staffEvent_t;
DROP TABLE IF EXISTS staffStudyRoom_t;
DROP TABLE IF EXISTS staffTransaction_t;
DROP TABLE IF EXISTS studentTransaction_t;
DROP TABLE IF EXISTS transactionMedia_t;
DROP TABLE IF EXISTS bookTransaction_t;
DROP TABLE IF EXISTS studyRoom_t;
DROP TABLE IF EXISTS Student_t;
DROP TABLE IF EXISTS Event_t;
DROP TABLE IF EXISTS Media_t;
DROP TABLE IF EXISTS Transaction_t;
DROP TABLE IF EXISTS Book_t;
DROP TABLE IF EXISTS Staff_t;

-- Start of main tables
CREATE TABLE Staff_t (
  Staff_ID		VARCHAR(10),
  Username	    VARCHAR(20),
  Password	    VARCHAR(50),
  Email	        VARCHAR(50),
  Role	        TEXT,
CONSTRAINT Staff_PK PRIMARY KEY (Staff_ID)
);

CREATE TABLE Book_t (
    Book_ID		    VARCHAR(50),
	Author			VARCHAR(50),
	ISBN 			VARCHAR(17),
	Cataloged		ENUM("yes", "no"),
	Holds			INT,
CONSTRAINT Book_t_PK PRIMARY KEY (Book_ID)
);

CREATE TABLE Transaction_t (
	Transaction_ID	    VARCHAR(50),
	Item_Out			VARCHAR(50),
	Who_Checked_Out 	VARCHAR(50),
	When_Checked_Out 	DATE,
	Return_Date 		DATE,
CONSTRAINT Transaction_t_PK PRIMARY KEY (Transaction_ID)
);

CREATE TABLE Media_t (
	Media_ID 		VARCHAR(50),
	Media_Type	    VARCHAR(20),
	Holds			INT,
CONSTRAINT Media_t_PK PRIMARY KEY (Media_ID)
);

CREATE TABLE Event_t (
	Event_ID 			   VARCHAR(50),
	Exhibits_On_Display	   TEXT,
	Owner_Of_Exhibit 	   VARCHAR(50),
	Start_Date             DATE,
	End_Date               DATE,
	Owner_Email 		   VARCHAR(50),
	Phone_Number           INT,
CONSTRAINT Event_t_PK PRIMARY KEY (Event_ID)
);

CREATE TABLE Student_t (
	Student_ID         VARCHAR(50),
	Username	       VARCHAR(20),
	Password           VARCHAR(50),
	Student_Email	   VARCHAR(50),
	Item_Borrowed	   VARCHAR(50),
	Return_Date		   DATE,
	Student_Name	   VARCHAR(50),
CONSTRAINT Student_t_PK PRIMARY KEY (Student_ID)
);

CREATE TABLE studyRoom_t (
	studyRoom_ID       VARCHAR(50),
	Student_ID         VARCHAR(50),
	timeRequested      INT,
CONSTRAINT studyRoom_t_PK PRIMARY KEY (studyRoom_ID),
CONSTRAINT studyRoom_t_FK1 FOREIGN KEY (Student_ID) REFERENCES Student_t(Student_ID)
);
-- End of main tables

-- Start of mini-tables
CREATE TABLE bookTransaction_t (
  Book_ID			    VARCHAR(17),
  Transaction_ID        VARCHAR(50),
CONSTRAINT bookTransaction_t_PK PRIMARY KEY (Book_ID, Transaction_ID)
);

CREATE TABLE transactionMedia_t (
  Media_ID              VARCHAR(50),
  Transaction_ID        VARCHAR(50),
CONSTRAINT transactionMedia_t_PK PRIMARY KEY (Media_ID, Transaction_ID)
);

CREATE TABLE studentTransaction_t (
  Student_ID      VARCHAR(50),
  Transaction_ID  VARCHAR(50),
CONSTRAINT studentTransaction_t_PK PRIMARY KEY (Student_ID, Transaction_ID)
);

CREATE TABLE staffTransaction_t (
  Staff_ID          VARCHAR(10),
  Transaction_ID    VARCHAR(50),
CONSTRAINT staffTransaction_t_PK PRIMARY KEY (Staff_ID, Transaction_ID)
);

CREATE TABLE staffStudyRoom_t (
  Staff_ID          VARCHAR(10),
  studyRoom_ID      VARCHAR(50),
CONSTRAINT staffStudyRoom_t_PK PRIMARY KEY (Staff_ID, studyRoom_ID)
);

CREATE TABLE staffEvent_t (
	Staff_ID       VARCHAR(10),
	Event_ID       VARCHAR(50),
CONSTRAINT staffEvent_t_PK PRIMARY KEY (Staff_ID, Event_ID)
);

CREATE TABLE staffMedia_t (
	Staff_ID     VARCHAR(10),
	Media_ID     VARCHAR(50),
CONSTRAINT staffMedia_t_PK PRIMARY KEY (Staff_ID, Media_ID)
);

CREATE TABLE staffStudent_t (
	Staff_ID     VARCHAR(10),
	Student_ID   VARCHAR(50),
CONSTRAINT staffStudent_t_PK PRIMARY KEY (Staff_ID, Student_ID)
);

CREATE TABLE staffBook_t (
    Staff_ID    VARCHAR(10),
    Book_ID     VARCHAR(17),
CONSTRAINT staffBook_t PRIMARY KEY (Staff_ID, Book_ID)
);
-- End of mini-tables


-- Start of inserts
INSERT INTO Staff_t VALUES
('w00985436', 'sheamusp', 'password', 'sheamusp@wit.edu', 'librarian'),
('w00988754', 'hellenk', 'cheeseburgers', 'hellenk@wit.edu', 'help desk'),
('w00654709', 'mirandao', 'ilovebooks', 'mirandao@wit.edu', 'help desk'),
('w00985476', 'perryj', 'funbooks', 'perryj@wit.edu', 'librarian'),
('w00546436', 'crosbyc', 'mechanicalkeyboards', 'crosbyc@wit.edu', 'work study');

INSERT INTO Book_t VALUES
('Ready Player One', 'Ernest Cline', 8297827818301, 'Book_t', 0),
('Saga Vol 1', 'John Cena', 8959150715759, 'Book_t', 3),
('Eye of the World', 'Robert Jordan', 7718800405691, 'Book_t', 3),
('Black Panther Comic', 'Stan Lee', 6692457568506, 'Book_t', 1),
('Rogue One', 'George Lucas', 9757089502679, 'Book_t', 0),
('Cracking the Coding Interview', 'Gayle G', 7079559901159, 'Book_t', 0);

INSERT INTO Transaction_t VALUES
('svbx3619jf', 'Ready Player One', 'W00875435', '5018-05-24', '5018-05-24'),
('mm52ti67mb', 'Saga Vol 1', 'W00123456', '5018-04-16', '5018-05-10'),
('mn91g4xhh3', 'Eye of the World', 'W00789654', '5018-05-3', '5018-05-18'),
('9hygaqbf5h', 'Black Panther Comic', 'W00678876', '5018-03-7', '5018-03-21'),
('7rtg3kqqeq', 'Rogue One', 'W00456321', '5018-03-12', '5018-03-24'),
('nz3uz3kicb', 'Cracking the Coding Interview', 'W00124567', '5018-05-7', '5018-05-22');

INSERT INTO Media_t VALUES
('Star Wars', 'Movie', 3),
('The Avengers', 'Movie', 0),
('Dark Side of the Moon', 'CD', 1),
('Entertainment', 'CD', 15),
('Scott Pilgrim vs The World', 'Movie', 0),
('After Laughter', 'CD', 7);

INSERT INTO Event_t VALUES
('Virtual Fractality', 1, 'Ava Poppas', '1-MARCH-5018', '1-APRIL-5018', 'poppasa@wit.edu', '1234567899'),
('Career Fair', 1, 'Co-op Office', '50-MARCH-5018', '21-MARCH-5018', 'coopoffice@wit.edu', '5034506578');


INSERT INTO Student_t VALUES
('W00875435', 'coynej', 'bubbles', 'coynej@wit.edu', 'Ready Player One', '5018-05-24', 'James Coyne'),
('W00123456', 'toubeaus', 'bread', 'toubeaus@wit.edu', 'Saga Vol 1', '5018-04-01', 'Shawnathan Toubeau'),
('W00789654', 'beaucagej', 'pizza', 'beaucagej@wit.edu', 'Eye of the World', '5018-05-03', 'Jeffrey Beaucage'),
('W00678876', 'seltenreichs', 'notEvil', 'seltenreichs@wit.edu', 'Black Panther Comic', '5019-03-23', 'Sophia Seltenreich'),
('W00456321', 'kylev', 'coastModern', 'kylev@wit.edu', 'Rogue One', '5019-03-13', 'Vicky Kyle'),
('W00124567', 'petersena', 'darkchocolate', 'petersena@wit.edu', 'Cracking the Coding Interview', '5018-05-21', 'Abigail Petersen');

INSERT INTO studyRoom_t VALUES
('1', 'W00875435', '3:00'),
('2', 'W00123456', '4:30'),
('3', 'W00789654', '7:45'),
('4', 'W00678876', '8:15'),
('5', 'W00456321', '1:15'),
('6', 'W00124567', '2:30');
-- End of inserts
