
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