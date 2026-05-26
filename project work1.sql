-- customer details
CREATE TABLE customers (
customer_id INT PRIMARY KEY,full_name VARCHAR(100) NOT NULL,
dob DATE NOT NULL,gender VARCHAR(10) NOT NULL,
phone VARCHAR(15) UNIQUE NOT NULL,email VARCHAR(100) UNIQUE NOT NULL,address TEXT NOT NULL);
-- branches table
CREATE TABLE branches (
branch_id INT PRIMARY KEY,branch_name VARCHAR(100) NOT NULL,city VARCHAR(50) NOT NULL,ifsc_code VARCHAR(20) UNIQUE NOT NULL);
-- account_types
CREATE TABLE account_types(
type_id INT PRIMARY KEY,
type_name VARCHAR(50) UNIQUE NOT NULL,
minimum_balance NUMERIC(10,2) NOT NULL);
-- accounts
CREATE TABLE accounts(
account_no INT PRIMARY KEY,
customer_id INT NOT NULL,
branch_id INT NOT NULL,
type_id INT NOT NULL,
balance NUMERIC(12,2) NOT NULL,
account_status VARCHAR(20) NOT NULL,
CONSTRAINT fk_customer
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id),
CONSTRAINT fk_branch
FOREIGN KEY(branch_id)
REFERENCES branches(branch_id),
CONSTRAINT fk_type
FOREIGN KEY(type_id)
REFERENCES account_types(type_id));
-- transactions
CREATE TABLE transactions(
transaction_id INT PRIMARY KEY,
account_no INT NOT NULL,
transaction_type VARCHAR(20) NOT NULL,
amount NUMERIC(10,2) NOT NULL,
transaction_date DATE NOT NULL,
CONSTRAINT fk_transaction_account
FOREIGN KEY(account_no)
REFERENCES accounts(account_no));
-- beneficiaries
CREATE TABLE beneficiaries(
beneficiary_id INT PRIMARY KEY,
customer_id INT NOT NULL,
beneficiary_account INT NOT NULL,
beneficiary_name VARCHAR(100) NOT NULL,
CONSTRAINT fk_beneficiary_customer
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id));
-- transfers
CREATE TABLE transfers(
transfer_id INT PRIMARY KEY,
sender_account INT NOT NULL,
receiver_account INT NOT NULL,
amount NUMERIC(10,2) NOT NULL,
transfer_date DATE NOT NULL,
CONSTRAINT fk_sender
FOREIGN KEY(sender_account)
REFERENCES accounts(account_no),
CONSTRAINT fk_receiver
FOREIGN KEY(receiver_account)
REFERENCES accounts(account_no));
-- loans
CREATE TABLE loans(
loan_id INT PRIMARY KEY,
customer_id INT NOT NULL,
loan_type VARCHAR(50) NOT NULL,
loan_amount NUMERIC(12,2) NOT NULL,
interest_rate DECIMAL(5,2) NOT NULL,
loan_status VARCHAR(20) NOT NULL,
CONSTRAINT fk_loan_customer
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id));
-- credit_cards
CREATE TABLE credit_cards(
card_id INT PRIMARY KEY,
customer_id INT NOT NULL,
card_number VARCHAR(20) UNIQUE NOT NULL,
expiry_date DATE NOT NULL,
credit_limit NUMERIC(12,2) NOT NULL,
CONSTRAINT fk_card_customer
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id));
-- transactions
CREATE TABLE atm_transactions(
atm_transaction_id INT PRIMARY KEY,
account_no INT NOT NULL,
atm_location VARCHAR(100) NOT NULL,
amount NUMERIC(10,2) NOT NULL,
transaction_type VARCHAR(20) NOT NULL,
transaction_date DATE NOT NULL,
CONSTRAINT fk_atm_account
FOREIGN KEY(account_no)
REFERENCES accounts(account_no));


