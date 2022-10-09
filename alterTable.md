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
delete from table1 where id = 1; 
```

## SQL cheat sheet 
- https://cdn.sqltutorial.org/wp-content/uploads/2016/04/SQL-cheat-sheet.pdf


