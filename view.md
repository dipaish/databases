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