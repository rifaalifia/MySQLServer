# create table
create database regiment;

CREATE TABLE dataregiment (
regiment VARCHAR(20) NOT NULL, 
Company VARCHAR(20) NOT NULL, 
Name VARCHAR (20) NOT NULL, 
pretestscore numeric(5) NOT NULL,
posttestscore numeric(5) NOT NULL
);

desc dataregiment;

# add a new column - city
alter table dataregiment add id numeric(5) primary key not null;

# modify any column
alter table dataregiment modify id int not null auto_increment;
desc dataregiment;


insert into dataregiment (Regiment,Company,Name,Pretestscore,Posttestscore,Id) Values("Nighthawks","1st","Miller",4,25,01);
select * from dataregiment;

insert into dataregiment (Regiment,Company,Name,Pretestscore,Posttestscore) Values("Nighthawks","1st","Jacobson",24,94),
("Nighthawks","2nd","Ali",31,57),("Nighthawks","2nd","Milner",2,62),("Dragoons","1st","Cooze",3,70),("Dragoons","1st","Jacon",4,25),
("Dragoons","2nd","Ryanner",24,94),("Dragoons","2nd","Sone",31,57),("Scouts","1st","Sloan",2,62),("Scouts","1st","Piger",3,70),
("Scouts","2nd","Riani",2,62),("Scouts","2nd","Alii",3,70);
select * from dataregiment;

select regiment,company,name,id from dataregiment;

select * from dataregiment where regiment = "Dragoons";

select * from dataregiment where posttestscore > 50;

#### DELETE 
delete from dataregiment where id=4;
select * from dataregiment;

