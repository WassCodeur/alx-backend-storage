-- procedure stored
-- Create a procedure stored AddBonus
DELIMITER |
DROP PROCEDURE IF EXISTS AddBonus;
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score FLOAT)
BEGIN
	DECLARE project_id INT;
	SELECT id INTO project_id FROM projects WHERE name = project_name LIMIT 1;
	IF project_id IS NULL THEN
		INSERT INTO projects (name) VALUES (project_name);
	END IF;
	SELECT id  INTO project_id FROM projects WHERE name = project_name LIMIT 1;
	INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END;
|
DELIMITER ;
