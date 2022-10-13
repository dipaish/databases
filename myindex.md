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

## CREATE VIEW
- CREATE VIEW statement is used to create a view  of a table or of multiple tables. 
- A view is like a **virutal table** that does not acutally contain any data but rather the reulstant of a base table. 
- If data changes in the base table, the same change is reflected in the view. 
- You can add SQL statements and functions to a view. 

**Syntax**
```
CREATE VIEW view_name AS
SELECT col1, col2, ...
FROM table_name
WHERE condition;
```
**Examples**
```sql
# Use school database
use school;

# Create a view from student table to get all students from Helsinki
CREATE VIEW view1 AS
SELECT studentId,fname, lname, city 
from student
where city='Helsinki';

# Lets retrieve records from view1
select * from view1;

```

### UPDATE VIEW
- You can update view with `CREATE OR REPLACE VIEW` statement. 
- Lets update view1 and include gender & birthdate to the view.

```sql
#Updating view with CREATE OR REPLACE VIEW statememnt
CREATE OR REPLACE VIEW view1 AS
SELECT studentId,fname, lname, city,birthDate,gender 
from student
where city='Helsinki';
```

### Deleting a VIEW
- You can delete view with the `DROP VIEW` statement. 
**Syntax**
```
DROP VIEW view_name;
```
**Examples**

```sql
# to delete the view named view1
DROP VIEW view1
```