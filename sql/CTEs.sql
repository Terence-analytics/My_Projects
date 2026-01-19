-- Advance sql
-- CTEs, common table expression( alternative to subqueries)

SELECT gender, MAX(age) as Max, MIN(age) as Min, COUNT(salary) as coun
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id
GROUP BY gender;

WITH CTE_example AS -- we can use parameters == CTE_example(Gender, Max_sal, Min_sal, Count_sal)
(
SELECT gender, MAX(salary) as Max, MIN(salary) as Min, COUNT(salary) as coun
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id
GROUP BY gender)
SELECT AVG(Max)
FROM CTE_example;

-- select employees born after 1985-01-01 with salaries greater than 50000

WITH CTE_example as(
SELECT employee_id,first_name,last_name, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'),
CTE_example2 as (
SELECT employee_id, occupation, salary
FROM employee_salary
WHERE salary>50000 )

SELECT *
FROM CTE_example c1
JOIN CTE_example2 c2
ON c1.employee_id = c2.employee_id
;