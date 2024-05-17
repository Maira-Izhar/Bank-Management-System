CREATE DATABASE [DB Project]
USE [DB Project]

--=================================================================
-- CREATE TABLE QUERIES
--=================================================================

CREATE TABLE Signup (
    RequestID INT IDENTITY(1,1),
    FullName VARCHAR(255) NOT NULL,
    CNIC char(13) UNIQUE,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(255) NOT NULL,
    AccountType VARCHAR(50) CHECK (AccountType IN ('Savings', 'Checking')),
	ReqStatus BIT DEFAULT 0,
);
CREATE TABLE ADMINS (
	UserID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(255) NOT NULL,
    CNIC char(13) UNIQUE,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(255) NOT NULL,
)
GO
CREATE TABLE Accounts (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(255) NOT NULL,
    CNIC char(13) UNIQUE,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(255) NOT NULL,
    AccountType VARCHAR(50),

    Balance DECIMAL(10,2) DEFAULT 0,
		AccountStatus BIT DEFAULT 1,
	Heirs INT DEFAULT 0,
);
GO
CREATE TABLE Complaints (
    ComplainID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    Complain TEXT,
    FOREIGN KEY (UserID) REFERENCES Accounts(UserID)
);
GO
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    AmountRequested DECIMAL(10,2),
    Date DATE,
    FOREIGN KEY (UserID) REFERENCES Accounts(UserID)
);
GO
CREATE TABLE Cards (
    CardID INT PRIMARY KEY IDENTITY(1,1),
    CardType VARCHAR(50),
    UserID INT,
    CreditLimit DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES Accounts(UserID)
);
GO
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT,
    ReceiverID INT,
    Amount DECIMAL(10,2),
    Date DATETIME,
    FOREIGN KEY (SenderID) REFERENCES Accounts(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Accounts(UserID)
);
GO
CREATE TABLE Bills (
    BillID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    Date DATE,
    TransactionAmount DECIMAL(10,2),
	ReceiverID INT,
    FOREIGN KEY (UserID) REFERENCES Accounts(UserID),
	FOREIGN KEY (ReceiverID) REFERENCES Accounts(UserID)

);
GO
CREATE TABLE Heirs (
    UserID INT,
    Relation VARCHAR(50),
    HeirName VARCHAR(255),
    HeirCNIC VARCHAR(20),
    PRIMARY KEY (UserID, Relation),
    FOREIGN KEY (UserID) REFERENCES Accounts(UserID)
);
GO

--=================================================================
-- INSERT QUERIES
--=================================================================
INSERT INTO ADMINS (FullName, CNIC, Username, Password) VALUES ('Aashir Adnan', '67531234567', 'AashirA', '123456');
INSERT INTO ADMINS (FullName, CNIC, Username, Password) VALUES ('Ahmad Raza', '67001234567', 'AhmadA', '123456');
INSERT INTO ADMINS (FullName, CNIC, Username, Password) VALUES ('Maira Izhar', '66261234567', 'MairaI', '123456');


INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('John Doe', '1234567890123', 'johndoe123', 'password123', 'Savings');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Jane Smith', '9876543210987', 'janesmith', 'pass456', 'Checking');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Michael Johnson', '4567890123456', 'michaelj', 'mikepass', 'Savings');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Emily Davis', '8765432109876', 'emilyd', 'emilypass', 'Checking');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('David Wilson', '6543210987654', 'davidw', 'pass789', 'Savings');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Sarah Brown', '7654321098765', 'sarahb', 'sarahpass', 'Checking');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('James Miller', '5432109876543', 'jamesm', 'pass456', 'Savings');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Emma Garcia', '6789012345678', 'emmag', 'emmapass', 'Checking');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Daniel Martinez', '4321098765432', 'danm', 'pass789', 'Savings');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Olivia Lee', '8901234567890', 'olivial', 'oliviapass', 'Checking');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('William Rodriguez', '3210987654321', 'williamr', 'pass123', 'Savings');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Ava Martinez', '9012345678901', 'avam', 'avapass', 'Checking');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Liam Hernandez', '2109876543210', 'liamh', 'pass456', 'Savings');
INSERT INTO Signup (FullName, CNIC, Username, Password, AccountType) VALUES ('Sophia Nguyen', '0123456789012', 'sophian', 'sophiapass', 'Checking');


INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Alice Johnson', '1000000000001', 'alicej', 'pass123', 'Savings');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Bob Smith', '2000000000002', 'bobsmith', 'bobby123', 'Checking');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Emily Davis', '3000000000003', 'emilyd', 'password456', 'Savings');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('James Wilson', '4000000000004', 'jamesw', 'jw1234', 'Checking');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Olivia Martinez', '5000000000005', 'oliviam', 'securepass', 'Savings');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('William Brown', '6000000000006', 'williamb', 'brownie123', 'Checking');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Sophia Anderson', '7000000000007', 'sophiaa', 'passphrase', 'Savings');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Liam Thomas', '8000000000008', 'liamt', 'thomas123', 'Checking');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Ava White', '9000000000009', 'avaw', 'avawhite', 'Savings');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Noah Harris', '1000000000010', 'noahh', 'noah123', 'Checking');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Isabella Martin', '1100000000011', 'isabellam', 'pass123', 'Savings');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Mia Lee', '1200000000012', 'mial', 'lee123', 'Checking');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Ethan Garcia', '1300000000013', 'ethang', 'garciapass', 'Savings');
INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES ('Amelia Rodriguez', '1400000000014', 'ameliar', 'password123', 'Checking');


INSERT INTO Complaints (UserID, Complain) VALUES (1, 'Account statement not received.');
INSERT INTO Complaints (UserID, Complain) VALUES (2, 'Unauthorized transaction detected.');
INSERT INTO Complaints (UserID, Complain) VALUES (3, 'Card not working at ATMs.');
INSERT INTO Complaints (UserID, Complain) VALUES (4, 'Delayed processing of transactions.');
INSERT INTO Complaints (UserID, Complain) VALUES (5, 'Incorrect balance displayed in mobile app.');
INSERT INTO Complaints (UserID, Complain) VALUES (6, 'Unable to login to online banking.');
INSERT INTO Complaints (UserID, Complain) VALUES (7, 'Credit card charged incorrectly.');
INSERT INTO Complaints (UserID, Complain) VALUES (8, 'ATM dispensed incorrect amount.');
INSERT INTO Complaints (UserID, Complain) VALUES (9, 'Transaction not showing in transaction history.');

INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (1, 5000.00, '2024-04-01');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (3, 7000.00, '2024-04-03');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (7, 10000.00, '2024-04-05');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (9, 3000.00, '2024-04-07');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (12, 8000.00, '2024-04-09');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (15, 12000.00, '2024-04-11');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (17, 6000.00, '2024-04-13');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (19, 15000.00, '2024-04-15');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (2, 4000.00, '2024-04-02');
INSERT INTO Loans (UserID, AmountRequested, Date) VALUES (6, 9000.00, '2024-04-04');

INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Credit', 1, 10000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Debit', 2, 5000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Credit', 3, 15000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Debit', 4, 8000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Credit', 5, 12000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Debit', 6, 10000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Credit', 7, 20000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Debit', 8, 6000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Credit', 9, 18000.00);
INSERT INTO Cards (CardType, UserID, CreditLimit) VALUES ('Debit', 10, 3000.00);

INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (1, 2, 1000.00, '2024-04-01 08:30:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (3, 4, 500.00, '2024-04-02 12:45:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (5, 6, 2000.00, '2024-04-03 15:20:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (7, 8, 1500.00, '2024-04-04 10:10:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (9, 10, 300.00, '2024-04-05 11:55:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (11, 12, 100.00, '2024-04-06 14:30:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (13, 14, 5000.00, '2024-04-07 09:45:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (15, 16, 800.00, '2024-04-08 16:25:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (17, 18, 2000.00, '2024-04-09 13:15:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (19, 20, 150.00, '2024-04-10 17:00:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (1, 3, 500.00, '2024-04-11 09:30:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (1, 2, 1000.00, '2024-04-12 11:45:00');
INSERT INTO Transactions (SenderID, ReceiverID, Amount, Date) VALUES (1, 3, 1500.00, '2024-04-13 14:20:00');

INSERT INTO Bills (UserID, Date, TransactionAmount, ReceiverID) VALUES (1, '2024-04-01', 150.00, 2);
INSERT INTO Bills (UserID, Date, TransactionAmount, ReceiverID) VALUES (1, '2024-04-02', 200.00, 4);
INSERT INTO Bills (UserID, Date, TransactionAmount, ReceiverID) VALUES (3, '2024-04-03', 100.00, 5);
INSERT INTO Bills (UserID, Date, TransactionAmount, ReceiverID) VALUES (4, '2024-04-04', 250.00, 5);
INSERT INTO Bills (UserID, Date, TransactionAmount, ReceiverID) VALUES (5, '2024-04-05', 180.00, 1);


INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (1, 'Spouse', 'Kareem Abdul Jabbar', '1111111110111');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (2, 'Child', 'Bob Smith Jr.', '2222222220222');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (3, 'Spouse', 'Kobe Bryant', '3333333330333');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (4, 'Child', 'James Wilson Jr.', '4444444440444');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (5, 'Spouse', 'Steph Curry', '5555555550555');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (6, 'Child', 'William Brown Jr.', '6666666660666');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (7, 'Spouse', 'Ahmed Raza', '7777777770777');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (8, 'Father', 'Liam Thomas Sr.', '8888888880888');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (9, 'Spouse', 'Mohsin Ali', '9999999990999');
INSERT INTO Heirs (UserID, Relation, HeirName, HeirCNIC) VALUES (10, 'Child', 'Noah Harris Jr.', '1010101010101');


--=================================================================
-- STORED PROCEDURES FOR ALL TABLES TO INSERT
--=================================================================
CREATE PROCEDURE WITHDRAWAL 
	@Amount INT,
	@UserID INT
AS
BEGIN TRY
	IF (@Amount <= (SELECT Balance FROM Accounts WHERE UserID = @UserID))
	BEGIN
		UPDATE Accounts SET Balance = Balance - @Amount WHERE UserID = @UserID	
		PRINT('WITHDRAWL SUCCESSFULL');
	END
	ELSE
	BEGIN
		PRINT('WITHDRAWL FAILED');
	END
END TRY
BEGIN CATCH
	PRINT('WITHDRAWL FAILED');
END CATCH
GO
DROP PROCEDURE WITHDRAWAL
EXEC WITHDRAWAL @Amount = 10000, @UserID = 1
CREATE PROCEDURE DEPOSIT 
	@Amount INT,
	@UserID INT
AS
BEGIN TRY
		UPDATE Accounts SET Balance = Balance + @Amount WHERE UserID = @UserID	
END TRY
BEGIN CATCH
	PRINT('DEPOSIT FAILED');
END CATCH
GO

EXEC DEPOSIT @Amount = 500, @UserID = 1
GO
CREATE PROCEDURE InsertIntoAccounts
    @FullName VARCHAR(255),
    @Username VARCHAR(50),
    @Password VARCHAR(255),
    @AccountType VARCHAR(50),
    @CNIC char(13)
AS
BEGIN TRY
    BEGIN TRANSACTION; -- Start a transaction
    INSERT INTO Accounts(FullName, Username, Password, AccountType, Balance)
    VALUES (@FullName, @Username, @Password, @AccountType, 0); -- Assuming Balance is a default column

    COMMIT TRANSACTION; -- Commit the transaction if successful
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION; -- Rollback the transaction if an error occurs

    PRINT('INSERTION INTO ACCOUNTS FAILED: ' + ERROR_MESSAGE()); -- Output the catch exception message
END CATCH;
GO

CREATE PROCEDURE InsertIntoComplaints
    @UserID INT,
    @Complain TEXT,
	@output varchar(140) out
AS
BEGIN TRY
    INSERT INTO Complaints(UserID, Complain)
    VALUES (@UserID, @Complain);
	SET @output = 'Complaint Filed'
END TRY
BEGIN CATCH
    PRINT('INSERTION INTO COMPLAINTS FAILED');
	SET @output = 'Complaint Not Filed, Try Again Later'

END CATCH;
GO
DECLARE @temp varchar(140)
EXEC InsertIntoComplaints 1, 'Test', @temp OUTPUT
print(@temp);
GO

CREATE PROCEDURE InsertIntoLoans
    @UserID INT,
    @AmountRequested DECIMAL(10,2),
	@output varchar(140) out
   
AS
BEGIN TRY
	IF (NOT EXISTS (SELECT * FROM Loans WHERE UserID = @UserID))
	BEGIN
	 INSERT INTO Loans(UserID, AmountRequested, Date)
	 VALUES (@UserID, @AmountRequested, DATEADD(MONTH, 1, GETDATE()));
	 PRINT('INSERTION INTO LOANS Succeess');
	 UPDATE Accounts SET Balance = Balance + @AmountRequested WHERE Accounts.UserID = @UserID;
	 SET @output = 'Loan Granted, You Have 30 Days To Repay The Loan';
	END
	ELSE
	BEGIN
	 PRINT('outstanding Loan');
	 SET @output = 'Loan Not Granted, Outstanding Loan';
	END
END TRY
BEGIN CATCH
    PRINT('INSERTION INTO LOANS FAILED');
	SET @output = 'Loan Not Granted, Technical Failure';

END CATCH;
GO
DROP PROCEDURE InsertIntoLoans;
DECLARE @TEMP VARCHAR(140);
EXEC InsertIntoLoans 1, 400, @output = @TEMP OUTPUT;
print(@TEMP);


CREATE PROCEDURE InsertIntoCards
    @CardType VARCHAR(50),
    @UserID INT,
    @CreditLimit DECIMAL(10,2)
AS
BEGIN TRY
    INSERT INTO Cards(CardType, UserID, CreditLimit)
    VALUES (@CardType, @UserID, @CreditLimit);
END TRY
BEGIN CATCH
    PRINT('INSERTION INTO CARDS FAILED');
END CATCH;
GO


CREATE PROCEDURE InsertIntoTransactions
    @SenderID INT,
    @ReceiverID INT,
    @Amount DECIMAL(10,2),
	@output varchar(140) out
AS
	DECLARE @SASTAT BIT = 1;
	DECLARE @RASTAT BIT = 1;
	IF (GETDATE() > (SELECT Date FROM Loans WHERE UserID = @SenderID))
	BEGIN
		UPDATE Accounts SET AccountStatus = 0 WHERE UserID = @SenderID;
		SET @SASTAT = 0;
	END
	
	IF (GETDATE() > (SELECT Date FROM Loans WHERE UserID = @ReceiverID))
	BEGIN
		UPDATE Accounts SET AccountStatus = 0 WHERE UserID = @ReceiverID;
		SET @RASTAT = 0;
	END

	IF (@Amount > (SELECT A.Balance FROM Accounts A WHERE A.UserID = @SenderID) OR @SASTAT = 0 OR @RASTAT = 0)
	BEGIN
		PRINT('The Amount You Are Trying To Transfer Exceeds Your Current Balance OR Your Account Is Frozen, Please See Our Guidelines For Loans');
		SET @output = 'The Amount You Are Trying To Transfer Exceeds Your Current Balance OR Your Account Is Frozen, Please See Our Guidelines For Loans';
	END
	ELSE
	BEGIN
		UPDATE Accounts SET Balance = Balance - @Amount WHERE UserID = @SenderID;
        UPDATE Accounts SET Balance = Balance + @Amount WHERE UserID = @ReceiverID;
		INSERT INTO Transactions(SenderID, ReceiverID, Amount, Date) VALUES (@SenderID, @ReceiverID, @Amount, GETDATE());
		SET @output =  'Amount Transferred';
		PRINT('Amount Transferred');
	END
GO

DROP PROCEDURE InsertIntoTransactions;
DECLARE @TEMP VARCHAR(140);
EXEC InsertIntoTransactions 1, 4, 0, @output = @TEMP OUTPUT;
print(@TEMP);

GO
CREATE PROCEDURE InsertIntoBills
    @UserID INT,
    @TransactionAmount DECIMAL(10,2),
	@ReceiverID INT,
	@output varchar(140) out
AS
BEGIN TRY
    INSERT INTO Bills(UserID, Date, TransactionAmount, ReceiverID)
    VALUES (@UserID,GETDATE(), @TransactionAmount, @ReceiverID);
	SET @output = 'Bill Added';
END TRY
BEGIN CATCH
    PRINT('INSERTION INTO BILLS FAILED');
		SET @output = 'Bill Not Added, Technical Error';

END CATCH;
GO

DROP PROCEDURE InsertIntoBills
CREATE PROCEDURE InsertIntoHeirs
    @UserID INT,
    @Relation VARCHAR(50),
    @HeirName VARCHAR(255),
    @HeirCNIC VARCHAR(20),
	@output VARCHAR(140) out
AS
BEGIN TRY
    INSERT INTO Heirs(UserID, Relation, HeirName, HeirCNIC)
    VALUES (@UserID, @Relation, @HeirName, @HeirCNIC);
	SET @output = 'Heir Added';
END TRY
BEGIN CATCH
    PRINT('INSERTION INTO HEIRS FAILED');
		SET @output = 'Heir Not Added, possible duplicate';

END CATCH;
GO

DECLARE @out varchar(140);
EXEC InsertIntoHeirs 1, 'Father', 'Aashir Adnan', '67531234567', @out OUTPUT
print(@out);
GO

CREATE PROCEDURE InsertIntoSignUp
    @FullName VARCHAR(255),
    @CNIC char(13),
    @Username VARCHAR(50),
    @Password VARCHAR(255),
    @AccountType VARCHAR(50),
	@output varchar(140) out

AS
BEGIN TRY
	IF (NOT EXISTS (SELECT * FROM Signup WHERE CNIC = @CNIC))
	BEGIN
    INSERT INTO Signup(FullName, CNIC, Username, Password, AccountType)
    VALUES (@FullName, @CNIC, @Username, @Password, @AccountType);
	SET @output = 'Request Submitted';
	END
	ELSE
	BEGIN
	    PRINT('INSERTION INTO SIGNUP FAILED');
		SET @output = 'Request Not Added, possible Duplicate';
	END
END TRY
BEGIN CATCH
    PRINT('INSERTION INTO SIGNUP FAILED');
	SET @output = 'Request Not Added, Technical Error';

END CATCH;
GO

DROP PROCEDURE InsertIntoAccounts, InsertIntoBills, InsertIntoCards, InsertIntoComplaints,InsertIntoHeirs, InsertIntoLoans, InsertIntoTransactions, WITHDRAWAL, DEPOSIT
GO
--=================================================================
-- STORED PROCEDURES FOR ALL TABLES TO DELETE
--=================================================================
CREATE PROCEDURE DeleteFromAccounts
    @FullName VARCHAR(255),
    @Username VARCHAR(50),
    @Password VARCHAR(255),
    @AccountType VARCHAR(50),
    @Balance DECIMAL(10,2)
AS
BEGIN TRY
    DELETE FROM Accounts WHERE (FullName = @FullName AND Username = @Username AND Password = @Password AND  AccountType = @AccountType AND Balance = @Balance);
END TRY
BEGIN CATCH
    PRINT('DELETION FROM ACCOUNTS FAILED');
END CATCH;
GO
CREATE PROCEDURE DeleteFromComplaints
    @ComplainID INT
AS
BEGIN TRY
    DELETE FROM Complaints WHERE ComplainID = @ComplainID;
END TRY
BEGIN CATCH
    PRINT('DELETION FROM COMPLAINTS FAILED');
END CATCH;
GO
CREATE PROCEDURE DeleteFromLoans
    @LoanID INT
AS
BEGIN TRY
    DELETE FROM Loans WHERE LoanID = @LoanID;
END TRY
BEGIN CATCH
    PRINT('DELETION FROM LOANS FAILED');
END CATCH;
GO
CREATE PROCEDURE DeleteFromCards
    @CardID INT
AS
BEGIN TRY
    DELETE FROM Cards WHERE CardID = @CardID;
END TRY
BEGIN CATCH
    PRINT('DELETION FROM CARDS FAILED');
END CATCH;
GO
CREATE PROCEDURE DeleteFromTransactions
    @TransactionID INT
AS
BEGIN TRY
    DELETE FROM Transactions WHERE TransactionID = @TransactionID;
END TRY
BEGIN CATCH
    PRINT('DELETION FROM TRANSACTIONS FAILED');
END CATCH;
GO
CREATE PROCEDURE DeleteFromBills
    @BillID INT
AS
BEGIN TRY
    DELETE FROM Bills WHERE BillID = @BillID;
END TRY
BEGIN CATCH
    PRINT('DELETION FROM BILLS FAILED');
END CATCH;
GO
CREATE PROCEDURE DeleteFromHeirs
    @UserID INT,
    @Relation VARCHAR(50)
AS
BEGIN TRY
    DELETE FROM Heirs WHERE UserID = @UserID AND Relation = @Relation;
END TRY
BEGIN CATCH
    PRINT('DELETION FROM HEIRS FAILED');
END CATCH;
GO

DROP PROCEDURE DeleteFromAccounts, DeleteFromBills, DeleteFromCards, DeleteFromComplaints,DeleteFromHeirs,DeleteFromLoans,DeleteFromTransactions 
GO
--=================================================================
-- TRIGGERS
--=================================================================

CREATE TRIGGER HEIR_UPDATE ON Heirs
AFTER INSERT 
AS
BEGIN
	DECLARE @UID INT;
	SELECT @UID = UserID FROM inserted;
	UPDATE Accounts SET Heirs = Heirs + 1 WHERE UserID = @UID;
END
GO

CREATE TRIGGER SIGNUP_TRANSFER ON Signup
AFTER UPDATE, INSERT
AS
BEGIN
	DECLARE @FullName VARCHAR(255);
    DECLARE @CNIC1 char(13);
    DECLARE @Username VARCHAR(50) ;
    DECLARE @Password VARCHAR(255);
    DECLARE @AccountType VARCHAR(50);
	SELECT @FullName = FullName, @CNIC1 = CNIC, @Username = Username, @Password = Password, @AccountType = AccountType from inserted
	IF (0 < (SELECT ReqStatus FROM inserted))
	BEGIN TRY
		PRINT('CNIC ' + @CNIC1);
		INSERT INTO Accounts (FullName, CNIC, Username, Password, AccountType) VALUES (@FullName, @CNIC1, @Username, @Password, @AccountType);
		DELETE FROM Signup WHERE ReqStatus = 1;
	END TRY
	BEGIN CATCH
		PRINT('Sign Up Trasnfer Failed: Technical Issue');
	END CATCH
END
UPDATE Signup SET ReqStatus = 1 WHERE RequestID = 71
DROP TRIGGER HEIR_UPDATE, SIGNUP_TRANSFER;
--=================================================================
-- SELECT TABLE COMMANDS
--=================================================================

SELECT * FROM Signup
SELECT * FROM Accounts
SELECT * FROM Complaints
SELECT * FROM Loans
SELECT * FROM Cards
SELECT * FROM Transactions ORDER BY Date DESC;
SELECT * FROM Bills
SELECT * FROM Heirs

GO

DELETE FROM Signup
DELETE FROM Accounts WHERE UserID = 14;
DELETE FROM Complaints
DELETE FROM Loans
DELETE FROM Cards
DELETE FROM Transactions
DELETE FROM Bills
DELETE FROM Heirs

DROP TABLE Signup
DROP TABLE Bills
--=================================================================
-- DROP TABLE COMMANDS
--=================================================================
DROP TABLE Signup, Accounts, Complaints, Loans, Cards, Transactions, Bills, Heirs
GO
