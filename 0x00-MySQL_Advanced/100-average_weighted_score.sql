-- Average weighted score
-- Procedure that computes and store the average weighted score
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER |
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)

BEGIN
	DECLARE sum_score INT;
	DECLARE sum_weight INT;
	DECLARE weighted_average FLOAT;

	SELECT SUM(C.score * P.weight),
	SUM(P.weight)
	INTO sum_score, sum_weight
	FROM corrections AS C
	JOIN projects AS P ON P.id = C.project_id
	WHERE C.user_id = user_id;
	IF sum_weight IS NOT NULL THEN
		SET weighted_average = sum_score / sum_weight;
	ELSE
		SET weighted_average = 0;
	END IF;
	UPDATE users SET average_score = weighted_average WHERE users.id = user_id;
END;
|
DELIMITER ;
