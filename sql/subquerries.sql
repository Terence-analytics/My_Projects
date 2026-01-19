	-- Subqueries
    
    -- select employees with department id =1
    
    SELECT *
    FROM employee_salary;
    
    SELECT *
    FROM employee_demographics;
    
    SELECT *
    FROM employee_demographics
    WHERE employee_id IN (
		SELECT employee_id
        FROM employee_salary
        WHERE dept_id = 1
    )
    ;
    
-- Subqueries in select statement
-- select employees and compare it to the average salary for everyone

SELECT employee_id, salary,
(SELECT avg(salary)
  FROM employee_salary
  ) AS Average_Salary
FROM employee_salary;   

-- Subqueries in from statement
-- select the average age,  average max age grouped by gender
SELECT AVG(Max)
FROM
(SELECT gender, AVG(age), MAX(age) as Max, MIN(age) as Min
from employee_demographics
GROUP BY gender) as Age_Summary
;