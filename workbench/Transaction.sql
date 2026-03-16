# Transaction

create database BankDB;
use BankDB;

create table accounts(
account_id int primary key,
account_holder varchar(100) not null,
balance decimal(10,2)
);

INSERT INTO accounts (account_id, account_holder, balance) VALUES
(1, 'Ram', 50000),
(2, 'Shyam', 30000),
(3, 'Sita', 20000);

# Write a transaction that transfers Rs. 5000 from Ram's account to Shyam's account.
START TRANSACTION;
UPDATE accounts
SET balance = balance - 5000
WHERE account_holder = 'Ram';
UPDATE accounts
SET balance = balance + 5000
WHERE account_holder = 'Shyam';
COMMIT;
select * from accounts;

# Wripte a transaciton that transfers Rs.10000 from Shyam's account to Sita's account and demonstrate the use of ROLLBACK.
start transaction;
update accounts
set balance = balance - 10000
where account_holder = 'Shyam';

update accounts
set balance = balance + 10000
where account_holder = 'Sita';
rollback;

# Write a transaction that demonstrates the use of SAVEPOINT while updation account balances.

start transaction;
update accounts 
set balance = balance -20000
where account_id = 1;
savepoint sp1;
update accounts
set balance = balance + 20000
where account_id = 2;
rollback to sp1;
commit;













