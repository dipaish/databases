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
aut_id INT, 
aut_fname VARCHAR(50) NOT NULL,
country VARCHAR(25) NOT NULL,
home_city VARCHAR(25),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
***Example 2: To create a table named students including columns student_id,fname, lname, and country.***

```sql
CREATE TABLE students( 
student_id INT, 
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

### CREATE TABLE with PRIMARY KEY CONSTRAINT

- Primary key **uniquely identifies** each record in a database table
- **Rules for Primary Key**
    - Must contain unique values and Not NULL
    - Most tables have a primary key
    - A table has only one primary key
    - Primary key column’s type should be an integer type (INT or BIGINT)
    - Primary key column often has **AUTO_INCREMENT** attribute that generates a unique sequence for the key automatically. 
    - The primary key sometimes may consist of multiple columns, the combination of values in these columns must be unique. (COMPOSITE Key)
- ***You can create a primary key in two ways***
    1. **Create table** 
    2. **Alter table**

***1. Defining Primary Key at the time of creating a table***

```sql
CREATE TABLE author1 
(
aut_id INT AUTO_INCREMENT PRIMARY KEY, 
aut_fname VARCHAR(50) NOT NULL,
country VARCHAR(25) NOT NULL,
home_city VARCHAR(25),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
>***Note: You can also specify the PRIMARY Key at the end of the CREATE TABLE statement as below:***

```sql
CREATE TABLE author11 
(
aut_id INT AUTO_INCREMENT, 
aut_fname VARCHAR(50) NOT NULL,
country VARCHAR(25) NOT NULL,
home_city VARCHAR(25),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(aut_id)
);
```
***2. Defining Primary Key with Alter Table statement***
- When the table is already created, you can use `ALTER TABLE` statement to create a **PRIMARY KEY**.

```sql
# note the author table was created eariler, lets add a primary key to the table
ALTER TABLE author
ADD PRIMARY KEY (aut_id);
```
### DELETE PRIMARY KEY
- To delete a **PRIMARY KEY** from a table, use `DROP PRIMARY KEY` with `ALTER TABLE` statement.

```sql
ALTER TABLE author
DROP PRIMARY KEY;
```

- If a columns has auto_increment then you first need to modify the column and drop the autoincrement
```sql
CREATE TABLE table_9 ( 
COL1 int auto_increment,
COL2 int,
COL3 varchar(40),  
PRIMARY KEY (COL1, COL2));
describe table_9;
# lets try to drop the primary key, it won't delete 
ALTER TABLE table_9 DROP PRIMARY KEY;
# LETS REMOVE THE AUTOINCREMENT FROM COL1
ALTER TABLE table_9 MODIFY COL1 INT NOT NULL;
#LETS REMOVE THE PRIMARY KEY
ALTER TABLE table_9 DROP PRIMARY KEY;
```
### CREATE TABLE with COMPOSITE KEY
- Composite key is simply PRIMARY KEY on multiple columns 
- Combination of two or more columns for uniquely identifying each row in the table
- There can be situation where multiple attributes are need to uniquely identify an entity. 
- A primary key made up of more than one attribute is called composite primary key. 

```sql
CREATE TABLE table1(
COL1 int,  
COL2 varchar(20),  
COL3 varchar(30),  
PRIMARY KEY (COL1, COL2)
);  
```
### CREATE TABLE with Foreign key
- MySQL foreign keys are used to link a column(s) between tables.
- Typically, a foreign key in one table points to the primary key in another table.
- You can define Foreign Key(s) at the time of **creating a table** with `CREATE TABLE` statement or with `ALTER TABLE` statement **when the table is already created.**

```sql
# Foreign key Create table statement
CREATE TABLE courses(
course_id int NOT NULL AUTO_INCREMENT,  
cname varchar(200) NOT NULL,
ects int NOT NULL,  
teacher_id int NOT NULL,  
PRIMARY KEY (course_id), 
/* specify what column is foreign key such as teacher_id in courses table is a foreign key that points to teacher_id in teachers table which is a primary key. 

- to name a foreign key or when you have to define foreign key on multiple columns:
CONSTRAINT FK_teacher_id FOREIGN KEY (teacher_id)
REFERENCES teachers(teacher_id)

*/
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);  

CREATE TABLE teachers( 
teacher_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fname varchar(100),
lname varchar(100),
country varchar(100)
);

# Dropping a foreign key: In MySQL Workbench, you can find the foreign key name by clicking on Foreign Keys 
/* 
Syntax: ALTER TABLE tablename
DROP FOREIGN KEY constraint_name;
*/
ALTER TABLE courses
DROP FOREIGN KEY foreignKeyName;

# creating foreign key when the table is already created
ALTER TABLE courses
ADD FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);   

# creating foreign key with the keyname when the table is already created
ALTER TABLE courses
ADD CONSTRAINT FK_teacher_id
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);

# Recommened reading on foreign key: https://www.mysqltutorial.org/mysql-foreign-key/ 

```
> Note, when you specify foreign keys, using tools such as phpmyadmin will generate ER diagram. 
- Get to [localhost:81](http://localhost:81)
- Type your username and password (root & password) to login to phpmyadmin
![phpmyadmin ER diagram](/assets/images/des.png)

### CREATE TEMPORARY TABLE

- `TEMPORARY` keyword can be used to create a temporary table. 
- TEMPORARY table is only visible to the current connection, and dropped automatically with the connection closed.

```sql
CREATE TEMPORARY TABLE temp1 SELECT * FROM students_age2;
```

### CREATE TABLE with NOT NULL CONSTRAINT

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

### CREATE TABLE  with CHECK CONSTRAINT

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
### CREATE TABLE with DEFAULT CONSTRAINT

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
### CREATE TABLE  with UNIQUE CONSTRAINT 

- Creates a constraint for a column whose values must be unique
- Unlike PRIMARY, it allows NULL values in the UNIQUE index
- A table can have multiple UNIQUE indexes.
- To ensure values are unique for columns like email, phone number etc

```sql
CREATE TABLE teachers1( 
teacher_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fname varchar(100),
lname varchar(100),
country varchar(100),
email varchar(100) NOT NULL UNIQUE
);
```
- To define Unique constraint on multiple columns
```sql
CREATE TABLE table5 (  
    id int auto_increment primary key,   
    name varchar(50),   
    email varchar(50), 
    phonenumber varchar(10),
    constraint uk_emphon unique (email, phonenumber)
);  
#to check if we have successfully added unique contstraints to the table
show index from table5;
#you may check by inserting duplicate values for email & phonenumber columns
```
- Adding Unique Key with Alter table statement

```sql
#Syntax 
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE(columns);
```
- Dropping Unique key
```sql
# Syntax: ALTER TABLE table_name  DROP INDEX constraint_name;
ALTER TABLE table5 DROP INDEX uk_emphon;
# Dropping Unique Key without the constraint name
ALTER TABLE table4 DROP INDEX Email;
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