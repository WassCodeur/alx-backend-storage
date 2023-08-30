-- Index
-- first index
DROP INDEX IF EXISTS idx_name_first;
CREATE INDEX idx_name_first
ON names (LEFT(name, 1));
