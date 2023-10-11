USE LittleLemonDB;
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //

CREATE PROCEDURE UpdateBooking (IN booking_id INT, IN booking_date DATE)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM Booking WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " does not exist.") AS `Message`;
ROLLBACK;
ELSE
UPDATE Booking SET Booking.Date = booking_date WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", booking_id ," updated.") AS `Confirmation`; 
COMMIT;
END IF; 
END //


DELIMITER ;

Call UpdateBooking(1, '2002-02-01');
