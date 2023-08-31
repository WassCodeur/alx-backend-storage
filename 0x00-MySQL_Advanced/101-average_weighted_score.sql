-- weighted average 
-- All student
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER |
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN

	UPDATE users 
	SET average_score = (SELECT (SUM(P.weight * C.score) / SUM(P.weight) )
		FROM corrections AS C
		JOIN projects AS P ON P.id = C.project_id
		WHERE C.user_id = users.id
	);
END;
|
DELIMITER ;