-- insert
INSERT INTO customers VALUES
(1,'Customer1','2001-01-01','Male','9000000001','customer1@gmail.com','Chennai'),
(2,'Customer2','2001-01-02','Female','9000000002','customer2@gmail.com','Mumbai'),
(3,'Customer3','2001-01-03','Male','9000000003','customer3@gmail.com','Delhi'),
(4,'Customer4','2001-01-04','Female','9000000004','customer4@gmail.com','Hyderabad'),
(5,'Customer5','2001-01-05','Male','9000000005','customer5@gmail.com','Bangalore'),
(6,'Customer6','2001-01-06','Female','9000000006','customer6@gmail.com','Chennai'),
(7,'Customer7','2001-01-07','Male','9000000007','customer7@gmail.com','Mumbai'),
(8,'Customer8','2001-01-08','Female','9000000008','customer8@gmail.com','Delhi'),
(9,'Customer9','2001-01-09','Male','9000000009','customer9@gmail.com','Hyderabad'),
(10,'Customer10','2001-01-10','Female','9000000010','customer10@gmail.com','Bangalore'),
(11,'Customer11','2001-01-11','Male','9000000011','customer11@gmail.com','Chennai'),
(12,'Customer12','2001-01-12','Female','9000000012','customer12@gmail.com','Mumbai'),
(13,'Customer13','2001-01-13','Male','9000000013','customer13@gmail.com','Delhi'),
(14,'Customer14','2001-01-14','Female','9000000014','customer14@gmail.com','Hyderabad'),
(15,'Customer15','2001-01-15','Male','9000000015','customer15@gmail.com','Bangalore'),
(16,'Customer16','2001-01-16','Female','9000000016','customer16@gmail.com','Chennai'),
(17,'Customer17','2001-01-17','Male','9000000017','customer17@gmail.com','Mumbai'),
(18,'Customer18','2001-01-18','Female','9000000018','customer18@gmail.com','Delhi'),
(19,'Customer19','2001-01-19','Male','9000000019','customer19@gmail.com','Hyderabad'),
(20,'Customer20','2001-01-20','Female','9000000020','customer20@gmail.com','Bangalore'),
(21,'Customer21','2001-01-21','Male','9000000021','customer21@gmail.com','Chennai'),
(22,'Customer22','2001-01-22','Female','9000000022','customer22@gmail.com','Mumbai'),
(23,'Customer23','2001-01-23','Male','9000000023','customer23@gmail.com','Delhi'),
(24,'Customer24','2001-01-24','Female','9000000024','customer24@gmail.com','Hyderabad'),
(25,'Customer25','2001-01-25','Male','9000000025','customer25@gmail.com','Bangalore'),
(26,'Customer26','2001-01-26','Female','9000000026','customer26@gmail.com','Chennai'),
(27,'Customer27','2001-01-27','Male','9000000027','customer27@gmail.com','Mumbai'),
(28,'Customer28','2001-01-28','Female','9000000028','customer28@gmail.com','Delhi'),
(29,'Customer29','2001-01-29','Male','9000000029','customer29@gmail.com','Hyderabad'),
(30,'Customer30','2001-01-30','Female','9000000030','customer30@gmail.com','Bangalore'),
(31,'Customer31','2001-01-31','Male','9000000031','customer31@gmail.com','Chennai'),
(32,'Customer32','2001-02-01','Female','9000000032','customer32@gmail.com','Mumbai'),
(33,'Customer33','2001-02-02','Male','9000000033','customer33@gmail.com','Delhi'),
(34,'Customer34','2001-02-03','Female','9000000034','customer34@gmail.com','Hyderabad'),
(35,'Customer35','2001-02-04','Male','9000000035','customer35@gmail.com','Bangalore'),
(36,'Customer36','2001-02-05','Female','9000000036','customer36@gmail.com','Chennai'),
(37,'Customer37','2001-02-06','Male','9000000037','customer37@gmail.com','Mumbai'),
(38,'Customer38','2001-02-07','Female','9000000038','customer38@gmail.com','Delhi'),
(39,'Customer39','2001-02-08','Male','9000000039','customer39@gmail.com','Hyderabad'),
(40,'Customer40','2001-02-09','Female','9000000040','customer40@gmail.com','Bangalore'),
(41,'Customer41','2001-02-10','Male','9000000041','customer41@gmail.com','Chennai'),
(42,'Customer42','2001-02-11','Female','9000000042','customer42@gmail.com','Mumbai'),
(43,'Customer43','2001-02-12','Male','9000000043','customer43@gmail.com','Delhi'),
(44,'Customer44','2001-02-13','Female','9000000044','customer44@gmail.com','Hyderabad'),
(45,'Customer45','2001-02-14','Male','9000000045','customer45@gmail.com','Bangalore'),
(46,'Customer46','2001-02-15','Female','9000000046','customer46@gmail.com','Chennai'),
(47,'Customer47','2001-02-16','Male','9000000047','customer47@gmail.com','Mumbai'),
(48,'Customer48','2001-02-17','Female','9000000048','customer48@gmail.com','Delhi'),
(49,'Customer49','2001-02-18','Male','9000000049','customer49@gmail.com','Hyderabad'),
(50,'Customer50','2001-02-19','Female','9000000050','customer50@gmail.com','Bangalore');
select*from customers;

