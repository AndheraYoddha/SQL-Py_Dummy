use hr;
select *
from employees
where department_id in (
							select department_id
							from departments
							where location_id in(
													select distinct(location_id) 
													from locations
													where country_id ="US")) and 
                                                    manager_id is not null;
                                                    
 select first_name,
		last_name,
        salary
        from employees
        where salary > (select salary 
								from employees
								where last_name like "Bell%");

select * 
from employees
where salary = (select min(salary)
						from employees);
                        
select max(salary) as third_highest_salary
from employees
where salary <(select max(salary)
				from employees
				where salary <(select max(salary)
										from employees));
                                        
SELECT 
    salary
FROM
    (SELECT DISTINCT
        (salary)
    FROM
        employees
    ORDER BY salary DESC
    LIMIT 3) AS emp
ORDER BY salary ASC
LIMIT 1;

									