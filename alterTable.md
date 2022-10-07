## ALTER 



## Update 
- UPDATE statement is used to update columns of existing rows in a table with new values.
- For a single table, the UPDATE statement updates columns of existing rows in the named table with new values.
-  Specific columns can be modified using the SET clause by supplying new values for that column.
- The WHERE clause can be used to specify the conditions those identify which rows to update. Without using WHERE clause, all rows are updated.
- The ORDER BY clause is used to update the order that is already specified.
- The LIMIT clause specifies a limit on the number of rows that can be updated.

```sql
Syntax: UPDATE table_name SET columnname=value condition;
```
**MySQL Update Examples**
```sql
# lets use the classicmodels database and the author table
use classicmodels;

/* this will update the entire column country with a new value Finland however by 
 by default the safe update mode is used and wont update values. If you want you can disable it. */
UPDATE author SET country='Finland'; # this won't work as we have safe update

#the following won't work either as we have multiple records with country UK
UPDATE author SET country='Finland' WHERE country = 'UK'; 

# lets try to limit thr result set to 4
UPDATE author SET country='Finland' WHERE country = 'UK' limit 4;

# lets update Contry for author whose aut_id = 'AUT002'
UPDATE author SET country='Finland' WHERE aut_id = 'AUT002';

#lets feth products from Motorcycles productline.
select * from products;
select productLine, buyPrice from products
where productLine = 'Motorcycles';

#lets increase the buy price by 10%
update products set buyPrice = buyPrice + (0.1*buyPrice) where productLine = 'Motorcycles' ;

#lets add a new column called oldbuyPrice to the table 
alter table products 
add column oldbuyPrice decimal(10,2) 
after  buyPrice;

#lets get the old price to the column 
update products set oldbuyPrice = buyPrice - (0.2*buyPrice) 
where productLine = 'Motorcycles' ;

#lets check the record
select productLine, buyPrice, oldbuyPrice from products
where productLine = 'Motorcycles';
```

## Delete 
- The MySQL Delete statement is used to delete data from a table

**Syntax:** 
```sql
Delete from table_name 
where condition;

# Examples: 
# to delete products 
delete from table1 where id = 1; ¨
```

## Joins 
- MySQL Join enables you to retrieve records 
from two (or more) logically related tables in a single result set.
- In most of the cases, the join key is the primary key of one table and a foreign key in another table. 
- The join is possible as long as data in columns are matching.
- MySQL supports the following joins:
    1. Inner Join
    2. Left Join
    3. Right Join 
    4. Cross Join

```sql
# Lets create two tables to practice joins 

CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);
 
CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

# insert some records into the tables members & committees
INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');
 
INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');

#lets check data from tables 
SELECT * FROM members;
SELECT * FROM committees;
```
### Inner JOIN 
- A JOIN in which all rows can be selected from both
 participating tables as long as there is a match between the columns. 

**Syntax:**
```sql
SELECT column_list FROM table_1
INNER JOIN table_2 ON join_condition;
```
***Inner Join Example***

```sql
SELECT 
m.member_id, 
m.name members, 
c.committee_id, 
c.name committe_name
FROM
members m
INNER JOIN committees c 
ON c.name = m.name;
```

### LEFT JOIN 
- It joins by fetching all records from the table on the left side of the join statement. 
- If the record fetched from the left, does not have a matching value on the right side
of the join, it returns a NULL value. 
- It means left join selects all data form the left table even if it does not find a matching
value on the right. 

**Syntax:**

```sql
SELECT column_list 
FROM table_1 
LEFT JOIN table_2 ON join_condition;
```

***Example 1 : Left join to join the members with the committees table***

```sql
SELECT 
    m.member_id, 
    m.name members, 
    c.committee_id, 
    c.name committee
FROM
    members m
LEFT JOIN committees c USING(name);
```

***Example 2: Left join with a where clause to find members who are not the committee members***

```sql
SELECT 
    m.member_id, 
    m.name members, 
    c.committee_id, 
    c.name committee
FROM
    members m
LEFT JOIN committees c USING(name)
WHERE c.committee_id IS NULL;
```

### RIGHT JOIN
- It is very similar to left join except for the fact that the records are fetched from the 
right side of the join statement even if no matching record is not found on the left.
- If no matching record is found on the left, it returns NULL.

**SYNTAX**
```sql
SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 ON join_condition;
```

***Example 1: Right join to join members and committees***

```sql
SELECT 
    m.member_id, 
    m.name members, 
    c.committee_id, 
    c.name committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;
```

### CROSS JOIN
- It inlcudes a complete cross product of two tables. 
- For each recrod in the first table, all records in the second table are joing which 
creates a huge result set. 
- CROSS JOIN  does not have a join condition. 
- If first table has n rows and second table m. The cross join will produce n*m rows.

**SYNTAX**

```sql
SELECT select_list
FROM table_1
CROSS JOIN table_2;
```

***Example Cross Join***

```sql
SELECT 
    m.member_id, 
    m.name members, 
    c.committee_id, 
    c.name committee
FROM
    members m
CROSS JOIN committees c;
```

## Functions

- A function is simpy a stored program that you can pass parameters into which then returns a value. 
- MySQL Comparison Functions : between and,  not between and ,like, not like ......
- MySQL Control Flow Function: case operator, if() , ifnull(), nullif()
- MySQL String Functions: ascii, bin, lower
- MySQL Mathematical Functions: DIV, MOD, 
- MySQL Data & Time Functions:
- MySQL Encryption and Compression Functions:ENCRYPT(), SHA1(), MD5()

