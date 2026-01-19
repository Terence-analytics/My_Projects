-- INNER JOIN

Select *
From employee_demographics;

Select *
From employee_salary;

Select empd.employee_id, empd.first_name, empd.last_name, emps.occupation, emps.salary
From employee_demographics as empd
inner join employee_salary as emps
	ON empd.employee_id = emps.employee_id
;

-- LEFT JOIN

Select empd.employee_id, empd.first_name, empd.last_name, emps.occupation, emps.salary
From employee_demographics as empd
left join employee_salary as emps
	ON empd.employee_id = emps.employee_id;
    
Select *
From employee_demographics as empd
right join employee_salary as emps
	ON empd.employee_id = emps.employee_id;
    
-- JOINING MULTIPLE TABLES

Select *
From parks_departments;

Select emps.employee_id, emps.first_name, emps.last_name, emps.occupation, emps.salary,
	department_name
From employee_demographics as empd
right join employee_salary as emps
	ON empd.employee_id = emps.employee_id
inner join parks_departments 
		on dept_id = department_id;
        