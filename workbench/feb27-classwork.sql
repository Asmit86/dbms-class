create database feb27Classwork;
use feb27Classwork;


create table MOVIE(
mID int not null auto_increment primary key,
Title varchar(50),
Year varchar(4),
Director varchar(50)
);


insert into Movie(Title, Year, Director) values('Top Gun', '1986', 'Tony Scott');
insert into Movie(Title, Year, Director) values ('Titanic', '1997', 'James Cameron');
insert into Movie(Title, Year, Director) values ('The Lion King', '1994', 'Rob Minkoff');
insert into Movie(Title, Year, Director) values ('Gravity', '2013', 'Alfonso Cuaron');
insert into Movie(Title, Year, Director) values ('Harry Potter', '2001', '');
insert into Movie(Title, Year, Director) values ('Cast Away', '2000', 'Robert Zemeckis');
insert into Movie(Title, Year, Director) values ('Spider Man', '2002', 'Sam Raimi');
insert into Movie(Title, Year, Director) values ('The Godfather', '1972', 'Francis Coppola');


create table User(
uID int not null auto_increment primary key,
Name varchar(50)
);

insert into User(Name) values ('James Dean');
INSERT INTO User(Name) VALUES ('Robert Downey');
INSERT INTO User(Name) VALUES ('Emma Watson');
INSERT INTO User(Name) VALUES ('Chris Evans');
INSERT INTO User(Name) VALUES ('Scarlett Johansson');
INSERT INTO User(Name) VALUES ('Leonardo DiCaprio');
INSERT INTO User(Name) VALUES ('Jennifer Lawrence');
INSERT INTO User(Name) VALUES ('Tom Holland');

create table Ratings(
uID int not null,
mID int,
Rating int,
ratingDate date
);

INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (1, 1, 5, '2026-01-10');
INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (2, 2, 4, '2026-01-12');
INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (3, 3, 3, '2026-01-15');
INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (4, 4, 5, '2026-01-18');
INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (5, 5, 2, '2026-01-20');
INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (6, 6, 4, '2026-01-22');
INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (7, 7, 5, '2026-01-25');
INSERT INTO Ratings (uID, mID, Rating, ratingDate) VALUES (8, 8, 3, '2026-01-28');





# Find the title and year of movies that were create after the year 2000.
Select Title, Year from Movie where Year >2000;

# Find the Title, mID and Rating of movies that were created before the year 2000, and Rating >2

SELECT M.Title, M.mID, R.Rating
FROM Movie M
JOIN Ratings R ON M.mID = R.mID
WHERE M.Year < '2000'
AND R.Rating > 2;

# Sort all of the movies by descending Rating.

SELECT M.Title, M.mID, R.Rating
FROM Movie M
JOIN Ratings R ON M.mID = R.mID
ORDER BY R.Rating DESC;


# find all movies that have the exact same rating
select mID, Rating, count(*) as total 
from Ratings group by mID, Rating
having count(*) > 1;

# create a query that looks for a movie's ID, title, and director
# but only if it has a rating above 4.

SELECT M.Title, M.mID, M.Director, R.Rating
FROM Movie M
JOIN Ratings R ON M.mID = R.mID
WHERE R.Rating > 4;