> Note: For more information and reading : https://dev.mysql.com/doc/refman/8.0/en/functions.html 
List of Functions & Operators: https://dev.mysql.com/doc/refman/8.0/en/func-op-summary-ref.html
https://www.mysqltutorial.org/mysql-functions.aspx/

```sql
# will return a date after adding 10 days with the specified date.
SELECT ADDDATE('2019-11-25', INTERVAL 10 DAY) as required_date;

# will return a date after adding 10 Months with the specified date.
SELECT ADDDATE('2019-11-15', INTERVAL 10 MONTH) as required_date;

# will return a date after adding 2 years  with the specified date.
SELECT ADDDATE('2019-11-15', INTERVAL 2 YEAR) as required_date;

 # will return the current date and time in ‘YYYY-MM-DD HH:MM:SS’ format.
 SELECT CURRENT_TIMESTAMP();

 #will return the current time
 SELECT CURDATE();
 

/* MySQL Count
It returns the count of an expression. 
It includes only records in the count that is it does not inlcude a NULL value. */
select count(customerNumber) from customers;

/* MySQL MAX
Returns the maximum value of an expression.
*/
SELECT MAX(SALARY) from EMPLOYEES ;

select * from Employees;
SELECT DEPARTMENT_ID, MAX(SALARY) from EMPLOYEES group by DEPARTMENT_ID;

/*  MySQL MIN
It returns the minimun value of an expression. 
*/
SELECT MIN(SALARY) from employees ;
SELECT DEPARTMENT_ID, MIN(SALARY) from EMPLOYEES group by DEPARTMENT_ID;

/* MySQL AVG
It returns the average value of an expression.
*/
SELECT AVG(SALARY) from employees ;
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

/* MySQL LENGTH
It returns the length of the string.
*/
select length('hello world');

/* MySQL LOWER
It converts all characters to lowercase.
*/
Select lower('HELLO WORLD');

# PASSWORD
/* 
- sha1(str) : It calculates the 160-bit checksum for the given string. 
- sha2(str, hash_length): It calcualtes the SHA-2 family of hash functions. Works only if MySQL has been configured with SSL support. Desired length: 224, 256, 348, 512 or 0 (equivalent to 256)

Read More: https://dev.mysql.com/doc/refman/5.6/en/encryption-functions.html#function_password.
*/
SELECT SHA1('abc');
SELECT SHA2('ABC', 224);
```

## INDEX
- `CREATE INDEX` statement is used to create indexes in tables
- Allows the database application to find data quickly & efficiently (without reading the whole table)
- When using where clause, MySQL use indexes to find the rows quickly
-  You can also create a unique index that is duplicate values are not allowed

**Syntax:** 

```sql
CREATE INDEX index_name on table_name (column_name);
CREATE UNIQUE INDEX index_name on table_name (column_name);
```
**Index Examples**

```sql
CREATE TABLE table3(
   id INT,
   fullname VARCHAR(60) NOT NULL,
   address  VARCHAR(80) NOT NULL
);
# creating index
CREATE INDEX ind_fn on table3 (fullname);
CREATE INDEX in1 on table3 (fullname, address);

# SHOW INDEXES FROM  table_name;
show indexes from table3;

# Dropping indexes
#Syntax: DROP INDEX index_name ON table_name;

drop index ind_fn on table3;
drop index in1 on table3;
```
## VIEW

## User Management

- Authentication is verifying the identity of user or entity or any resource. 
- Important to create unique username and passwords for accessing a database service
- Managing database users is to control what database users can and cannot do. 
	- Privieleges to a single database : database specific privileges
    - To audit activity that occurs in the system. 
    - Grant special permissions or privileges
		-  To maintain the database server or process
        -  To manage user accounts
        - To monitor security 
        - To manage a database(s)
        - Administrative roles
        - Granular privileges
	- To apply restrictions 
		- Limitations to particular hosts, databases or views
        - Limitations on number of connections and queries

### `CREATE USER` 
- It is used to create a new user in the database server. 
**Syntax:**
> CREATE USER user_name@hostname identified by 'password';

- `hostname` is the name of the host from which the user can connect to the MySQL server. It is  optional and if not provided, the user can connect from any host.

```sql
#Examples of creating database user

#can connect from localhost
create user user_name@localhost identified by 'password'; 

# can connect from any host
create user user_name1 identified by 'password'; 

# To display list of database users
select user from mysql.user;

# to display username, host, account_locked and password_expired field 
SELECT user, host, account_locked, password_expired FROM mysql.user;
  ```  
 
### Grant privieleges
- Creating user does not grant any privileges to the user. GRANT statement should be used to grant privileges to the user
- Grant privilege or privileges. 
- If multiple privileges, use commas to separate them

**Syntax**

```sql
GRANT privilege [,privilege],.. 
ON privilege_level 
TO user_name;
```

```sql
use bookinfo;
grant select on bookinfo.* to user1@localhost;

# to show grants for a specific user 
show grants for user1@localhost;

# to show grants for a root user 
show grants for root@localhost;
```
### User Management with MySQl Workbench
- Lets create an user account and provide the user with database specific privieleges.
- Make a new connection with this user info and display databases for this user. 
- Try writing some sql queries such as create database dbname; 

## SQL cheat sheet 
- https://cdn.sqltutorial.org/wp-content/uploads/2016/04/SQL-cheat-sheet.pdf

## Database Import & Export 
