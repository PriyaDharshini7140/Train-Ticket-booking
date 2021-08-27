--user -- juhi

CREATE PROCEDURE SP_USER_INSERT
AS
BEGIN 
INSERT INTO TBL_USER(USER_ID,USERNAME,PASSWORD,SEC_QUESTION,SEC_ANSWER,FULL_NAME,DOB,MAIL_ID,GENDER,MOBILE_NO,DOOR_NO,STREET_NAME,CITY,PINCODE,CREATED_BY,MODIFIED_BY) VALUES(01,'SAM','SAM12','YOUR NICKNAME','SAM','SAMANTHA','03/03/2001','SAM@GMAIL.COM','FEMALE','9084533333','A/27','PARK CLUB STREET','CHENNAI','605565','SAM','SAM');
END;

----list of users----
CREATE PROCEDURE SP_USER_DETAILS
AS
BEGIN
SELECT * FROM TBL_USER;
END;
EXECUTE SP_USER_DETAILS;

------insert tbl_user----------
CREATE PROCEDURE SP_INSERT_USER_DETAILS
@USER_ID INT,
@USERNAME VARCHAR(20),
@PASSWORD VARCHAR(20),
@SEC_QUESTION VARCHAR(20),
@SEC_ANSWER VARCHAR(20),
@FULL_NAME VARCHAR(20),
@DOB DATE,
@MAIL_ID VARCHAR(20),
@GENDER VARCHAR(20),
@MOBILE_NO VARCHAR(20),
@DOOR_NO VARCHAR(20),
@STREET_NAME VARCHAR(20),
@CITY VARCHAR(20),
@PINCODE VARCHAR(20),
@CREATED_BY VARCHAR(20),
@MODIFIED_BY VARCHAR(20)
AS
BEGIN
INSERT INTO TBL_USER (USER_ID,USERNAME,PASSWORD,
SEC_QUESTION,SEC_ANSWER,FULL_NAME,DOB,MAIL_ID,GENDER,MOBILE_NO,DOOR_NO,STREET_NAME,CITY,PINCODE,CREATED_BY,MODIFIED_BY) 
VALUES (
		    @USER_ID,
			@USERNAME ,
			@PASSWORD ,
			@SEC_QUESTION ,
			@SEC_ANSWER ,
			@FULL_NAME ,
			@DOB ,
			@MAIL_ID ,
			@GENDER ,
			@MOBILE_NO ,
			@DOOR_NO ,
			@STREET_NAME ,
			@CITY ,
			@PINCODE ,
			@CREATED_BY ,
			@MODIFIED_BY )
END;
EXECUTE SP_INSERT_USER_DETAILS
            @USER_ID = 02,
			@USERNAME ='RAM',
			@PASSWORD ='RAM123',
			@SEC_QUESTION = 'nick name' ,
			@SEC_ANSWER ='ram2',
			@FULL_NAME ='RAMKRISH' ,
			@DOB = '2021/01/21' ,
			@MAIL_ID  = 'RAM@GMAIL.COM',
			@GENDER = 'MALE' ,
			@MOBILE_NO  = '9876512345',
			@DOOR_NO = 'A13',
			@STREET_NAME ='ABS ROOD' ,
			@CITY ='CHENNAI',
			@PINCODE = '678987',
			@CREATED_BY ='ram',
			@MODIFIED_BY ='ram'


------DELETE USER DETAILS------------------
CREATE PROCEDURE SP_DELETE_USER_DETAILS
@USER_ID INT
AS
BEGIN
DELETE FROM TBL_USER WHERE USER_ID= @USER_ID
END;
EXECUTE SP_DELETE_USER_DETAILS
@USER_ID =02