INSERT INTO branches VALUES
(1,'Chennai Main Branch','Chennai','IFSC0001'),
(2,'Mumbai Central Branch','Mumbai','IFSC0002'),
(3,'Delhi City Branch','Delhi','IFSC0003'),
(4,'Hyderabad Main Branch','Hyderabad','IFSC0004'),
(5,'Bangalore Central Branch','Bangalore','IFSC0005'),
(6,'Coimbatore Branch','Coimbatore','IFSC0006'),
(7,'Pune Branch','Pune','IFSC0007'),
(8,'Kolkata Branch','Kolkata','IFSC0008'),
(9,'Jaipur Branch','Jaipur','IFSC0009'),
(10,'Ahmedabad Branch','Ahmedabad','IFSC0010'),
(11,'Madurai Branch','Madurai','IFSC0011'),
(12,'Lucknow Branch','Lucknow','IFSC0012'),
(13,'Surat Branch','Surat','IFSC0013'),
(14,'Patna Branch','Patna','IFSC0014'),
(15,'Bhopal Branch','Bhopal','IFSC0015'),
(16,'Nagpur Branch','Nagpur','IFSC0016'),
(17,'Vijayawada Branch','Vijayawada','IFSC0017'),
(18,'Trichy Branch','Trichy','IFSC0018'),
(19,'Mysore Branch','Mysore','IFSC0019'),
(20,'Goa Branch','Goa','IFSC0020'),
(21,'Noida Branch','Noida','IFSC0021'),
(22,'Indore Branch','Indore','IFSC0022'),
(23,'Kanpur Branch','Kanpur','IFSC0023'),
(24,'Amritsar Branch','Amritsar','IFSC0024'),
(25,'Ranchi Branch','Ranchi','IFSC0025');

INSERT INTO account_types VALUES
(1,'Savings',1000.00),
(2,'Current',5000.00),
(3,'Salary',0.00),
(4,'Business',10000.00),
(5,'Fixed Deposit',25000.00);

INSERT INTO accounts VALUES
(1001,1,1,1,25000.00,'Active'),
(1002,2,2,2,30000.00,'Active'),
(1003,3,3,1,45000.00,'Active'),
(1004,4,4,3,55000.00,'Active'),
(1005,5,5,2,60000.00,'Active'),
(1006,6,6,1,27000.00,'Active'),
(1007,7,7,2,35000.00,'Active'),
(1008,8,8,3,47000.00,'Active'),
(1009,9,9,1,52000.00,'Active'),
(1010,10,10,2,61000.00,'Active'),
(1011,11,11,1,28000.00,'Active'),
(1012,12,12,2,33000.00,'Active'),
(1013,13,13,3,49000.00,'Active'),
(1014,14,14,1,54000.00,'Active'),
(1015,15,15,2,62000.00,'Active'),
(1016,16,16,1,29000.00,'Active'),
(1017,17,17,2,36000.00,'Active'),
(1018,18,18,3,48000.00,'Active'),
(1019,19,19,1,53000.00,'Active'),
(1020,20,20,2,64000.00,'Active'),
(1021,21,21,1,30000.00,'Active'),
(1022,22,22,2,37000.00,'Active'),
(1023,23,23,3,50000.00,'Active'),
(1024,24,24,1,55000.00,'Active'),
(1025,25,25,2,65000.00,'Active'),
(1026,26,1,1,26000.00,'Active'),
(1027,27,2,2,34000.00,'Active'),
(1028,28,3,3,46000.00,'Active'),
(1029,29,4,1,51000.00,'Active'),
(1030,30,5,2,63000.00,'Active'),
(1031,31,6,1,27500.00,'Active'),
(1032,32,7,2,34500.00,'Active'),
(1033,33,8,3,47500.00,'Active'),
(1034,34,9,1,52500.00,'Active'),
(1035,35,10,2,61500.00,'Active'),
(1036,36,11,1,28500.00,'Active'),
(1037,37,12,2,35500.00,'Active'),
(1038,38,13,3,48500.00,'Active'),
(1039,39,14,1,53500.00,'Active'),
(1040,40,15,2,64500.00,'Active'),
(1041,41,16,1,29500.00,'Active'),
(1042,42,17,2,36500.00,'Active'),
(1043,43,18,3,49500.00,'Active'),
(1044,44,19,1,54500.00,'Active'),
(1045,45,20,2,65500.00,'Active'),
(1046,46,21,1,30500.00,'Active'),
(1047,47,22,2,37500.00,'Active'),
(1048,48,23,3,50500.00,'Active'),
(1049,49,24,1,56500.00,'Active'),
(1050,50,25,2,67500.00,'Active');
select*from accounts;

