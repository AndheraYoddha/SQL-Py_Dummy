#SETS;
use hr;

select department_id
from departments
INTERSECT
select department_id
from employees;

select manager_id,
	department_id
from departments
Union all
select manager_id,
		department_id
from employees;