--------------------UPDATE USER DETAILS-------------------------------
CREATE PROCEDURE SP_UPDATE_USER_DETAILS
(@USER_ID INT,
@USERNAME VARCHAR(20),
@PASSWORD VARCHAR(20),
@SEC_QUESTION VARCHAR(20),
@SEC_ANSWER VARCHAR(20),
@FULL_NAME VARCHAR(20),
@DOB DATE,
@MAIL_ID VARCHAR(20),
@GENDER VARCHAR(20),
@MOBILE_NO VARCHAR(20),
@DOOR_NO VARCHAR(20),
@STREET_NAME VARCHAR(20),
@CITY VARCHAR(20),
@PINCODE VARCHAR(20),
@MODIFIED_BY VARCHAR(20)
)
AS
BEGIN
UPDATE TBL_USER
SET     USERNAME = @USERNAME,
		PASSWORD = @PASSWORD,
		SEC_QUESTION = @SEC_QUESTION,
		SEC_ANSWER = @SEC_ANSWER ,
		FULL_NAME = @FULL_NAME,
		DOB = @DOB ,
		MAIL_ID = @MAIL_ID ,
		GENDER = @GENDER,
		MOBILE_NO = @MOBILE_NO,
		DOOR_NO = @DOOR_NO,
		STREET_NAME = @STREET_NAME,
		CITY = @CITY,
		PINCODE = @PINCODE,
		MODIFIED_BY = @MODIFIED_BY
WHERE USER_ID = @USER_ID
END;

EXECUTE SP_UPDATE_USER_DETAILS
            @USER_ID = 02,
			@USERNAME ='RAM',
			@PASSWORD ='RAM123',
			@SEC_QUESTION = 'nick name' ,
			@SEC_ANSWER ='ram2',
			@FULL_NAME ='RAMKRISH KUMAR',
			@DOB = '2021/01/21',
			@MAIL_ID  = 'RAM@GMAIL.COM',
			@GENDER = 'MALE' ,
			@MOBILE_NO  = '9876512345',
			@DOOR_NO = 'A13',
			@STREET_NAME ='ABS ROOD' ,
			@CITY ='CHENNAI',
			@PINCODE = '678987',
			@MODIFIED_BY ='ram'
		----------------------SELECT-----------
	CREATE PROCEDURE SP_SELECT_USER_DETAILS
		@USER_ID INT
		AS
		BEGIN
		SELECT * FROM TBL_USER WHERE USER_ID = @USER_ID 
		END;
EXECUTE SP_SELECT_USER_DETAILS
@USER_ID = 02

--train --dinesh
* stored procedure insert,update*/
create PROCEDURE SP_TRAIN_DETAILS	     
										    (@TRAIN_ID INT,
											@TRAIN_NAME VARCHAR(50),
                                            @ORGIN_ID INT,
											@DESTINATION_ID INT,
											@ARRIVAL_TIME DATETIME,
											@DEPARTURE_TIME DATETIME ,
											@JOURNEY_CLASS VARCHAR(40) ,
											@STATEMENTTYPE NVARCHAR(20) = '')
AS
  BEGIN
      IF @STATEMENTTYPE = 'Insert'
        BEGIN
            INSERT INTO TRAIN_DETAILS
									(TRAIN_ID ,
									TRAIN_NAME,
                                     ORGIN_ID,
									 DESTINATION_ID ,
									 ARRIVAL_TIME ,
									 DEPARTURE_TIME  ,
									 JOURNEY_CLASS)

            VALUES				(@TRAIN_ID ,
								@TRAIN_NAME,
                                 @ORGIN_ID,
								@DESTINATION_ID ,
								@ARRIVAL_TIME ,
								@DEPARTURE_TIME  ,
								@JOURNEY_CLASS)
        END
		IF @STATEMENTTYPE= 'Update'
        BEGIN
            UPDATE TRAIN_DETAILS
           
		   SET     TRAIN_NAME=@TRAIN_NAME,
                   ORGIN_ID=@ORGIN_ID,
				   DESTINATION_ID=@DESTINATION_ID ,
				   ARRIVAL_TIME=@ARRIVAL_TIME ,
				   DEPARTURE_TIME=@DEPARTURE_TIME  ,
				   JOURNEY_CLASS=@JOURNEY_CLASS 
            WHERE  TRAIN_ID = @TRAIN_ID
        END
END

/*exec of insert*/
exec SP_TRAIN_DETAILS 1,'EXPRESS','101','102','2021/09/02','2021/09/01','SLEEPER','Insert';

exec SP_TRAIN_DETAILS 2,'ROYALEXPRESS','102','103','2021/10/08','2021/10/07','AC','Insert';

exec SP_TRAIN_DETAILS 3,'CHENNAIEXPRESS','103','101','2021/11/02','2021/11/01','SLEEPER','Insert';

/*exec of UPDATE*/
exec SP_TRAIN_DETAILS 3,'CHENNAIEXPRESS','104','105','2021/11/06','2021/11/05','AC','UPDATE';

