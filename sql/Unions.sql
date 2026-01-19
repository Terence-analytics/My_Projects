-- UNIONS
-- select employees older than 35 divide by gender and label as old man or old lady, and employees earning more than 65000 and yhose earning less than 30000 label as overpaid or under paid

select first_name, last_name, 'Old Man' as Label
from employee_demographics
where age>35 and gender = 'Male'
union
select first_name, last_name, 'Old Lady' as Label
from employee_demographics
where age>35 and gender = 'Female'
union
select first_name, last_name, 'Over Paid' as Label
from employee_salary
where salary >= 65000
union
select first_name, last_name, 'Under Paid' as Label
from employee_salary
where salary <= 30000
order by first_name, last_name;