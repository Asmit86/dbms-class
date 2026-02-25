create database Companydb;
use Companydb;




create table department(
dname varchar(20),
dnumber int primary key,
mgrssn varchar(15),
mgrstartdate date
);

create table employee (
fname varchar(20),
minit char(1),
lname varchar(15),
ssn varchar(15),
bdate date,
address varchar(100),
sex char(1),
salary int,
superssn varchar(15),
dno int,
foreign key(DNO) references department(dnumber)
);

INSERT INTO department (dname, dnumber, mgrssn, mgrstartdate)
VALUES ('Research', 1, '123456789', '2020-01-15');

INSERT INTO department (dname, dnumber, mgrssn, mgrstartdate)
VALUES ('Administration', 2, '987654321', '2021-03-10');

INSERT INTO department (dname, dnumber, mgrssn, mgrstartdate)
VALUES ('Headquarters', 3, '456789123', '2019-06-01');

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('John', 'B', 'Smith', '123456789', '1985-01-09', 'Kathmandu', 'M', 50000, NULL, 1);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Sarita', 'K', 'Shrestha', '987654321', '1990-03-15', 'Lalitpur', 'F', 45000, '123456789', 2);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Ram', 'P', 'Adhikari', '456789123', '1988-07-22', 'Bhaktapur', 'M', 48000, '123456789', 3);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Sita', 'R', 'Koirala', '741852963', '1995-11-30', 'Pokhara', 'F', 42000, '987654321', 1);




select * from employee;

select * from department;

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Amit', 'R', 'Sharma', '852741963', '1992-04-12', 'Kathmandu', 'M', 46000, '123456789', 1);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Neha', 'S', 'Gurung', '963852741', '1994-08-25', 'Pokhara', 'F', 44000, '987654321', 2);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Ramesh', 'T', 'Thapa', '159753486', '1987-02-17', 'Chitwan', 'M', 47000, '456789123', 3);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Sunita', 'M', 'Karki', '357159486', '1993-09-05', 'Biratnagar', 'F', 43000, '123456789', 1);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Bikash', 'L', 'Basnet', '654987321', '1991-12-19', 'Dharan', 'M', 45500, '987654321', 2);

INSERT INTO employee
(fname, minit, lname, ssn, bdate, address, sex, salary, superssn, dno)
VALUES
('Kiran', 'D', 'Pandey', '321654987', '1989-06-30', 'Butwal', 'M', 49000, '456789123', 3);


# q1: 10% Salary Raise for Research Department
SELECT e.fname, e.lname, e.salary *1.1 as increased_salary
FROM employee e
JOIN department d
ON e.dno = d.dnumber 
where d.dname = 'Research';

# q2: Salary Statistics of Accounts Department
# sum. max, min, avg for deparment administration

SELECT 
sum(e.salary) as total, max(e.salary) as max, min(e.salary) as min, avg(e.salary) as average 
FROM employee e
JOIN department d
ON e.dno = d.dnumber 
where d.dname = 'administration';

# q3: Employees controlled by department no 3
-- select fname, lname from employee where exists
-- (select * from employee e where e.dno = 3 and e.ssn = e.ssn);

select fname, lname from employee where dno = 3;


# q4: Deparments Having at least 2 employees

SELECT d.dname, COUNT(e.ssn) AS employee_count
FROM department d
JOIN employee e
ON d.dnumber = e.dno
GROUP BY d.dname
HAVING COUNT(e.ssn) >= 2;

# q5: Employees born in 1990's

select fname, bdate from employee where year(bdate) between 1990 and 1999;


