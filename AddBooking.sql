USE LittleLemonDB;
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //

CREATE PROCEDURE AddBooking (IN booking_id INT, IN customer INT, IN table_no INT, IN booking_date DATE)
BEGIN
START TRANSACTION;
IF EXISTS(SELECT 1 FROM Booking WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " already exists - booking cancelled.") AS `Booking status`;
ROLLBACK;
ELSEIF EXISTS(SELECT 1 FROM Booking WHERE (Booking.Date = booking_date AND TableNumber = table_no))
THEN SELECT CONCAT("Table " , table_no, " already booked - booking cancelled.") AS `Booking status`;
ROLLBACK;
ELSE
INSERT INTO Booking (BookingID, Booking.Date, TableNumber, CustomerID)
VALUES (booking_id, booking_date, table_no, customer);
SELECT CONCAT("New booking added.") AS `Confirmation`; 
COMMIT;
END IF; 
END //

DELIMITER ;

Call AddBooking(1, 1, 2, '2023-15-03');

Call AddBooking(1, 1, 2, '2023-15-03');
