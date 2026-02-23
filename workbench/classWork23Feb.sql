create database classwork23Feb;
use classwork23Feb;

create table Dept(
DEPTNO INT not null auto_increment primary key,
DNAME varchar(50),
LOC varchar(100)
);

alter table Dept add PINCODE int not null;

ALTER TABLE Dept RENAME TO Department;

ALTER TABLE Department
RENAME COLUMN DNAME TO DEPT_Name;

ALTER TABLE Department
MODIFY COLUMN LOC char(10);

select * from Department;

drop table Department;
