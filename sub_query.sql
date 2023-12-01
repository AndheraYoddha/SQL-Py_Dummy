use hr;

SELECT max(salary)
from employees;

SELECT *
from employees
WHERE salary = (SELECT max(salary)
from employees);

select distinct (department_id)
from employees
where salary <7000;

select * from employees
where department_id in (50,80,100);


Select * from countries
Where region_id in (select );

select *
from employees
where department_id in (select distinct(department_id)
								from employees
								where salary <7000);

SELECT count(employee_id) as no_of_emp from employees
Where salary < (select avg(salary) from employees);

SELECT DISTINCT (department_id) from employees
WHERE first_name = 'STEVEN';

SELECT department_name from departments
WHERE department_id in (SELECT DISTINCT (department_id) from employees
WHERE first_name = 'STEVEN');

SELECT * from locations
where location_id = '1700';

Select department_id from departments
where location_id =1700;

SELECT first_name,last_name,employee_id from employees
Where department_id in (Select department_id from departments
where location_id =1700); 

SELECT employee_id from employees
where employee_id = 100;

SELECT * from job_history
WHERE start_date> (select hire_date from employees where employee_id = 100 );

SELECT hire_date from employees where first_name 
= "Steven" and last_name = "King";

SELECT * from employees
WHERE hire_date > (SELECT hire_date from employees where first_name 
= "Steven" and last_name = "King");

SELECT * from employees
WHERE hire_date> (select hire_date from employees where employee_id = 100 );


SELECT  * from employees
where employee_id = 205;

SELECT job_id from jobs
where job_ID LIKE "%MGR";

SELECT * from employees
where job_id in (SELECT DISTINCT(job_id) from jobs
where job_id LIKE'%MGR');

SELECT * from employees where employee_id 
in (SELECT distinct(manager_id) from employees);

SELECT distinct(manager_id) from employees;

