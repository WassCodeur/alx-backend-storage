-- Procesure 
-- student average
DELIMITER |
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
	DECLARE average FLOAT;
	DECLARE sum_scores FLOAT;
	DECLARE divisor INT;
	SELECT COUNT(*) INTO divisor FROM corrections AS cor WHERE cor.user_id = user_id;
	IF divisor IS NOT NULL THEN
		SELECT SUM(score) INTO sum_scores FROM corrections AS cor WHERE cor.user_id = user_id;
		SET average = (sum_scores / divisor);
	ELSE
		SET average = 0;
	END IF;
	UPDATE users SET average_score = average WHERE id = user_id;
END;
|
DELIMITER ;
