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
- The `SELECT` statement is used to retrieve recors from one or more tables.
***Syntax***
```sql
SELECT [ALL or specific column(s)]  FROM TableName [WHERE conditions];
```
## ALTER 



## Update 

## Delete 

## Joins 

## Functions

### Aggregate Functions

## INDEX

## VIEW

## User Management

