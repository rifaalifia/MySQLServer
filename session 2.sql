/* i am in multiline comment
i am also in a multiline comment */

# i am a single line cooment

create database november;

# select the database to be used
use november;

create table students (
id NUMERIC NOT NULL PRIMARY KEY, 
NAME VARCHAR(20) NOT NULL,  
age NUMERIC (2) NOT NULL, 
emailid VARCHAR(50) NOT NULL

);

# Alter command
# add a new column - city
alter table students add city varchar(20) not null;

desc students;

# delete a column - email id
alter table students drop emailid;
desc students;

# modify any column
alter table students modify id int not null auto_increment;
desc students;


###########################################################################

desc students;

#Insert command
insert into students (ID,Name, Age,City) values(01, "Rifa", 21,'Jakarta');
select * from students;

insert into students values(02, "Yasmin", 22,"Jakarta");
select * from students;

insert into students (Name,Age,City) values('Rifa',21,"Jakarta");
select * from students;

insert into students (Name,Age,City) values("John",28,"Jakarta");
select * from students;

insert into students (Name,Age,City) values("Tiara",25,"Amsterdam"),
("Amir",25,"Singapore"),("John",55,"London"),("Cristy",22,"Paris");

desc students;

### UPDATE COMMAND

update students set age=45 where id=3;
select * from students;

update students set age = 35, city ="London" where id=4;
select * from students;

#### DELETE Command - used to delete any entry in the table
delete from students where id=4;
select * from students;

####################################################################
#3 Data Query Language = Select

select * from students; # to get all data from table

select * from students limit 5;

select * from students where age<30;
select * from students where age>30;

select * from students where city = "Jakarta";
select * from students where city = "Jakarta" and age>20;
select * from students where city = "Jakarta" or age>20;

select id,age,city from students;
select id, age from students;

select id,age,city from students where city!="Jakarta" order by age;
select id,age,city from students where city!="Jakarta" order by age,id;
select id,age,city from students where city!="Jakarta" order by age desc;