exec SP_TRAIN_DETAILS 2,'EXPRESS01','102','104','2021/10/09','2021/10/08','SLEEPER','UPDATE';

/* SP select */
create procedure sp_train_details_select
as
        BEGIN
           select * from Train_details; 
        END

/*exec of SELECT*/

exec sp_train_details_select

/* SP DELETE*/
create procedure sp_train_details_delete
@train_id int
as
        BEGIN
           delete from train_details where train_id=@train_id; 
        END

/*exec of DELETE*/

exec sp_train_details_DELETE 2; 

exec sp_train_details_DELETE 1; 

/* SP select */
create procedure sp_train_details_select
as
        BEGIN
           select * from Train_details; 
        END

/*exec of SELECT*/

exec sp_train_details_select 







--booking table storedprocedure --- priyadharshini
create procedure sp_booking_insert 
@booking_id int,
@u_id int,
@train_id int,
@payment_id int,
@passenger_count int,
@totalamount int,
@seat_count int,
@pnr_no int,
@CreatedBy varchar(20),
@modifiedBy varchar(20),
@statement varchar(20)
AS
BEGIN
IF @statement='INSERT'
	BEGIN
	insert into Booking(booking_id,u_id,train_id,payment_id,passenger_count,totalamount,seat_count,pnr_no,CreatedBy,modifiedBy) 
values(@booking_id,@u_id,@train_id,@payment_id,@passenger_count,@totalamount,@seat_count,@pnr_no,@CreatedBy,@modifiedBy)
	END;


create procedure sp_booking_update 
@booking_id int,
@passenger_count int,
@totalamount int,
@seat_count int,
@modifiedBy varchar(20),
@statement varchar(20)
AS
BEGIN
IF @statement='UPDATE'
	BEGIN
	UPDATE Booking SET passenger_count =@passenger_count,totalamount=@totalamount,seat_count=@seat_count,modifiedBy=@modifiedBy WHERE booking_id = @booking_id;
	END;

END


create procedure sp_booking_delete 
@booking_id int,
@passenger_count int,
@totalamount int,
@seat_count int,
@modifiedBy varchar(20),
@statement varchar(20)
AS
BEGIN
IF @statement='DELETE'
	BEGIN
	DELETE FROM Booking WHERE booking_id = @booking_id;
	END;

END



create procedure sp_booking_Read
@booking_id int,
@statement varchar(20)
AS
BEGIN
IF @statement='SELECT'
	BEGIN
	SELECT * FROM Booking WHERE booking_id=@booking_id
	END;

END


create procedure sp_booking_list
@booking_id int,
@u_id int,
@statement varchar(20)
AS
BEGIN
IF @statement='SELECT'
	BEGIN
	SELECT * FROM Booking WHERE u_id=@u_id
	END;

END




--passenger--afreen


CREATE PROCEDURE [dbo].[PASS_STORE]
(
@PASS_ID INT,
@NAME varchar(20),
@AGE INT,
@GENDER VARCHAR(20),
@BERTH varchar(20),
@CITIZEN VARCHAR(3),
@NATION VARCHAR(20),
@ID_CARD VARCHAR(20),
@ID_NO  VARCHAR(20),
@statement varchar(20)='')

AS
BEGIN
IF @statement='INSERT'
	BEGIN
	INSERT INTO PASSENGER(PASS_ID,PASS_NAME,AGE,GENDER,BERTH,SENIOR_CITIZEN,NATIONALITY,ID_CARD,ID_NO)
	VALUES(@PASS_ID,@NAME,@AGE,@GENDER,@BERTH,@CITIZEN,@NATION,@ID_CARD,@ID_NO);
	END
ELSE IF @statement='LIST'
	BEGIN
	SELECT * FROM PASSENGER
	END
ELSE IF @statement='UPDATE'
	BEGIN
	UPDATE PASSENGER SET BERTH=@BERTH WHERE PASS_ID=@PASS_ID
	END
END; 


CREATE PROCEDURE PASS_DEL_SEL
(
@PASS_ID INT,
@STATEMENT VARCHAR(10)='')
AS
BEGIN
IF @STATEMENT='DELETE'
	BEGIN
	DELETE FROM PASSENGER WHERE PASS_ID=@PASS_ID
	END
ELSE IF @STATEMENT='SELECT'
	BEGIN
	SELECT * FROM PASSENGER WHERE PASS_ID=@PASS_ID
	END
