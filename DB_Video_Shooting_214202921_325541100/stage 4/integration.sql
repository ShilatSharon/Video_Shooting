-- Renaming existing tables to add a suffix "1"
ALTER TABLE Singer RENAME TO Singer1; 
ALTER TABLE Customer RENAME TO Customer1; 
ALTER TABLE Instrument RENAME TO Instrument1; 
ALTER TABLE Payment_type RENAME TO Payment_type1; 
ALTER TABLE Producer RENAME TO Producer1; 
ALTER TABLE Event RENAME TO Event1; 
ALTER TABLE Instrument_Event RENAME TO Instrument_Event1; 

-- Checking existing data in tables
SELECT * FROM PaymentMethod;
SELECT * FROM Payment_type1;

-- Inserting new payment methods
INSERT INTO PaymentMethod (pay_method_id, type)
VALUES (4, 'Bit'); -- Adding 'Bit' payment method
INSERT INTO PaymentMethod (pay_method_id, type)
VALUES (5, 'Check'); -- Adding 'Check' payment method

-- Checking existing data in tables
SELECT * FROM Profession;

-- Inserting new professions
INSERT INTO Profession (prof_id, prof_name)
VALUES (2, 'Singer'); -- Adding 'Singer' profession
INSERT INTO Profession (prof_id, prof_name)
VALUES (3, 'Producer'); -- Adding 'Producer' profession

-- Checking existing data in tables
SELECT * FROM Professional;
SELECT * FROM Customer1;
SELECT * FROM Client;

-- Dropping foreign key constraints on Event1 table
ALTER TABLE Event1
DROP CONSTRAINT SYS_C007308; -- Dropping FK constraint on Singer_Id
ALTER TABLE Event1
DROP CONSTRAINT SYS_C007311; -- Dropping FK constraint on Producer_Id

-- Updating IDs in Singer1 and Producer1 tables to avoid conflicts
UPDATE Singer1
SET Singer_Id = Singer_Id + 500; -- Updating Singer_Id
UPDATE Producer1
SET Producer_Id = Producer_Id + 1000; -- Updating Producer_Id

-- Checking updated data in tables
SELECT * FROM Singer1;

-- Transferring data from Singer1 and Producer1 to Professional
INSERT INTO Professional (professional_id, fname, price, start_year, prof_id)
SELECT Singer_Id, SNAME, Price, 2000, 2
FROM Singer1; -- Inserting singers into Professional
INSERT INTO Professional (professional_id, fname, price, start_year, prof_id)
SELECT Producer_Id, Producer_NAME, Price, 2000, 3
FROM Producer1; -- Inserting producers into Professional

-- Checking updated data in tables
SELECT * FROM Producer1;

-- Updating IDs in Event1 table to avoid conflicts
UPDATE Event1
SET Singer_Id = Singer_Id + 500,
    Producer_Id = Producer_Id + 1000; -- Updating Singer_Id and Producer_Id in Event1

-- Dropping foreign key constraint on Instrument_Event1 table
ALTER TABLE Instrument_Event1
DROP CONSTRAINT SYS_C007320; -- Dropping FK constraint on Event_Id

-- Updating Event_Id in Event1 table to avoid conflicts
UPDATE Event1
SET Event_Id = Event_Id + 500; -- Updating Event_Id in Event1

-- Transferring data from Event1 to Event
INSERT INTO Event (event_id, event_date, place)
SELECT Event_Id, Event_Date, Location
FROM Event1; -- Inserting events into Event

-- Checking updated data in tables
SELECT * FROM Event;

-- Transferring unique customers from Customer1 to Client
INSERT INTO Client (client_id, fname, address, email)
SELECT c.Customer_Id, c.name, c.address, c.email
FROM Customer1 c
WHERE NOT EXISTS (
    SELECT 1
    FROM Client cl
    WHERE cl.client_id = c.Customer_Id
); -- Inserting unique customers into Client

-- Transferring data from Event1 to CustomerOrder
INSERT INTO CustomerOrder (order_id, order_date, event_id, client_id)
SELECT Event_Id, Event_Date, Event_Id, Customer_Id
FROM Event1; -- Inserting orders into CustomerOrder

-- Transferring payment data from Event1 to Payment
INSERT INTO Payment (payment_id, payment_amount, payment_date, pay_method_id, order_id)
SELECT Event_Id, Total_price_, Event_Date, Payment_Id-1, Event_Id
FROM Event1; -- Inserting payments into Payment

-- Checking updated data in tables
SELECT * FROM Payment;

-- Inserting singers and producers into include table
INSERT INTO include (professional_id, order_id)
SELECT Singer_Id, Event_Id
FROM Event1; -- Inserting singers into include
INSERT INTO include (professional_id, order_id)
SELECT Producer_Id, Event_Id
FROM Event1; -- Inserting producers into include

-- Checking updated data in tables
SELECT * FROM Include;

-- Updating Event_Id in Instrument_Event1 and renaming to orderInstruments
UPDATE Instrument_Event1
SET Event_Id = Event_Id + 500; -- Updating Event_Id in Instrument_Event1

-- Renaming table Instrument_Event1 to orderInstruments
ALTER TABLE Instrument_Event1
RENAME TO orderInstruments; -- Renaming Instrument_Event1 to orderInstruments

-- Renaming column event_id to order_id in orderInstruments
ALTER TABLE orderInstruments
RENAME COLUMN event_id TO order_id; -- Renaming event_id to order_id in orderInstruments

-- Adding foreign key constraint to orderInstruments
ALTER TABLE orderInstruments
ADD CONSTRAINT fk_instrument_order
FOREIGN KEY (order_id)
REFERENCES CustomerOrder (order_id); -- Adding FK constraint on order_id in orderInstruments

--back to source
ALTER TABLE Instrument1 RENAME TO Instrument; 
