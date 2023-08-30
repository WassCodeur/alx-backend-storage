-- Function
-- Function to divise
DELIMITER |
DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT) RETURNS FLOAT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE div_result FLOAT;

	IF b IS NOT NULL AND b <> 0 THEN
		SET div_result = (a / b);
	ELSE
		SET div_result = 0;
	END IF;
	RETURN div_result;
END;
|
DELIMITER ;
