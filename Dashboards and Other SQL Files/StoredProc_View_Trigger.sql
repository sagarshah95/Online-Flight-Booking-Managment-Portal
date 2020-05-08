/* Stored Procedures */

/* Stored Procedure - 1 : To Identify Flights Operated by an Airline */
/*Command to CREATE uspAirlineCount Procedure*/
----------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE uspAirlineCount (
    @AirlineName VARCHAR(50),
    @countAirline INT OUTPUT
) AS
BEGIN
    SELECT
        FlightNumber,
        AirlineCode
    FROM
        FLIGHT_SEGMENT
    WHERE
        AirlineName = @AirlineName;
 
    SELECT @countAirline = @@ROWCOUNT;
END;

/*Execute uspAirlineCount Procedure*/
DECLARE @count INT;
EXEC uspAirlineCount
    @AirlineName = 'Virgin America',
    @countAirline = @count OUTPUT;
 
SELECT @count AS 'Number of Airlines found';

/* Drop Procedure */ 
DROP PROCEDURE uspAirlineCount;

----------------------------------------------------------------------------------------------------------------------
/* Stored Procedure - 2 : STORED PROCEDURE TO GET FLIGHT SCHEDULE */
CREATE PROC [dbo].[Flight_NUmber]
@FlightNumber			CHAR(6),
@OriginAirportCode		CHAR(3) OUT,
@DestinationAirportCode	CHAR(3) OUT,
@DepartureDateTime		DATETIME OUT
AS
BEGIN
	SELECT	@OriginAirportCode		=	OriginAirportCode,
			@DestinationAirportCode =	DestinationAirportCode,
			@DepartureDateTime		=	DepartureDateTime
	FROM	FLIGHT_SEGMENT
	WHERE	[FlightNumber]			=	@FlightNumber
END

DECLARE @F_OriginAirportCode		CHAR(3),
		@F_DestinationAirportCode	CHAR(3),
		@F_DepartureDateTime		DATETIME

EXEC	[dbo].[Flight_NUmber] 'N407UA', @F_OriginAirportCode OUT, @F_DestinationAirportCode OUT, @F_DepartureDateTime OUT
SELECT	@F_OriginAirportCode AS [Airport_Origin_Code] , @F_DestinationAirportCode AS [Destination_Airport_Code],
		@F_DepartureDateTime AS [Departure_Date_Time];

/* Drop Procedure */
DROP PROC [dbo].[Flight_NUmber]

----------------------------------------------------------------------------------------------------------------------
/* Stored Procedure - 3 : To Identify Number of Members of Each Category */
/*Command to CREATE uspMembershipCount Procedure*/
CREATE PROCEDURE uspMembershipCount (
    @MemberType VARCHAR(6),
    @MemberTypeCount INT OUTPUT
) AS
BEGIN
    SELECT
        PhoneNumber,
        EmailID,
        FreeMiles
    FROM
        MEMBERSHIP
    WHERE
        MemberType = @MemberType;
    SELECT @MemberTypeCount = @@ROWCOUNT;
END;

/*Command to EXECUTE uspMembershipCount Procedure*/
DECLARE @count INT;
EXEC uspMembershipCount
    @MemberType = 'Bronze',
    @MemberTypeCount = @count OUTPUT;
 
SELECT @count AS 'Number of Members Found';

/*Command to DROP uspAirlineCount Procedure*/
DROP PROCEDURE uspMembershipCount;

--------------------------------------------------------------------------------------------------------------------
/* CREATE VIEW - 1 */
CREATE VIEW [Approved_Payments] AS
SELECT FirstName,LastName,PaymentAmount
FROM PAYMENTS
WHERE PaymentStatusCode = 'APR'

SELECT * FROM [Approved_Payments]

--------------------------------------------------------------------------------------------------------------------
/* CREATE VIEW - 2 */
CREATE VIEW [Membership_Information] AS
SELECT FirstName,LastName,MemberType,FreeMiles
FROM PASSENGERS P,MEMBERSHIP M
WHERE P.Phonenumber = M.PhoneNumber AND MemberType in ('Silver', 'Gold') 

SELECT * FROM [Membership_Information]

/* CREATE VIEW - 3 */
CREATE VIEW [TravelClass] AS
SELECT P.PassengerID,FirstName,LastName,TravelClassCode
FROM PASSENGERS P, ITINERARY_RESERVATIONS IR
WHERE P.PassengerID = IR.PassengerID	 

SELECT * FROM [TravelClass]

/* Triggers */
--------------------------------------------------------------------------------------------------------------------
Drop Table LOGIN_SIGNUP_Backup;
/* Create Backup Table for LOGIN_SIGNUP_Backup */ 
CREATE TABLE LOGIN_SIGNUP_Backup
(
 PhoneNumber    CHAR(10)      NOT NULL,         /* Primary Key*/ 
 FirstName      VARCHAR(20)   NOT NULL,
 LastName       VARCHAR(20)   NOT NULL,
 EmailID        VARCHAR(50)   NOT NULL,     
 [Password]     VARCHAR(16)   NOT NULL,
 audit_activity VARCHAR(100),
 audit_time     DATETIME
);


/* Trigger - 1 : Sending an Email when a user Sign-ups on the portal */
---------------------------------------------------------------------------------------------------------------------
/* Drop Trigger */ 
DROP TRIGGER [LOGIN]; 

