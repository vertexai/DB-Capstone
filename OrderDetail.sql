USE LittleLemonDB;

PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost FROM LittleLemonDB.Order
WHERE OrderID = ?;';

SET @id = 	1;
EXECUTE GetOrderDetail USING @id;
