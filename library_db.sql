-- SQL STATEMENTS
-- students table
CREATE TABLE Public.Students (
	student_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255) NOT NULL,
	contact integer UNIQUE ,
	address varchar (255),
	date_of_borrowing date,
	date_of_return date
)

-- company table
CREATE TABLE Public.Company (
	company_id bigserial NOT NULL PRIMARY KEY,
	name varchar NOT NULL 
)

--shift table
CREATE TABLE Public.Shift (
	shift_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255) NOT NULL,
	start time without time zone NOT NULL,
	"end" time without time zone NOT NULL 
)

--librarians table 
CREATE TABLE Public.Librarians (
	librarian_id bigserial NOT NULL PRIMARY KEY,
	name varchar (255) NOT NULL,
	email varchar (255) NOT NULL UNIQUE,
	telephone_no bigint NOT NULL UNIQUE,
	shift_id bigserial NOT NULL ,
	FOREIGN KEY (shift_id) REFERENCES Shift(shift_id)
)

--authors table
CREATE TABLE Public.Authors (
	authors_id bigserial NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	author_contact bigint NOT NULL UNIQUE ,
	author_email varchar (255) NOT NULL UNIQUE,
	bio varchar (255) NOT NULL,
	company_id bigserial,
	FOREIGN KEY (company_id) REFERENCES Company(company_id)
)

--books table
CREATE TABLE Public.Books (
	book_id bigserial NOT NULL PRIMARY KEY,
	title character varying(255)  NOT NULL UNIQUE ,
    description character varying(255) ,
    publish_date date NOT NULL,
    publish_year date NOT NULL,
    "ISBN_no" bigint NOT NULL,
    price integer NOT NULL,
    image bytea NOT NULL,
    authors_id bigint NOT NULL ,
    student_id bigint NOT NULL ,
	FOREIGN KEY (authors_id) REFERENCES Authors(authors_id),
	FOREIGN KEY (student_id) REFERENCES Students(student_id)
)

-- insert relevant data into tables

INSERT INTO public."Authors" ( "name","author_email","author_contact","bio","company_id")
VALUES ('Andrea Gibson','andrea@gmail.com','+2345646434','MarriedAdult','1'),
	   ('Neil Gilbert','gilbert@mail.com','+2854857549','MarriedAdult','2'),
	   ('Button Speke','buttons@yahoo.com','+2939857445','MarriedAdult','2'),
	   ('Jared Sniger','sniger23@gmail.com','+2868796045','MarriedAdult','3');

INSERT INTO public."Company" ("name")
VALUES ('Peregrins.co'),
		('Edwards publishers.co'),
		('Europe publishing company');

INSERT INTO public."Shift" ("name","start","end")
VALUES ('morning','8:00','1:00'),
		('morning','8:00','1:00'),
		('evening','2:00','6:00'),
		('evening','2:00','6:00');

INSERT INTO public."Librarians" ("name","email","telephone_no","shift_id")
VALUES ('Kisha Adams','kisha@mail.com','075894','1'),
		('Debby Zoey','debby@yahoo.com','073463','2'),
		('Harry Styles','harrys@gmail.com','072345','1');

INSERT INTO public."Students" ("name","contact","address","date_of_borrowing","date_of_return")
VALUES ('Shellah','067484','Ntinda','22/06/2002','30/07/2002'),
		('Anita','078695','Bukoto','27/07/2020','30/09/2020'),
		('Debby','068709','Kibuli','21/08/2022','30/09/2022');

INSERT INTO public."Books" ("title","description","publish_date","ISBN_no","price","author_id","student_id")
VALUES ('House of Sixty fathers','Drama','24/01/1990','98745','40000','2','2'),
	('Fall into temptation','RomanticComedy','24/01/1990','76849','40000','1','3'),
	('Charted','Sci-fi','17/04/1880','456789','23000','3','1');
	
--select statements

SELECT  name FROM "Authors";

SELECT name FROM "Librarians" WHERE shift_id='1'; 
SELECT name FROM "Librarians" WHERE shift_id='2';

SELECT name FROM "Students" WHERE date_of_return= NULL;

SELECT name,company_id FROM "Authors";










