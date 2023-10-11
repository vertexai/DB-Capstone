USE LittleLemonDB;

CREATE VIEW `OrdersView` AS 
SELECT OrderID, Quantity, TotalCost FROM 
LittleLemonDB.Order WHERE Quantity > 2;
