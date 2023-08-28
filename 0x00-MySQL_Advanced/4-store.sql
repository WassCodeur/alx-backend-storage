-- my first trigger
-- script that decreases the quantity of an item
DELIMITER |
CREATE TRIGGER new_order BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE items SET quantity = (quantity - NEW.number)
	WHERE name = NEW.item_name;
END;
|

DELIMITER ;