INSERT INTO transactions VALUES
(1,1001,'Deposit',5000.00,'2025-01-01'),
(2,1002,'Withdraw',2000.00,'2025-01-02'),
(3,1003,'Deposit',3000.00,'2025-01-03'),
(4,1004,'Withdraw',1500.00,'2025-01-04'),
(5,1005,'Deposit',4000.00,'2025-01-05'),
(6,1006,'Withdraw',1000.00,'2025-01-06'),
(7,1007,'Deposit',3500.00,'2025-01-07'),
(8,1008,'Withdraw',2500.00,'2025-01-08'),
(9,1009,'Deposit',4500.00,'2025-01-09'),
(10,1010,'Withdraw',3000.00,'2025-01-10'),
(11,1011,'Deposit',5500.00,'2025-01-11'),
(12,1012,'Withdraw',1200.00,'2025-01-12'),
(13,1013,'Deposit',3200.00,'2025-01-13'),
(14,1014,'Withdraw',1700.00,'2025-01-14'),
(15,1015,'Deposit',2800.00,'2025-01-15'),
(16,1016,'Withdraw',2200.00,'2025-01-16'),
(17,1017,'Deposit',6000.00,'2025-01-17'),
(18,1018,'Withdraw',1900.00,'2025-01-18'),
(19,1019,'Deposit',4100.00,'2025-01-19'),
(20,1020,'Withdraw',2600.00,'2025-01-20'),
(21,1021,'Deposit',4800.00,'2025-01-21'),
(22,1022,'Withdraw',3100.00,'2025-01-22'),
(23,1023,'Deposit',2900.00,'2025-01-23'),
(24,1024,'Withdraw',1800.00,'2025-01-24'),
(25,1025,'Deposit',5200.00,'2025-01-25'),
(26,1026,'Withdraw',2400.00,'2025-01-26'),
(27,1027,'Deposit',3300.00,'2025-01-27'),
(28,1028,'Withdraw',2100.00,'2025-01-28'),
(29,1029,'Deposit',3700.00,'2025-01-29'),
(30,1030,'Withdraw',2700.00,'2025-01-30'),
(31,1031,'Deposit',4300.00,'2025-01-31'),
(32,1032,'Withdraw',1600.00,'2025-02-01'),
(33,1033,'Deposit',5100.00,'2025-02-02'),
(34,1034,'Withdraw',2300.00,'2025-02-03'),
(35,1035,'Deposit',6200.00,'2025-02-04'),
(36,1036,'Withdraw',1400.00,'2025-02-05'),
(37,1037,'Deposit',3900.00,'2025-02-06'),
(38,1038,'Withdraw',2800.00,'2025-02-07'),
(39,1039,'Deposit',4700.00,'2025-02-08'),
(40,1040,'Withdraw',3500.00,'2025-02-09'),
(41,1041,'Deposit',5400.00,'2025-02-10'),
(42,1042,'Withdraw',1300.00,'2025-02-11'),
(43,1043,'Deposit',3100.00,'2025-02-12'),
(44,1044,'Withdraw',2000.00,'2025-02-13'),
(45,1045,'Deposit',4500.00,'2025-02-14'),
(46,1046,'Withdraw',2500.00,'2025-02-15'),
(47,1047,'Deposit',5800.00,'2025-02-16'),
(48,1048,'Withdraw',1700.00,'2025-02-17'),
(49,1049,'Deposit',4900.00,'2025-02-18'),
(50,1050,'Withdraw',3000.00,'2025-02-19');
select*from transactions;

