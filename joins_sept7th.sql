JOINS

use hr;

SELECT employees.employee_id, employees.last_name, 
departments.department_name 
from employees
left join
departments on employees.department_id = 
departments.department_id;
SELECT job_id from employees;

SELECT e.employee_id, e.last_name, e.job_id, e.salary,
e.department_id, d.department_name
from employees e
RIGHT JOIN departments d
on e.department_id=d.department_id
WHERE job_id = 'IT_PROG';

SELECT e.employee_id, d.department_name, 
e.department_id from 
employees e left JOIN departments d 
on e.department_id = d.department_id 
WHERE d.department_id BETWEEN 60 AND 80;

SELECT e.employee_id, e.first_name, e.last_name, 
d.department_name, l.city from employees e left join 
departments d on e.department_id = d.department_id left join
locations l on  d.location_id = l.location_id;


select e.employee_id, e.last_name, d.department_name, e.salary
from employees e LEFT join departments d on 
e.department_id = d.department_id 
ORDER BY e.salary;

SELECT e.employee_id, e.first_name, e.last_name, e.salary,
d.department_name, l.city from employees e
left join departments d on e.department_id = d.department_id
left join locations l on 
l.location_id = d.location_id;




