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