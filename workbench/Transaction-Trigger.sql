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

# TRIGGERS

# 1. Create a table of employees with the fields: emp_id, name, salary.

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO employees VALUES
(1, 'Ram', 45000),
(2, 'Shyam', 40000),
(3, 'Sita', 50000);

select * from employees;

# Create another table salary_log to record emplayee slary changes with fields: log_id, emp_id, old_salary, new_salary, updated_at.

CREATE TABLE salary_log (
    log_id INT auto_increment primary key,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


# Create a BEFORE INSERT trigger on employees that prevents inserting employees whose salary is less than 10000.
Delimiter $$ 
create trigger check_salary
before insert on employees
for each row 
begin
if new.Salary < 10000 then
signal sqlstate '45000'
set message_text = 'salary must be at least 10000';
end if;
end $$
Delimiter ;

# Create an After Update trigger on employees that records salary changes into the salary_log table.
Delimiter $$
create trigger log_salary_update
after update on employees
for each row
begin
insert into salary_log(emp_id, old_salary, new_salary) values(old.emp_id, old.salary, new.salary);
end $$
Delimiter ;

# Stored Procedure
# Create a stored procedure that retrives all records from the employees table.
Delimiter //
Create procedure getEmployees()
begin 
select * from employees;
end //
Delimiter ;

call getEmployees();

# Create a stored procedure that inserts a new employee into the employees table using parameters
Delimiter //
create procedure addEmployee(
IN p_id int,
IN p_name varchar(100),
IN p_salary decimal(10,2)
)
begin 
insert into employees values (p_id, p_name, p_salary);
end //
Delimiter ;

call addEmployee(6,'Hari', 20000);


# Create a stored procedure that updates the salary of an employee based on employee ID.
Delimiter //
create procedure updateSalary(
IN p_id int,
IN new_salary decimal(10,2)
)
begin 
update employees
set salary = new_salary
where emp_id = p_id;
end //
Delimiter ;

call addEmployee(5,'Hari', 20000);



# Create a stored procedure that tansfers money between two accounts using a transaction.
DELIMITER //
CREATE PROCEDURE transferMoney(
    IN from_account INT,
    IN to_account INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    DECLARE current_balance DECIMAL(10,2);

    START TRANSACTION;

    SELECT balance INTO current_balance
    FROM accounts
    WHERE account_id = from_account;

    
    IF current_balance >= amount THEN

        UPDATE accounts
        SET balance = balance - amount
        WHERE account_id = from_account;

        UPDATE accounts
        SET balance = balance + amount
        WHERE account_id = to_account;

        COMMIT;

    ELSE
        ROLLBACK;
    END IF;

END //

DELIMITER ;































