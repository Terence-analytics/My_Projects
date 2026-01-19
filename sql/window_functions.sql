-- WINDOW FUNCTIONS

SELECT gender, AVG(salary) as average_Salary
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id
GROUP BY gender;


SELECT gender, AVG(salary) OVER()
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id;

-- show employees and avereage salaries grouped by gender
SELECT empd.first_name,empd.last_name,gender, AVG(salary) OVER(PARTITION BY gender) 
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id;

-- show employees and sum of  salaries grouped by gender
SELECT empd.first_name,empd.last_name,gender, SUM(salary) OVER(PARTITION BY gender) 
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id;

-- show employees and rolling total of  salaries grouped by gender
SELECT empd.first_name,empd.last_name,gender,salary	, SUM(salary) OVER(PARTITION BY gender ORDER BY empd.employee_id) as rolling_total
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id;

-- row number
SELECT empd.first_name,empd.last_name,gender, 
	ROW_NUMBER() OVER()
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id;

SELECT empd.first_name,empd.last_name,gender,salary, 
	ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics as empd
JOIN
employee_salary as emps
ON 
empd.employee_id = emps.employee_id;


