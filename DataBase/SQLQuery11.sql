--user--juhi
CREATE TABLE TBL_USER(USER_ID INT PRIMARY KEY,
USERNAME VARCHAR(50)NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
SEC_QUESTION VARCHAR(50) NOT NULL ,
SEC_ANSWER VARCHAR(50) NOT NULL,
FULL_NAME VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
MAIL_ID VARCHAR(100)NOT NULL,
GENDER VARCHAR(10)NOT NULL,
MOBILE_NO VARCHAR(10) NOT NULL,
DOOR_NO VARCHAR(20)NOT NULL,
STREET_NAME VARCHAR(40)NOT NULL,
CITY VARCHAR(30)NOT NULL,
PINCODE VARCHAR(10)NOT NULL,
CREATED_BY VARCHAR(20)NOT NULL,
CREATED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
MODIFIED_BY VARCHAR(20)NOT NULL,
MODIFIED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
RECORDSTATUS BIT DEFAULT 1,
ROWGUID VARCHAR(MAX) DEFAULT NEWID());

DROP TABLE TBL_TRAIN_DETAILS;
--trainmaster--dinesh
SELECT * FROM TBL_TRAIN_DETAILS
CREATE TABLE TBL_TRAIN_DETAILS (TRAIN_ID INT CONSTRAINT TRAIN_PK PRIMARY KEY,
TRAIN_NAME VARCHAR(20) NOT NULL,
ORGIN INT FOREIGN KEY(ORGIN) REFERENCES PLACE(place_id),
DESTINATION INT FOREIGN KEY(DESTINATION) REFERENCES PLACE(place_id),
ARRIVAL_TIME DATETIME NOT NULL,
DEPARTURE_TIME DATETIME NOT NULL,JOURNEY_CLASS VARCHAR(40) NOT NULL,
CREATED_BY VARCHAR(50) NOT NULL,
CREATED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
MODIFIED_BY VARCHAR(50) NOT NULL,MODIFIED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
RECORD_STATUS BIT DEFAULT 1,
ROWGUID VARCHAR(MAX) DEFAULT NEWID());
INSERT INTO TBL_TRAIN_DETAILS(TRAIN_ID,TRAIN_NAME,ORGIN,DESTINATION,ARRIVAL_TIME,DEPARTURE_TIME,JOURNEY_CLASS,CREATED_BY,MODIFIED_BY)
VALUES(1,'EXPRESS',101,102,'2021/10/12','2021/10/23','SLEEPER','ADMIN','ADMIN')
--booking--priyadasrhini

create table Booking(booking_id int primary key,
u_id int FOREIGN KEY(u_id) REFERENCES TBL_USER(USER_ID),
train_id int FOREIGN KEY(train_id) REFERENCES TBL_TRAIN_DETAILS(TRAIN_ID),
payment_id int FOREIGN KEY(payment_id) REFERENCES Tbl_payments_detail(payment_ID),
passenger_count int not null,
totalamount int not null,
seat_count int not null,
pnr_no varchar(20) not null,
booking_status varchar(10) not null,
booking_date datetime not null default getdate(),
CreatedBy varchar(20) not null,
CreatedDate datetime not null default getdate(),
modifiedBy varchar(20) not null,
modifiedDate datetime not null default getdate(),
RecordStatus Bit default 1,
RowGuid varchar(Max) default newid())

select * from Booking
--passenger--afreen

CREATE TABLE PASSENGER(PASSENGER_ID INT PRIMARY KEY,u_id int FOREIGN KEY(u_id) REFERENCES TBL_USER(USER_ID),NAME VARCHAR(20),AGE INT,GENDER VARCHAR(20),BERTH VARCHAR(20),CITIZEN BIT,NATION VARCHAR(20),ID_CARD VARCHAR(20),ID_NO VARCHAR(20) UNIQUE,CreatedBy varchar(20) not null,
CreatedDate datetime not null,
modifiedBy varchar(20) not null,
modifiedDate datetime not null,
RecordStatus Bit,
RowGuid varchar(Max) default newid());

--payment--divya

create table Tbl_payments_detail(payment_ID int not null primary key,
userID int,foreign key(userID) references TBL_USER(USER_ID),
bookingID int,
foreign key(bookingID) references booking(booking_id),
amount int not null,
mode varchar(50) not null,
status varchar(20) not null,
CreatedBy varchar(50) not null,
CreatedDate datetime not null default getdate(),
ModifiedBy varchar(50) not null,
ModifiedDate datetime not null default getdate(),
RecordStatus bit default 1,
RowGUID varchar(max) default newid());

--freight--sandhya

create table tbl_irctc_freight(b_id int not null primary key,
u_id int FOREIGN KEY(u_id) REFERENCES TBL_USER(USER_ID), 
freight_name varchar(50) not null,
freight_type varchar(20) not null,
from_place  varchar(50) not null,
to_place varchar(50) not null,
departure varchar(50)not null,
createdBy varchar(50) not null default 'Sandhya',
createdDate datetime not null default getDate(),
modifiedBy varchar(50) not null default 'Sandhya',
modifiedDate datetime not null default getDate(),
RecordStatus bit default 1,
RowGUID varchar(max) default newid());

--contact us-thirupurasundhari
create table tbl_contact ( contact_id int primary key, 
contact_date datetime default format(getdate(), 'yyyy/mm/dd'),
user_Name varchar(50) not null,
mob_no  varchar(10) not null,
email_id varchar(50) not null, 
contact_message varchar(100) not null,
created_by varchar(50) not null,
created_date datetime not null default format(getdate(),'yyyy/mm/dd'),
modified_by varchar(50) not null,
modified_date datetime not null default format(getdate(),'yyyy/mm/dd'),
recordstatus bit default 1,
rowguid varchar(max) default newid() )

--location table--sandhya

create table place(place_id int primary key,place_name varchar(20) not null unique,createdBy varchar(50) not null default 'Sandhya',
createdDate datetime not null default getDate(),
modifiedBy varchar(50) not null default 'Sandhya',
modifiedDate datetime not null default getDate(),
RecordStatus bit default 1,
RowGUID varchar(max) default newid())
