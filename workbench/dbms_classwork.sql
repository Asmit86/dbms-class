create DATABASE	classworkDB;
use classworkDB;

create table Persons(
person_id int not null auto_increment primary key,
last_name varchar(50),
first_name varchar(50),
age int

);

drop table Persons;
drop database classworkDB;



CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(person_id)
);


insert into Persons (last_name, first_name, age) values ('Gautam', 'Sujit', 18);

insert into Orders (OrderID, OrderNumber, PersonID) values (1,4343,1);

alter table Persons add email varchar(100);

update Persons set email = 'sujit@gmail.com' where person_id = 1;

select * from persons;

select Orders.OrderID, first_name
FROM Persons
INNER JOIN Orders ON Persons.person_id = Orders.PERSONID;

select Orders.OrderID, first_name
FROM Persons
Left JOIN Orders ON Persons.person_id = Orders.PERSONID;

select Orders.OrderID, first_name
FROM Persons
Right JOIN Orders ON Persons.person_id = Orders.PERSONID;

