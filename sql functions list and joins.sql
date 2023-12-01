use hr;

Select l.city, count(e.employee_id) as no_of_emp 
from employees e
left join departments d 
on e.department_id = d.department_id 
left join locations l 
on d.location_id = l.location_id
group by l.city
order by no_of_emp DESC;


SELECT d.department_name,
    d.department_id,
	e.department_id,
    count(e.employee_id)
	from departments d 
	left join employees e
	on (e.department_id =
		d.department_id)
	where e.department_id is null
    group by d.department_id;
    
#Self Join;

select e.employee_id, e.last_name, s.manager_id, s.last_name 
from employees e left join 
employees s on e.employee_id = s.employee_id;

#or

select e.employee_id, e.last_name, s.manager_id, s.last_name 
from employees e left join 
employees s on e.employee_id = s.manager_id;

#or
select e.employee_id as emp_id,
		e.last_name as emp_last_name,
        m.employee_id as mgr_id,
        m.last_name as mgr_last_name
        from employees e
        left join employees m
        on e.manager_id=m.employee_id;


select e.employee_id, j.job_id,j.job_title, e.first_name, 
e.salary-j.min_salary as diff_in_sal
from employees e left join jobs j on e.job_id = j.job_id;

select e.employee_id as emp_id, e.first_name, e.last_name, 
j.job_id, e.salary, j.start_date, j.end_date from employees e
left join job_history j on e.employee_id = j.employee_id
where salary > 10000
order by salary DESC;

#or
select j.*, e.salary from job_history j
left join employees e
on j.employee_id = e.employee_id
where salary > 10000
order by salary DESC;

SELECT first_name, last_name, 
	hire_date, salary, 
	(DATEDIFF(now(), hire_date))/365 Experience 
	FROM departments d 
	JOIN employees e 
	ON (d.manager_id = e.employee_id) 
	WHERE (DATEDIFF(now(), hire_date))/365>15;
    
    #rank
    
    SELECT 
	first_name, 
	last_name, 
	salary, 
	RANK() OVER (ORDER BY salary desc) salary_rank
FROM 
	employees;
    
    
    SELECT 
    department_id,
    employee_id,
    first_name, 
    last_name,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM 
    employees;
    
    select *
from (
SELECT 
    department_id,
    employee_id,
    first_name, 
    last_name,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary desc) AS salary_rank
FROM 
    employees) table1 
    where salary_rank=1;
    
  SELECT 
    department_id,
    employee_id,
    first_name, 
    last_name,
    salary,
    SUM(salary) OVER (PARTITION BY department_id) AS total_salary_per_department,
    AVG(salary) OVER (PARTITION BY department_id) AS average_salary_per_department
FROM 
    employees;  
    
    #common table expression
    WITH EmployeeAnnualSalary AS (
    SELECT
        employee_id,
        first_name  AS employee_name,
        salary,
        salary * 12 AS annual_salary
    FROM employees
)
SELECT
    employee_name AS employee,
    salary,
    annual_salary
FROM EmployeeAnnualSalary
where annual_salary>100000;
    
    
    #temp table
    CREATE TEMPORARY TABLE new_tbl 
SELECT * FROM employees LIMIT 100;

select * from new_tbl;
    
    
    
    #view table - storing a set of commands as an object, which doesn't execute. 
    
   CREATE OR REPLACE VIEW IT_Department_Employees AS
SELECT employee_id, first_name  AS employee_name, 
salary
FROM employees
WHERE department_id = 90;

     #can use the commands elsewhere
    SELECT employee_name, salary
FROM IT_Department_Employees;

#Create Tables:

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO Persons (PersonID,LastName,FirstName,Address,City)
Values(101, "Hardy","Tom","Nj,USA","Nj");


#update table

INSERT INTO Persons (PersonID,LastName,FirstName,Address,City)
Values(101, "Hardy","Tom","Nj,USA","Nj")

select * from persons
update persons
set LastName ="Hardy", City="Phl"
where customerID=101;

#or

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO Persons (PersonID,LastName,FirstName,Address,City)
Values(101, "Hardy","Tom","Nj,USA","Nj")

select * from persons;

update persons
set LastName ="Hardy", City="Phl"
where PersonID=101;