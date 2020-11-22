/* I am comment in SQL
i am also a cooment
we are in a multiline cooment
*/

# I am a single line comment

# DDL - create
# How to create a database?

create database november;

# select the database to be used

use november;

CREATE TABLE students (
id NUMERIC(5) PRIMARY KEY NOT NULL, 
Name VARCHAR(20) NOT NULL, 
Age numeric (5) not null, 
emailid VARCHAR(50) NOT NULL
);

desc students;

# delete a table
drop table students;