END;

EXEC PASS_STORE 1002,'HASAN ALI',20,'MALE','LOWER','NO','INDIAN','AADHAR','1EERDF','INSERT'
EXEC PASS_DEL_SEL 1001,'DELETE'
SELECT * FROM PASSENGER


--payment --divya

CREATE PROCEDURE PAY_CRUD 
(@payment_ID int, 
@USERID int, 
@bookingID int,
@amount int,
@mode varchar(30),
@status varchar(40),
@CreatedBy varchar(40),
@StatementType NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO payment_details (payment_ID,userID,bookingID,amount,mode,status,CreatedBy)values(@payment_ID,@userID,@bookingID,@amount,@mode,@status,@CreatedBy)
        END
      ELSE IF @StatementType = 'Update'
        BEGIN
            UPDATE payment_details set USERID=@USERID,bookingID=@bookingID,amount=@amount,mode=@mode,status=@status ,CreatedBy=@CreatedBy where payment_ID=@payment_ID;
        END
END       
---UPDATE  u_id int FOREIGN KEY(u_id) REFERENCES user_table(id),

DROP PROCEDURE PAY_CRUD

EXEC PAY_CRUD 40,7,8,500,'CreditCard','Success','DIVYA','Insert'

EXEC PAY_CRUD 1,10,20,4500,'DebitCard','Success','Veena','Update'

CREATE PROCEDURE CRUD_SELECT
AS
	BEGIN
		SELECT * FROM  payment_details
END

EXEC CRUD_SELECT


--freight--sandhya

CREATE PROCEDURE sp_irctc_freight_select_delete 	     (@b_id int,
@StatementType NVARCHAR(20) = '')
AS
  BEGIN

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   irctc_freight where b_id = @b_id;
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM irctc_freight WHERE  b_id = @b_id
        END
  END

CREATE PROCEDURE sp_irctc_freight_insert_update	     (@b_id int,
@user_id int, 
@freight_name varchar(50),
@freight_type varchar(20),
@from_place varchar(50),
@to_place varchar(50),
@departure varchar(50),
@StatementType NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO irctc_freight
                        (b_id,user_id, 
freight_name,
freight_type,
from_place,
to_place,
departure)
            VALUES     ( @b_id,
                         @user_id,
                         @freight_name,
                         @freight_type,
                         @from_place,
						 @to_place,
						 @departure)
        END

      ELSE IF @StatementType = 'Update'
        BEGIN
            UPDATE irctc_freight
            SET    b_id =@b_id,
user_id=@user_id, 
freight_name=@freight_name,
freight_type=@freight_type,
from_place=@from_place,
to_place=@to_place,
departure=@departure
            WHERE  b_id = @b_id
        END
  END

execute sp_irctc_freight_select_delete 100,'select';

execute sp_irctc_freight_insert_update 104,1004,'vehicles','solid','chennai','chennai','morning','insert';

CREATE PROCEDURE sp_irctc_freight_selectlist
AS
  BEGIN
            SELECT *
            FROM   irctc_freight;
        END
--contact us  --thirupurasundhari

/*update*/
CREATE PROCEDURE update_contact 
@contact_id int, 
@status varchar(50)
AS
BEGIN
UPDATE tbl_contact1 SET status= @status WHERE contact_id = @contact_id ;
END;
execute dbo.update_contact 101,'pending'

select * from tbl_contact1

/*insert*/
CREATE PROCEDURE insert_contact
@contact_id int,
@user_Name varchar(50),
@mob_no  varchar(10),
@email_id varchar(100),
@contact_message varchar(200),
@modified_by varchar(50)
AS
BEGIN
INSERT INTO [dbo].[tbl_contact1] ([contact_id],[user_Name],[mob_no],[email_id],[contact_message],[modified_by])
     VALUES (@contact_id ,@user_Name ,@mob_no ,@email_id , @contact_message ,  @modified_by )
END;
 execute dbo.insert_contact 103,'kalai','9867452325','kalai@gmail.com','i need a steps to book ticket in irctc','priya';

 /*select*/
 create procedure select_contact
 @contact_id int
 as
 begin
 select * from  tbl_contact1 where contact_id =  @contact_id
 end
 execute dbo.select_contact 102

 /*list*/
 create procedure list_contact
 as
 begin
 select * from  tbl_contact1 
 end
 execute dbo.list_contact 
