## ALTER Table 
- Alter table command is used to change the structure of an existing table
    - To add or delete columns 
    - To create or destroy indexes 
    - To change the type of existing columns 
    - To rename columns or the table itself

```sql
# Create a table "mytable "
CREATE TABLE mytable (
id INT,
name VARCHAR(50)
 );

 # to rename the table : mytable >> table1
 ALTER TABLE mytable RENAME to table1;
 
 # You can also rename as below:  mytable >> table1
 ALTER TABLE mytable RENAME table1;
 
# to change the data type of a column : lets change the data type of id column from INTEGER to TINYINT
ALTER TABLE table1 MODIFY id TINYINT NOT NULL;

# renaming the column name, name to fullname
ALTER TABLE table1 CHANGE name fullname VARCHAR(25);

# Adding a new TimeStamp column : by default it is added as the last column
ALTER TABLE table1 ADD createdon TIMESTAMP;

# adding a new column as the first column 
ALTER TABLE table1
ADD groupid varchar(10)  FIRST;

# adding a new column or columns after a specific column 
ALTER TABLE table1
ADD emailid varchar(50)  AFTER fullname,
ADD city varchar(50)  AFTER emailid;

# in table1 we do not have a primary key so lets make id as a primary key
ALTER TABLE table1
ADD PRIMARY KEY (id);

# dropping a primary key
ALTER TABLE table1
DROP PRIMARY KEY;

#Dropping a column 
ALTER TABLE table1 drop column createdon;

# ALter changing column definition
# To change column ”name” from char(20) to char(40)
ALTER TABLE test MODIFY name CHAR(40);

# To change column ”name”  into ”fname” from char(40) to char (30)
ALTER TABLE test CHANGE name fname char(30);

# To make id NOT NULL with default value
ALTER TABLE test MODIFY id INT NOT NULL DEFAULT 1000;

# Changing column’s default value
ALTER TABLE test ALTER id SET DEFAULT 100;

# To remove default constraint
ALTER TABLE test ALTER id DROP DEFAULT;

```
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
delete from table1 where id = 1; 
```

## SQL cheat sheet 
- [Link](https://learnsql.com/blog/sql-basics-cheat-sheet/sql-basics-cheat-sheet-a4.pdf)


