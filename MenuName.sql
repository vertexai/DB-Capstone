USE LittleLemonDB;
SELECT m.Name from Menu m
JOIN Order_Menu as om ON om.Menu_MenuID = m.MenuID
JOIN LittleLemonDB.Order as o On o.OrderID = om.Order_OrderID
WHERE o.OrderID = ANY (Select OrderID from LittleLemonDB.Order Where Quantity > 2 )
