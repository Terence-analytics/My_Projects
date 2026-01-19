-- triggers and events

-- Trigger- a block of code that execute automatically when an event takes place in a specific table

-- create a trigger to automatically add mployees to the demographics table using the new employees from the salary table

DELIMITER $$
CREATE TRIGGER update_employees
	AFTER INSERT ON employee_salary
    FOR EACH ROW
    BEGIN
		INSERT INTO employee_demographics(employee_id, first_name,last_name)
        VALUES ( NEW.employee_id, NEW.first_name, NEW.last_name);
    END $$
    DELIMITER ;
    
    -- insert new employee into the employee salary table
    INSERT INTO employee_salary (employee_id,first_Name, last_name, occupation, salary, dept_id)
    VALUES (13, 'Lesego', 'Sebogoane', 'Data Aalyst', 40000, NULL);
    
    select*
    from employee_salary;
    
    select*
    from employee_demographics;
    
    
    
-- EVENTS
-- Takes place when it is scheduled
-- remove employees older than 60 every 30 seconds
DELIMITER $$
CREATE EVENT retireries
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'Event%';



