-- INDEX
-- INDEX first letter and score
DROP INDEX IF EXISTS idx_name_first_score;
CREATE INDEX idx_name_first_score
ON names (LEFT(name, 1), score);
