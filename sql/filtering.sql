SELECT *
FROM employee_demographics;

SELECT *
FROM employee_demographics
WHERE gender= 'Male';

SELECT *
FROM employee_demographics
WHERE age NOT BETWEEN 30 AND 60;

SELECT *
FROM employee_demographics
WHERE last_name = 'Haverford';

SELECT *
FROM employee_demographics
WHERE birth_date < '1985-01-01';