INSERT INTO beneficiaries VALUES
(1,1,1002,'Customer2'),
(2,2,1003,'Customer3'),
(3,3,1004,'Customer4'),
(4,4,1005,'Customer5'),
(5,5,1006,'Customer6'),
(6,6,1007,'Customer7'),
(7,7,1008,'Customer8'),
(8,8,1009,'Customer9'),
(9,9,1010,'Customer10'),
(10,10,1011,'Customer11'),
(11,11,1012,'Customer12'),
(12,12,1013,'Customer13'),
(13,13,1014,'Customer14'),
(14,14,1015,'Customer15'),
(15,15,1016,'Customer16'),
(16,16,1017,'Customer17'),
(17,17,1018,'Customer18'),
(18,18,1019,'Customer19'),
(19,19,1020,'Customer20'),
(20,20,1021,'Customer21'),
(21,21,1022,'Customer22'),
(22,22,1023,'Customer23'),
(23,23,1024,'Customer24'),
(24,24,1025,'Customer25'),
(25,25,1026,'Customer26'),
(26,26,1027,'Customer27'),
(27,27,1028,'Customer28'),
(28,28,1029,'Customer29'),
(29,29,1030,'Customer30'),
(30,30,1031,'Customer31'),
(31,31,1032,'Customer32'),
(32,32,1033,'Customer33'),
(33,33,1034,'Customer34'),
(34,34,1035,'Customer35'),
(35,35,1036,'Customer36'),
(36,36,1037,'Customer37'),
(37,37,1038,'Customer38'),
(38,38,1039,'Customer39'),
(39,39,1040,'Customer40'),
(40,40,1041,'Customer41'),
(41,41,1042,'Customer42'),
(42,42,1043,'Customer43'),
(43,43,1044,'Customer44'),
(44,44,1045,'Customer45'),
(45,45,1046,'Customer46'),
(46,46,1047,'Customer47'),
(47,47,1048,'Customer48'),
(48,48,1049,'Customer49'),
(49,49,1050,'Customer50'),
(50,50,1001,'Customer1');
select*from beneficiaries;

