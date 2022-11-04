## INSERT INTO
- It is used to insert new records in a table. 

***Syntax***
```sql
INSERT INTO table_name (field_one, field_two) VALUES ('value_one', 'value_two');

```
**Example 1: To insert single row**
```sql
INSERT INTO table_name (col1,col2) VALUES (15,'test');
```

**Example 2: To insert multiple rows**

- You can insert multiple rows at once by including multiple lists of column values, each enclosed within parentheses and separated by 
commas.
```sql
INSERT INTO table_name (col1,col2) VALUES 
    (15,'test'),
    (16,'hello'),
    (29,'world');
```

## INSERT with AUTO_INCREMENT
- When a table has an AUTO_INCREMENT PRIMARY KEY, it is not required to insert into that column. 
- You can simply specify all the other columns except the one with AUTO_INCREMENT. 

```sql
/*  the table below has teacher_id as auto_increment therfore we don't need to mention the column name nor the value for teacher_id column */
CREATE TABLE teachers9( 
teacher_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fname varchar(100),
lname varchar(100),
country varchar(100),
email varchar(100) NOT NULL UNIQUE
);

# to insert values 
INSERT INTO teachers9 (fname,lname,country,email) VALUES
('John', 'Smith', 'Finland', 'john.smith@gmail.com')
```

>Note: if you are adding values for all columns of the table, it is not required to specify the columns name however you need to make sure that the value is in the same order as the columns in the table. 

```sql
INSERT INTO table_name VALUES 
    (15,'test'),
    (16,'hello'),
```
## SELECT 
- The `SELECT` statement is used to retrieve records from one or more tables.
- The query begins with the `SELECT` keyword, specify the columns names that you want to retrieve or use * to get all columns. 
- FROM: Specify the table FROM WHICH data is to br retrieved.
- WHERE: You may also specify conditions based on which the data is retrieved. 

***Syntax***
```sql
SELECT [ALL or specific column(s)]  FROM TableName [WHERE conditions];
```
> We will use a sample database to practice retrieval of Data. Use the following SQL file to **import** the required database into your database server. 
[Sample Database](/sampleDb.sql)

**Sample Database - ER Diagram** 

It is always important to get familiar with the database that you are working on. 
![Sample Database Diagram](/assets/images/dmodel.png)

***Example 1: To retrieve data from a single column.***
- Specify the column name and the table from which you want to retrieve data

```sql
# to retrieve fname from the table student
SELECT 	fname FROM student;
```

***Example 2: To retrieve data from multiple columns.***

- Specify column names separated by comma(,) and the table from which you want to retrieve data

```sql
# to retrieve fname,lname,city from the table student
SELECT 	fname,lname,city FROM student;
```
***Example 3: To retrieve data from all columns.***

- You can either type in all column names separated with commas or use * sign.

```sql
# to retrieve all columns from the table student
SELECT * FROM student;
```

***Exmaple 4: To retrieve data with ORDER BY clause.***
- On retrieving records, the order of the result set is unspecified. 
- To specify the order of your data(records in a result set), you can use ORDER BY clause.
- The order can be  ascending (ASC) or descending (DESC)
- To order in ascensing order, you can simply use `order by`. 

```sql
/* to retrieve all columns from the table student & order the records by firstname in ascending order.
*/
SELECT * FROM student ORDER BY fname;

/* to retrieve all columns from the table student & order the records by firstname in descending order. */

SELECT * FROM student ORDER BY fname DESC;

/* to retrieve all columns from the table student & order the records by firstname in descending order and last name in ascending order. */

SELECT * FROM student ORDER BY fname DESC, lname ASC;

```

***Exmaple 5: To retrieve data with WHERE clause.***

- The WHERE clause allows you to specify a condition for retrieving records for instance you can retrieve sutdents from Helsinki. 
- The WHERE clause is also when updating and deleting records to specify which record to update or delete.
- You can use operators such as `AND`, `OR`, `IN`, `NOT IN`, `BETWEEN`, `LIKE`, `IS NULL` with the **WHERE clause**

