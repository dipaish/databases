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