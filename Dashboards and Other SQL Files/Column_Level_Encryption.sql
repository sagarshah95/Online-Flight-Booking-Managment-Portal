/*  Data Encryption */

/* Create a Database Master Key for column level SQL Server Encryption */
USE Airline_Reservation;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Project_Jarvis@1';

SELECT [NAME]           KeyName, 
       SYMMETRIC_KEY_ID KeyID,
	   KEY_LENGTH       KeyLength, 
       ALGORITHM_DESC   KeyAlgorithm
FROM   SYS.SYMMETRIC_KEYS;

/* Create a self-signed certificate for Column level SQL Server Encryption */
USE Airline_Reservation;
GO
CREATE CERTIFICATE Certificate_test WITH SUBJECT = 'Password Data Protection';

SELECT [NAME]                        CertName, 
       CERTIFICATE_ID                CertID, 
       PVT_KEY_ENCRYPTION_TYPE_DESC  EncryptType, 
       ISSUER_NAME                   Issuer
FROM   SYS.CERTIFICATES;

/* Configure a symmetric key for column level SQL Server encryption */
CREATE SYMMETRIC KEY SymKey_test WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE Certificate_test;

SELECT [NAME]           KeyName, 
       SYMMETRIC_KEY_ID KeyID,
	   KEY_LENGTH       KeyLength, 
       ALGORITHM_DESC   KeyAlgorithm
FROM   SYS.SYMMETRIC_KEYS;

/* Data Encryption */
USE Airline_Reservation;
GO
ALTER TABLE LOGIN_SIGNUP ADD Password_Encrypt VARBINARY(MAX)

OPEN SYMMETRIC KEY SymKey_test DECRYPTION BY CERTIFICATE Certificate_test;

UPDATE LOGIN_SIGNUP 
       SET Password_Encrypt = EncryptByKey (Key_GUID('SymKey_test'), [Password])
       FROM Airline_Reservation.dbo.LOGIN_SIGNUP;

CLOSE SYMMETRIC KEY SymKey_test;

-----------------------------------------------------------------------------------------------------
/* Decryption */

OPEN SYMMETRIC KEY SymKey_test
DECRYPTION BY CERTIFICATE Certificate_test;

SELECT [Password], Password_Encrypt,
CONVERT(VARCHAR, DecryptByKey(Password_Encrypt)) AS 'Decrypted_Password'
FROM Airline_Reservation.dbo.LOGIN_SIGNUP;

CLOSE SYMMETRIC KEY SymKey_test;