USE LittleLemonDB;

DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT Quantity as `Max Quantity in Order` FROM LittleLemonDB.Order
ORDER BY Quantity DESC
LIMIT 1;
END //
DELIMITER ;

CALL GetMaxQuantity();
