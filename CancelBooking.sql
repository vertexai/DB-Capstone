USE LittleLemonDB;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //

CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM Booking WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " does not exist.") AS `Message`;
ROLLBACK;
ELSE
DELETE FROM Booking WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", booking_id ," cancelled.") AS `Confirmation`; 

COMMIT;
END IF;
END //


DELIMITER ;

Call CancelBooking(6);
