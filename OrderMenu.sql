Use LittleLemonDB;
SELECT c.CustomerID, c.Name, o.OrderID, o.TotalCost as Cost, m.Name as MenuName
FROM Customer as c JOIN Booking as b ON c.CustomerID = b.Customer_CustomerID
JOIN LittleLemonDB.Order as o On o.Booking_BookingID = b.BookingID
JOIN Order_Menu as om ON om.Order_OrderID = o.OrderID
JOIN Menu as m On m.MenuID = om.Menu_MenuID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;