/* Creating a Trigger */
CREATE TRIGGER LOGIN
ON LOGIN_SIGNUP
FOR INSERT
AS
          declare @PhoneNumber CHAR(10);
          declare @FirstName VARCHAR(20);
          declare @LastName VARCHAR(20);
          declare @EmailID VARCHAR(50);
		  declare @Password VARCHAR(16);
          declare @activity varchar(100);
		  declare @emailBody varchar(1000);
		  declare @link nvarchar(100);
 
          select @PhoneNumber = s.PhoneNumber from inserted s;
          select @FirstName = s.FirstName from inserted s;
          select @LastName = s.LastName from inserted s;
		  select @EmailID = s.EmailID from inserted s;
          select @Password = s.Password from inserted s;
		  set @link = 'file:///C:/Users/shahs/OneDrive/Desktop/NEU_Fall19/NEU%20Docs/SEM_2/DMDD/Project%20Documents/dmdd_FE/dmdd_FE/index.html';
          set @activity = 'A user has signed up';
		  set @emailBody = 'Hi '+@FirstName+',
		  
		  Thankyou for creating an account with Jarvis Flight Booking Portal.
		  Click on the following link to go to the website to login/signup
		  '+@link+'
		  
		  
		  **************************************This is a system generated Email*************************************************';
 
          insert into dbo.LOGIN_SIGNUP_backup(PhoneNumber, FirstName, LastName, EmailID, [Password], audit_activity, audit_time)
                      values(@PhoneNumber, @FirstName, @LastName, @EmailID, @Password, @activity, current_timestamp)

		  EXEC msdb.dbo.sp_send_dbmail
          @profile_name = 'test_Mail',
          @recipients = @EmailID,
          @subject = 'Welcome to Jarvis Flight Booking Portal',
          @body = @emailBody
 
go


/* Stored Procedure to Insert Login Details */
DROP PROCEDURE dbo.signUpUserProc;  
GO  

/* Creating a Procedure */
CREATE PROC signUpUserProc
@PhoneNumber CHAR(20),
@FirstName   VARCHAR(20),
@LastName    VARCHAR(20),
@EmailID     VARCHAR(50),
@Password    VARCHAR(16)
AS
BEGIN
       INSERT INTO LOGIN_SIGNUP(PhoneNumber, FirstName, LastName, EmailID, [Password]) VALUES(@PhoneNumber, @FirstName, @LastName, @EmailID, @Password)
END
GO

/*  Trigger - 2 : Sending an Email when a user changes the personal details */
DROP TRIGGER updateDetails; 
--Create an update trigger and include an email alert------------
create trigger updateDetails on LOGIN_SIGNUP
for update
as
 
          DECLARE @PhoneNumber CHAR(10);
          DECLARE @FirstName   VARCHAR(20);
          DECLARE @LastName    VARCHAR(20);
          DECLARE @EmailID     VARCHAR(50);
		  DECLARE @Password    VARCHAR(16);
          DECLARE @activity    VARCHAR(100);
		  DECLARE @emailBody   VARCHAR(1000);
		  DECLARE @link        NVARCHAR(100);
		  DECLARE @subjectline NVARCHAR(100);

 
          SELECT @PhoneNumber = s.PhoneNumber FROM INSERTED s;
          SELECT @FirstName = s.FirstName FROM INSERTED s;
          SELECT @LastName = s.LastName FROM INSERTED s;
		  SELECT @EmailID = s.EmailID FROM INSERTED s;
          SELECT @Password = s.[Password] FROM INSERTED s;
 
          if update([Password])
                      set @activity = 'password updated'
					  set @subjectline = 'Password updated on Jarvis Flight Booking Portal'
					  
		  if update(FirstName)
                      set @activity = 'Updated user FirstName'
					  set @subjectline = 'FirstName updated on Jarvis Flight Booking Portal'
					 
          if update(LastName)
                      set @activity = 'Updated user LastName'
					  set @subjectline = 'LastName updated on Jarvis Flight Booking Portal'
					  
		  if update(PhoneNumber)
                      set @activity = 'Updated user PhoneNumber'
					  set @subjectline = 'PhoneNumber updated on Jarvis Flight Booking Portal'
					  
          insert into dbo.LOGIN_SIGNUP_backup(PhoneNumber, FirstName, LastName, EmailID, [Password], audit_activity, audit_time)
                      values(@PhoneNumber, @FirstName, @LastName, @EmailID, @Password, @activity, current_timestamp)
 
          EXEC msdb.dbo.sp_send_dbmail
          @profile_name = 'test_Mail',
          @recipients = @EmailID,
          @subject = 'Jarvis Flight Booking Portal Update',
          @body = @activity
 
go

----------------------------------------------------------------------------------------
---Insert value in LOGIN_SIGNUP Table---------------------------------------------------
signUpUserProc '999772990','Parin','Shah','parinshah0000@gmail.com','parin@0124'
----1

--------------------------------------------------------------------------------------
update LOGIN_SIGNUP set [Password]='AdvG@7i94' where PhoneNumber='997778995';
go
-----------update the FirstName name of the person with id 2 to David------------------
update LOGIN_SIGNUP set FirstName='Saagghy' where PhoneNumber='997778995';
go
-----------update the LastName name of the person with id 2 to David-------------------
update LOGIN_SIGNUP set LastName='ShahzUii' where PhoneNumber='999978995';
go
-----------update the PhoneNumber of the person with id 2 to David---------------------
update LOGIN_SIGNUP set PhoneNumber='857869459' where PhoneNumber='999978995';
go
---------------------------------------------------------------------------------------

select*from LOGIN_SIGNUP;
select*from LOGIN_SIGNUP_backup;