```sql
# to retrieve all columns from the table student who are from Helsinki.
SELECT * FROM student WHERE city="Helsinki";

# to retrieve all male students from Helsinki - AND
SELECT * FROM student 
WHERE city="Helsinki" AND
gender='M';

# to retrieve all  students from Helsinki or Kerava - OR 
SELECT * FROM student 
WHERE city="Helsinki" or
city="Kerava"; 

# to retrieve teachers from teacher table whose salary is between 3000 - 3500 - BETWEEN
SELECT * FROM teachers
WHERE salary between 3000 and 4000;  

# you can also user order by to order based on salaries
SELECT * FROM teachers
WHERE salary between 3000 and 4000
order by salary;  

# to retrieve all students using IN operator who are located in Helsinki, Kerava or Espoo. 
SELECT * FROM student 
WHERE city IN ('Helsinki','Kerava','Espoo') ORDER BY city;

# to retrive missing or unkwnown value, you can use  'IS NULL' operator. 
# null does not refer to an empty value, 0 or an empty string. 
# to retrive if teacherid is missing the course table. 
SELECT * FROM course 
WHERE teacherId IS NULL;
```
### LIKE
- It is used with WHERE clause to define a pattern. 
- Two wildcard characters are available to define a pattern 
    - % : To match any string of zero or many characters. Example: `d%` matches all records starting with d
    - _ : to match a single character. Example: `d_` matches all records starting with d and is followed by any single character.   

```sql
# to retrieve all students whose first name starts with `L` from the table student
SELECT * FROM student where fname like 'l%';

# to retrieve all students whose last name ends with `ka` from the table student
SELECT * FROM student where lname like '%ka';

/* to retrieve all students whose last name starts with `l` and contain any character before i which is then followed by any number of characters. */

SELECT * FROM student where lname like 'l_i%';

```

## LIMIT
- The LIMIT clause will limit the number of rows that are to be returned. 
- It should always be used with ORDER BY clause as there can be issues because by default the select statement returns rows in an unspecified order which can result in unpredictable returns.

```sql
# it will get only 3 records
SELECT * FROM student ORDER BY lname LIMIT 3;

# it will get only 4 records
SELECT * FROM student ORDER BY lname LIMIT 4;


# LIMIT 2, 3 : it means it will start after the second row and will get 3 records
SELECT * FROM student
ORDER BY lname    
LIMIT 2, 3;
```

## DISTINCT 
- It is used to return distinct values
```sql
# this gets distinct cities from the student table
SELECT DISTINCT city FROM student;
# the count function is used to count the distinct cities from student table
SELECT COUNT(DISTINCT city) FROM student;
```

## Operators: 
- **Arithmetic Operators:**  + - * / % 
```sql
select 5+5;
select 5*5;
select 5/5;
```
- **Comparison Operators:** 
= Equal to, != not equal to, <> not equal to, >, <, >= ,<= ,!< Not less than , !> not greater than

```sql
# Create the table grade 
create table grades (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
course_name VARCHAR(255) NOT NULL,
grade int Not Null
); 
# insert records as below
insert into grades (name, course_name, grade) values
('Pekka', 'Windows OS', 5),
('Pekka', 'Data Processing ', 4),
('Pekka', 'Basics of Programming', 3),
('Pekka', 'Finnish 1', 2),
('Pekka', 'Orientation Studies', 3),
('John', 'Windows OS', 1),
('John', 'Data Processing ', 2),
('John', 'Basics of Programming', 3),
('John', 'Finnish 1', 4),
('John', 'Orientation Studies', 5),
('Markku', 'Windows OS', 0),
('Markku', 'Data Processing ', 0),
('Markku', 'Basics of Programming', 1),
('Markku', 'Finnish 1', 2),
('Markku', 'Orientation Studies', 1),
('Niina', 'Windows OS', 3),
('Niina', 'Data Processing ', 1),
('Niina', 'Basics of Programming', 4),
('Niina', 'Finnish 1', 2),
('Niina', 'Orientation Studies', 1),
('Sari', 'Windows OS', 4),
('Sari', 'Data Processing ', 3),
('Sari', 'Basics of Programming', 2),
('Sari', 'Finnish 1', 1),
('Sari', 'Orientation Studies', 0);

#check all records have been inserted into the table
select * from grades;

# create temporary table pekka_grades and list all grades for Pekka
create temporary table pekka_grades
select * from grades where name='Pekka';

#check you have listed all grades for Pekka
select * from pekka_grades;

#select grades for the course Windows OS
select * from grades where course_name='Windows OS';

# find students who have failed a course or courses
select * from grades where grade=0;

# find students whose grade is greater than 3 
select * from grades where grade>3;

# Use AVG(grade) and group by to get the average grade for all students
select name, AVG(grade) as 'Average Grade' from grades group by name;

# Calculate the average grade for each course
select course_name, AVG(grade) from grades group by course_name;
```