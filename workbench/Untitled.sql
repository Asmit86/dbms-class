create DATABASE dbemp123;

use dbemp123;

create table student(
id int not null auto_increment primary key,
name varchar(50),
dob date
);

select * from student;

insert into student(name, dob) values('Pawan', '2005-12-02');
insert into student(name, dob) values('Sujit', '2008-12-02');
insert into student(name, dob) values('Aashish', '2007-12-02');


create table student_course(
stdID int,
course_code varchar(50),
subject varchar(50)
);

insert into student_course(stdID, course_code, subject) values(1, 'BSC', 'Database');
insert into student_course(stdID, course_code, subject) values(2, 'BSC', 'Computer Networks');
insert into student_course(stdID, course_code, subject) values(3, 'BSC', 'English');

select * from student_course;


select id, name, course_code, subject from student right join student_course  on student.id = student_course.stdID;
