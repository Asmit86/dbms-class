create DATABASE dbemp33;
use dbemp33;

create table student(
id int not null auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
age int,
address varchar(50),
city varchar(50),
phone varchar(15)

);

insert into student(first_name, last_name, age, address, city, phone) values('Sujit', 'Gautam', 17, 'Charpane', 'Birtamod', '9841223344');
insert into student(first_name, last_name, age, address, city, phone) values('Aashish', 'Thapa', 19, 'Kusma', 'Parwat', '9841332244');

select * from student;

update student set age = 20 where city = 'Parwat';