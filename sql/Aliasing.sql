# Display first_name, last_name, and birth_date, rename birth_date to Date of Birth.
SELECT first_name, last_name, birth_date AS 'Date of Birth'
FROM employee_demographics;

#Show employee names with their salary as Annual Income.
SELECT first_name, last_name, salary AS 'Annual Income'
FROM employee_salary;

#Rename dept_id as Department in your output.
SELECT dept_id AS 'Department in your output'
FROM employee_salary;

#Create a full name column:
SELECT CONCAT(first_name,' ',last_name) AS 'Full Names'
FROM employee_demographics;