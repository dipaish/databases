# Working with Tables - CH3
### CREATE TABLE
- `CREATE TABLE` statement is used to create a table within a database. 

- ***Always remember to select a database before executing any SQL statement***

**Syntax**

```sql
CREATE TABLE table_name
(
column_name1 data_type(size),
column_name2 data_type(size),
column_name3 data_type(size),
...
);
```
***Example 1: To create a table named author including columns aut_id, aut_fname, country, home_city, created_at***

```sql
# you need to select the database to work with, I am going to use mydb1
use mydb1;
CREATE TABLE author 
(
aut_id INT AUTO_INCREMENT PRIMARY KEY, 
aut_fname VARCHAR(50) NOT NULL,
country VARCHAR(25) NOT NULL,
home_city VARCHAR(25),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
***Example 2: To create a table named students including columns student_id,fname, lname, and country.***

```sql
CREATE TABLE students( 
student_id INT AUTO_INCREMENT PRIMARY KEY, 
fname varchar(100),
lname varchar(100),
country varchar(100),
);
```

***Example 3: To create the structure of a table dup_students similar to countries.***
- To copy the table structure or to create a table that is identical to another by using ***Like***


```sql
CREATE TABLE IF NOT EXISTS dup_students
LIKE students;
```

***Example 4: To create a duplicate copy of students table including structure and data.***
- Use `AS SELECT` to copy the data (either selective or total) or table structure to a new table. 

```sql
CREATE TABLE IF NOT EXISTS dup_students1
AS SELECT * FROM  students;
```

***Example 5: To create a table using `MySQL CHECK Constraint` & to check the age of a person is greater than 18.***
- The **CHECK constraint** limits the value range that is it allows only certain types of values for the column.

```sql
CREATE TABLE students_age( 
student_id INT AUTO_INCREMENT PRIMARY KEY, 
fname varchar(100),
lname varchar(100),
country varchar(100),
age int CHECK (age>=18)
);

# lets try to insert some data into the table
insert into students_age(age) values 
(17),
(18),
(20);

/* You will get an error message as below since one of the age is 17 which is less than or equal to 18
13:44:03	insert into students_age(age) values  (17), (18), (20)	Error Code: 3819. Check constraint 'students_age_chk_1' is violated.	0.000 sec
*/

# now lets have values that do not violate the defined check constraint

insert into students_age(age) values 
(21),
(18),
(20);

# the values are now inserted
```

***Example 6: Using Not Null constraint.***
- The column can hold null values by default therefore to enforce a value for a column, you can use **NOT NULL**.
- **NOT NULL**. means a value must be provided when inserting a new record or updating the existing one. 
- Lets create a new table students_age1 table NOT NULL columns. 

```sql
#to insert a new record, you must  include values for fname and lname
CREATE TABLE students_age1( 
student_id INT AUTO_INCREMENT PRIMARY KEY, 
fname varchar(100) NOT NULL,
lname varchar(100) NOT NULL,
country varchar(100),
age int CHECK (age>=18)
);

#lets insert some values 
insert into students_age1(fname,lname,age) values 
('Pekka','Smith',21),
('Juha','Honkanen',18);

#to fetch all records from the table
select * from students_age1;
```

***Example 7: Using Default constraint.***

- The **default** constraint is used to set a default value for a column.
- When you are adding a new record and you don't specify the value, the default value will be added.

```sql
# creating a table with defualt country as Finland & defaul city as Helsinki
# creating a table with defualt country as Finland & defaul city as Helsinki
CREATE TABLE students_age2( 
student_id INT AUTO_INCREMENT PRIMARY KEY, 
fname varchar(100) NOT NULL,
lname varchar(100) NOT NULL,
city varchar(100) DEFAULT 'Helsinki',
country varchar(100) DEFAULT 'Finland',
age int CHECK (age>=18)
);

#lets insert some values 
insert into students_age2(fname,lname,age) values 
('Pekka','Smith',21),
('Juha','Honkanen',18);
# if you sepcify the column name, you must use DEFAULT keyword TO insert the default value
insert into students_age2(fname,lname,age,city,country) values 
('Pekka','Smith',21,'Oulu','Finland'),
('Juha','Honkanen',18, DEFAULT, DEFAULT);

#to fetch all records from the table
select * from students_age2;
```
***Example 8: CREATE TEMPORARY TABLE.***

- `TEMPORARY` keyword can be used to create a temporary table. 
- TEMPORARY table is only visible to the current connection, and dropped automatically with the connection closed.

```sql
CREATE TEMPORARY TABLE temp1 SELECT * FROM students_age2;
```

### DESCRIBE [table_name]
- Describes  the columns and default values for a table. 

***Example: To describe the table students***

```sql
DESCRIBE students;
```

### DROP TABLE
- The `DROP TABLE` statement is used to delete one or more tables from an existing database. 
- It removes all the data and table definition from the database.


***Example: To drop the table students***
```sql
DROP TABLE students;
# to drop multiple tables, use comman and type table names that you want to drop 
drop table newauthor, copy_book_rec;
```

### TRUNCATE TABLE
- The `TRUNCATE TABLE` statement is used to delete only the data of a table but not the table.

***Example: To truncate the table students_age2***

```sql
TRUNCATE TABLE students_age2;
```


### INSERT INTO  <table_name> values(value1,value2,....);
### ALTER TABLE
### SELECT: To retrieve rows from one or more tables
### MySQL Constraint (Primary Key, Unique, Foreign Key)
### CREATE TABLE with NULL CONSTRAINT
### CREATE TABLE  with CHECK CONSTRAINT
### CREATE TABLE  with UUNIQUE CONSTRAINT 
### CREATE TABLE with DEFAULT CONSTRAINT
### CREATE TABLE with AUTO INCREMENT
### CREATE TABLE with PRIMARY KEY CONSTRAINT on single column
### CREATE TABLE PRIMARY KEY on multiple columns
### CREATE table with FOREIGN KEY CONSTRAINT
