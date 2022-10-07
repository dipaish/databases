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

## Databases Import & Export

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

# to retrive missing or unkwnown value, you can use the 'IS NULL' operator. 
# null does not refer to an empty value, 0 or an empty string. 
# to retrive if teacherid is missing the course table. 
SELECT * FROM course 
WHERE teacherId IS NULL;


```
***Exmaple 6: To retrieve data with DISTINCT clause.***

***Exmaple 8: To retrieve data with IN operator.***

NOT IN 
BETWEEN 
LIKE
LIMIT
IS NULL


## ALTER 



## Update 

## Delete 

## Joins 

## Functions

### Aggregate Functions

## INDEX

## VIEW

## User Management

