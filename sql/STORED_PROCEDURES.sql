-- STORED PROCEDURES , similar to functions in python
USE `parks_andrecreation`;
-- DROP PROCEDURE IF EXISTS `procedureName';

DELIMITER $$
CREATE PROCEDURE outlier_salaries()
BEGIN
	SELECT *
    FROM employee_salary
    WHERE salary >= 70000;
    
    SELECT *
    FROM employee_salary
    WHERE salary <= 30000;
END $$


-- Stored prcedures with parameters
-- create a stored procedure to select 1 employee using their id

CREATE PROCEDURE employee(p_employee_id INT)
BEGIN
SELECT *
FROM employee_salary
WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

call employee(4);
