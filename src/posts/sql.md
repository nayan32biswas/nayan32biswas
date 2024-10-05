# SQL With example

This doc mainly follow the tutorial from [Giraffe Academy](https://www.giraffeacademy.com/databases/sql/).

Install mysql and `mysqlworkbench` from [HERE](https://linuxhint.com/installing_mysql_workbench_ubuntu/).

## Schema

Explore the database schema [here](https://github.com/nayan32biswas/nayan32biswas/blob/main/src/assets/pdf/company-database.pdf) or in local file "`../assets/pdf/company-database.pdf`".

## Create Schema

`sudo mysql -u root -p`

```sql
CREATE DATABASE IF NOT EXISTS company;
use company;

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40), last_name VARCHAR(40), birth_day DATE, sex VARCHAR(1), salary INT,
  super_id INT, branch_id INT
);
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
  branch_id INT PRIMARY KEY, branch_name VARCHAR(40), mgr_id INT, mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
-- Create constraint after creating the branch table
ALTER TABLE employee ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;
ALTER TABLE employee ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

DROP TABLE IF EXISTS client;
CREATE TABLE client (
  client_id INT PRIMARY KEY, client_name VARCHAR(40), branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
DROP TABLE IF EXISTS works_with;
CREATE TABLE works_with (
  emp_id INT, client_id INT, total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);
DROP TABLE IF EXISTS branch_supplier;
CREATE TABLE branch_supplier (
  branch_id INT, supplier_name VARCHAR(40), supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
```

## Insert data

```sql
-- INSERT BRANCH
INSERT INTO branch VALUES(1, 'Corporate', null, '2006-02-09'), (2, 'Scranton', null, '1992-04-06'), (3, 'Stamford', null, '1998-02-13'), (4, "Upcoming", NULL, NULL);
-- INSERT EMPLOYEE
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL), (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1), (102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL), (103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2), (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2), (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2), (106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL), (107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3), (108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);
-- UPDATE EMPLOYEE WITH BRANCH_ID and 
UPDATE employee SET branch_id = 1 WHERE emp_id = 100;
UPDATE employee SET branch_id = 3 WHERE emp_id = 106;
UPDATE employee SET branch_id = 2 WHERE emp_id = 102;
-- UPDATE BRANCH WITH MANAGER_ID
UPDATE branch SET mgr_id = 100 WHERE branch_id = 1;
UPDATE branch SET mgr_id = 106 WHERE branch_id = 3;
UPDATE branch SET mgr_id = 102 WHERE branch_id = 2;
-- INSERT BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper'), (2, 'Uni-ball', 'Writing Utensils'), (3, 'Patriot Paper', 'Paper'), (2, 'J.T. Forms & 
Labels', 'Custom Forms'), (3, 'Uni-ball', 'Writing Utensils'), (3, 'Hammer Mill', 'Paper'), (3, 'Stamford Labels', 'Custom Forms');
-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2), (401, 'Lackawana Country', 2), (402, 'FedEx', 3), (403, 'John Daly Law, LLC', 3), (404, 'Scranton Whitepages', 2), (405, 'Times Newspaper', 3), (406, 'FedEx', 2);
-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000), (102, 401, 267000), (108, 402, 22500), (107, 403, 5000), (108, 403, 12000), (105, 404, 33000), (107, 405, 26000), (102, 406, 15000), (105, 406, 130000);
```

## Query

### Basic Query

```sql
--- Find all employees
SELECT * FROM employee;
```

```sql
-- Find all employees ordered by salary
SELECT * from employee ORDER BY salary ASC/DESC;
```

```sql
-- Find all employees ordered by sex then name
SELECT * FROM employee order by sex ASC/DESC;
```

```sql
-- Find the first 5 employees in the table
SELECT * FROM employee ORDER BY emp_id LIMIT 5;
```

```sql
-- Find the first and last names of all employees
SELECT employee.first_name, employee.last_name FROM employee;
```

```sql
-- Find the forename and surnames names of all employees
SELECT employee.first_name AS forename, employee.last_name AS surname FROM employee;
```

```sql
-- Find out all the different genders
SELECT DISTINCT sex FROM employee;
```

```sql
-- Find all male employees
SELECT * FROM employee where employee.sex = 'M';
```

```sql
-- Find all employees at branch 2
SELECT * FROM employee where employee.branch_id = 2;
```

```sql
-- Find all employee's id's and names who were born after 1969
SELECT employee.first_name FROM employee where employee.birth_day >= '1970-01-01';
```

```sql
-- Find all female employees at branch 2
SELECT * FROM employee where employee.branch_id = 2 AND employee.sex = 'F';
```

```sql
-- Find all employees who are female & born after 1969 or who make over 80000
SELECT * FROM employee where (employee.birth_day >= '1970-01-01' AND employee.salary > 80000) OR employee.sex = 'F';
```

```sql
-- Find all employees born between 1970 and 1975
SELECT * FROM employee where employee.birth_day BETWEEN '1970-01-01' AND '1976-12-31';
```

```sql
-- Find all employees named Jim, Michael, Johnny or David
SELECT * FROM employee where employee.first_name IN ('Jim', 'Michael', 'Johnny', 'David');
```

### Functions

```sql
-- Find the number of employees
SELECT COUNT(super_id)
FROM employee;
```

```sql
-- Find the average of all employee's salaries
SELECT AVG(salary) FROM employee;
```

```sql
-- Find the sum of all employee's salaries
SELECT SUM(salary) FROM employee;
```

```sql
-- Find out how many males and females there are
SELECT COUNT(sex), sex FROM employee GROUP BY sex;
```

```sql
-- Find the total sales of each salesman
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY client_id;
```

```sql
-- Find the total amount of money spent by each client
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id;
```

### Wildcard

- `%` = any # characters
- `_` = one character

```sql
-- Find any client's who are an LLC
SELECT * FROM client WHERE client_name LIKE '%LLC';
```

```sql
-- Find any branch suppliers who are in the label business
SELECT * FROM branch_supplier WHERE supplier_name LIKE '% Label%';
```

```sql
-- Find any employee born on the 10th day of the month
SELECT * FROM employee WHERE birth_day LIKE '_____10%';
```

```sql
-- Find any clients who are schools
SELECT * FROM client WHERE client_name LIKE '%Highschool%';
```

### Union

```sql
-- Find a list of employee and branch names
SELECT employee.first_name AS Employee_Branch_Names FROM employee
UNION
SELECT branch.branch_name FROM branch;
```

```sql
-- Find a list of all clients & branch suppliers' names
SELECT client.client_name AS Non-Employee_Entities, client.branch_id AS Branch_ID FROM client
UNION
SELECT branch_supplier.supplier_name, branch_supplier.branch_id FROM branch_supplier;
```

### Joins

```sql
-- Find branches with their associate manager name
SELECT branch.*, employee.first_name FROM branch JOIN employee ON branch.mgr_id = employee.emp_id;
```

```sql
-- Find branches with/without their associate manager name
SELECT branch.*, employee.first_name FROM branch LEFT JOIN employee ON branch.mgr_id = employee.emp_id;
```

### Nested Query

```sql
-- Find names of all employees who have sold over 50,000
SELECT employee.first_name, employee.last_name FROM employee WHERE employee.emp_id IN (
  SELECT works_with.emp_id FROM works_with WHERE works_with.total_sales > 50000
);
```
