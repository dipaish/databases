# Database Design: 
###
- create tables with draw.io
- understand relationship and establish relationship between tables
- Decide primary and foreign keys
- Specify datatypes
# Installing MySQL Database Server & MySQL Workbench
# Connecting to MySQL server
# Working with Databases
### CREATE DATABASE: To create a database
- **CREATE DATABASE** statement is used to create a database.
- To create a database, you need to have the CREATE privilege for the database
- If the database already exists, you will get an error message when not specifying  **IF NOT EXISTS** clause
- Use meaningful and descriptive name for databases.The best practice is to use lowercase letters for your database names.

#### Syntax
```sql
CREATE DATABASE Database_Name;
```
###### Example 1: To create a database named mydb1
```sql
CREATE DATABASE mydb1;
```
### USE DATABASE_NAME: To set the Working/Default Database: 
- In order to work with the database, you must always specify the database to work with. 
- Creating a database does not make it a current database. 

### SHOW DATABASES;

### drop DATABASES;

### MySQL select database;

### SHOW tables; 

# Working with Tables
### CREATE TABLE
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
### Update
### DELETE
### CALUSE: WHERE,LIKE, AND & OR
### ORDER BY
### GROUP BY
### DISTINCT
### SORTING RESULTS
### MYSQL JOINS
### MYSQL FUNCTIONS