INSERT INTO transfers VALUES
(1,1001,1002,1000.00,'2025-03-01'),
(2,1002,1003,1500.00,'2025-03-02'),
(3,1003,1004,2000.00,'2025-03-03'),
(4,1004,1005,2500.00,'2025-03-04'),
(5,1005,1006,3000.00,'2025-03-05'),
(6,1006,1007,1200.00,'2025-03-06'),
(7,1007,1008,1800.00,'2025-03-07'),
(8,1008,1009,2200.00,'2025-03-08'),
(9,1009,1010,2700.00,'2025-03-09'),
(10,1010,1011,3200.00,'2025-03-10'),
(11,1011,1012,1400.00,'2025-03-11'),
(12,1012,1013,1900.00,'2025-03-12'),
(13,1013,1014,2400.00,'2025-03-13'),
(14,1014,1015,2900.00,'2025-03-14'),
(15,1015,1016,3400.00,'2025-03-15'),
(16,1016,1017,1600.00,'2025-03-16'),
(17,1017,1018,2100.00,'2025-03-17'),
(18,1018,1019,2600.00,'2025-03-18'),
(19,1019,1020,3100.00,'2025-03-19'),
(20,1020,1021,3600.00,'2025-03-20'),
(21,1021,1022,1700.00,'2025-03-21'),
(22,1022,1023,2300.00,'2025-03-22'),
(23,1023,1024,2800.00,'2025-03-23'),
(24,1024,1025,3300.00,'2025-03-24'),
(25,1025,1026,3800.00,'2025-03-25'),
(26,1026,1027,1500.00,'2025-03-26'),
(27,1027,1028,2000.00,'2025-03-27'),
(28,1028,1029,2500.00,'2025-03-28'),
(29,1029,1030,3000.00,'2025-03-29'),
(30,1030,1031,3500.00,'2025-03-30'),
(31,1031,1032,1800.00,'2025-03-31'),
(32,1032,1033,2400.00,'2025-04-01'),
(33,1033,1034,2900.00,'2025-04-02'),
(34,1034,1035,3400.00,'2025-04-03'),
(35,1035,1036,3900.00,'2025-04-04'),
(36,1036,1037,1600.00,'2025-04-05'),
(37,1037,1038,2100.00,'2025-04-06'),
(38,1038,1039,2600.00,'2025-04-07'),
(39,1039,1040,3100.00,'2025-04-08'),
(40,1040,1041,3600.00,'2025-04-09'),
(41,1041,1042,1700.00,'2025-04-10'),
(42,1042,1043,2200.00,'2025-04-11'),
(43,1043,1044,2700.00,'2025-04-12'),
(44,1044,1045,3200.00,'2025-04-13'),
(45,1045,1046,3700.00,'2025-04-14'),
(46,1046,1047,1900.00,'2025-04-15'),
(47,1047,1048,2400.00,'2025-04-16'),
(48,1048,1049,2900.00,'2025-04-17'),
(49,1049,1050,3400.00,'2025-04-18'),
(50,1050,1001,4000.00,'2025-04-19');
select*from transfers;
-- queries
--Display all customers with their account numbers and balances.
select c.full_name,a.account_no,a.balance from customers c inner join accounts a on c.customer_id=a.customer_id;
--Show customers whose balance is greater than 50000.
select c.full_name,a.balance from customers c inner join accounts a on c.customer_id=a.customer_id where balance>50000;
-- Find all customers belonging to Chennai branch.
SELECT c.full_name,b.branch_name FROM customers c INNER JOIN accounts a
ON c.customer_id=a.customer_id INNER JOIN branches b ON a.branch_id=b.branch_id WHERE b.city='Chennai';
-- Show customer details with account type.
SELECT c.full_name,at.type_name FROM customers c INNER JOIN accounts a
ON c.customer_id=a.customer_id INNER JOIN account_types at ON a.type_id=at.type_id;
-- Find all ATM transactions with customer names.
SELECT c.full_name,atm.transaction_type,atm.amount FROM customers c INNER JOIN accounts a
ON c.customer_id=a.customer_id INNER JOIN atm_transactions atm ON a.account_no=atm.account_no;
-- Display transfer details with sender and receiver account numbers.
SELECT transfer_id,sender_account,receiver_account,amount FROM transfers;
-- Find customers who made ATM withdrawals.
seLECT c.full_name,atm.amount FROM customers c INNER JOIN accounts a
ON c.customer_id=a.customer_id INNER JOIN atm_transactions atm
ON a.account_no=atm.account_no WHERE atm.transaction_type='Withdraw';
-- Count total customers in each city.
SELECT address,COUNT(customer_id) FROM customers GROUP BY address;
-- Find total deposits and withdrawals separately.
SELECT transaction_type,SUM(amount) FROM transactions GROUP BY transaction_type;
-- Find branch having highest total balance.
SELECT b.branch_name,SUM(a.balance) FROM branches b INNER JOIN accounts a
ON b.branch_id=a.branch_id GROUP BY b.branch_name ORDER BY SUM(a.balance) DESC LIMIT 1;
-- Display top 5 accounts with highest balances.
SELECT *FROM accounts ORDER BY balance DESC LIMIT 5;
-- Find minimum and maximum account balances.
SELECT MIN(balance),MAX(balance)FROM accounts;
-- Find customers who never took loans.
SELECT *FROM customers WHERE customer_id NOT IN(SELECT customer_id FROM loans);
-- Find customers who do not own credit cards.
SELECT *FROM customers WHERE customer_id NOT IN(SELECT customer_id FROM credit_cards);
-- Find fourth highest balance account.
SELECT *FROM accounts ORDER BY balance DESC LIMIT 1 OFFSET 3;
-- Display customer, branch, account type, and balance in one query.
SELECT c.full_name,b.branch_name,at.type_name,a.balance FROM customers c
INNER JOIN accounts a ON c.customer_id=a.customer_id INNER JOIN branches b
ON a.branch_id=b.branch_id
INNER JOIN account_types at ON a.type_id=at.type_id;
--  Find inactive accounts with no transactions.
SELECT *FROM accounts WHERE account_status='Inactive'AND account_no NOT IN(
SELECT account_no FROM transactions);
-- Create a view showing customer loan summaries.
CREATE VIEW customer_loan_summary AS SELECT c.full_name,l.loan_type,l.loan_amount
FROM customers c INNER JOIN loans l ON c.customer_id=l.customer_id;
-- Transfer 5000 from one account to another using BEGIN and COMMIT.
BEGIN;

UPDATE accounts
SET balance=balance-5000
WHERE account_no=1001;

UPDATE accounts
SET balance=balance+5000
WHERE account_no=1002;

COMMIT;
-- Perform transaction rollback after updating balance.
BEGIN;

UPDATE accounts
SET balance=balance-2000
WHERE account_no=1001;

ROLLBACK;

















