-- Trigger for Create operation on Payment table
CREATE TRIGGER before_payment_insert
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
  DECLARE order_date INT;

  -- Fetch the order_date for the new payment
  SELECT order_date INTO order_date
  FROM CustomerOrder
  WHERE CustomerOrder.order_id = NEW.order_id;

  -- Check if the new payment_date is after the order_date
  IF NEW.payment_date < order_date THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Payment date must be after order date';
  END IF;
END 

-- Trigger for UPDATE operations on Payment table
CREATE TRIGGER before_payment_update
BEFORE UPDATE ON Payment
FOR EACH ROW
BEGIN
  DECLARE order_date INT; -- Declare a local variable to hold the order_date

  -- Fetch the order_date for the updated payment's order_id
  SELECT order_date INTO order_date
  FROM CustomerOrder
  WHERE CustomerOrder.order_id = NEW.order_id;

  -- Check if the updated payment_date is after the order_date
  IF NEW.payment_date < order_date THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Payment date must be after order date'; -- Raise an error if condition is not met
  END IF;
END 

-- Trigger for INSERT operations on CustomerOrder table
CREATE TRIGGER before_order_insert
BEFORE INSERT ON CustomerOrder
FOR EACH ROW
BEGIN
  DECLARE event_date INT;

  -- Fetch the event_date for the new order
  SELECT event_date INTO event_date
  FROM Event
  WHERE Event.event_id = NEW.event_id;

  -- Check if the event_date is before the new order_date
  IF event_date < NEW.order_date THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Event date must be before order date';
  END IF;
END //

-- Trigger for UPDATE operations on CustomerOrder table
CREATE TRIGGER before_order_update
BEFORE UPDATE ON CustomerOrder
FOR EACH ROW
BEGIN
  DECLARE event_date INT;

  -- Fetch the event_date for the updated order
  SELECT event_date INTO event_date
  FROM Event
  WHERE Event.event_id = NEW.event_id;

  -- Check if the event_date is before the updated order_date
  IF event_date < NEW.order_date THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Event date must be before order date';
  END IF;
END //

-- Add a CHECK constraint to the Professional table
ALTER TABLE Professional
ADD CONSTRAINT chk_professional_phone
CHECK (phone LIKE '05%');

-- Add a CHECK constraint to the Client table
ALTER TABLE Client
ADD CONSTRAINT chk_client_phone
CHECK (phone LIKE '05%');
