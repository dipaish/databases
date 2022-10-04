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
***Example 1: To create a table named author***

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
### DESCRIBE [table_name];
### DROP TABLE
### ALTER TABLE
### INSERT INTO  <table_name> values(value1,value2,....);
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
