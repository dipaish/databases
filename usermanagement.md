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
