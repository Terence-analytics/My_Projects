-- CASE STATEMENTS
-- its the end of the year, we are looking to raise salaries of our employees, update the salaries based on this conditions:
-- 1) salary> 50000 = 7% increase, 2) salary< 50000 = 5% increase, 3) department = Healthcare receive 10% bonus and 5 percent for all other enployees

select *
from employee_salary;

select first_name, last_name,
case
when salary <= 50000 then salary * 1.05
when salary > 50000 then salary * 1.07
end as New_salary ,

case
when dept_id = 3 then salary * .10
when dept_id != 3 then salary * .05
end as Bonus
from employee_salary
;