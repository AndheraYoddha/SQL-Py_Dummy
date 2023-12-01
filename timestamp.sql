use hr;
SELECT job_id, count(*) as no_of_employees FROM job_history
WHERE end_date-start_date>20 
group by count(*);