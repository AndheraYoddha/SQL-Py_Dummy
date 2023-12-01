use hr;
SELECT lower(first_name),upper(last_name) from employees;

SELECT job_id,MAX(salary), MIN(salary),AVG(salary) as salary from employees
WHERE count(employee_id) < 1 
Group By job_id 
ORDER BY salary;

SELECT department_id, count(employee_id) as num_of_emp, 
avg(salary) as avg_sal, max(salary) as max_sal
FROM employees
GROUP BY department_id
order by avg_sal;

SELECT department_id, avg(salary) as avg_sal from employees
group by department_id
ORDER by avg_sal;

SELECT job_id from employees;
 
SELECT avg(salary) from employees
WHERE job_id LIKE "%CLERK"
group by job_id;

select job_id,
		avg(salary) as avg_sal
from employees
where job_id like "%CLERK"
group by job_id;

SELECT avg(salary) as avg_sal, job_id from employees
group by job_id having "%CLERK";

SELECT Count(City) as Cities, country_ID from locations
group by country_id
order by Cities;

Select*from employees;

SELECT  department_id, avg(salary) as avg_sal from employees 
WHERE commission_pct IS NOT NULL
Group by department_id;

SELECT count(job_id), count(employee_id), sum(salary) as tot_sal,
max(salary)-min(salary) as min_max 
from employees
group by salary;

SELECT employee_id, max(end_date) as prv_ed from job_history
group by employee_id
ORDER BY employee_id;

select department_id,
		max(salary) as max_sal
        from employees
        where department_id in (20,30,80)
        group by department_id
		having max(salary) >10000;

