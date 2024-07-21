--From our point of view:

-- Creating a view named OrderProfessionalView
-- This view displays order details along with professional details and their professions
CREATE VIEW OrderProfessionalView AS
SELECT
    co.order_id, -- Order ID
    co.order_date, -- Order Date
    p.fname AS professional_first_name, -- Professional's First Name
    p.lname AS professional_last_name, -- Professional's Last Name
    p.price AS professional_price, -- Professional's Price
    pr.prof_name AS profession_name -- Profession Name of the Professional
FROM
    CustomerOrder co
JOIN
    include i ON co.order_id = i.order_id
JOIN
    Professional p ON i.professional_id = p.professional_id
JOIN
    Profession pr ON p.prof_id = pr.prof_id;

-- Selecting all data from the created view
SELECT * FROM OrderProfessionalView;

-- Query to return the profession name and the number of orders for each profession, excluding professions with IDs 2 and 3
-- The profession with the highest number of orders is listed first
SELECT
    profession_name,
    profession_id,
    COUNT(order_id) AS number_of_orders
FROM
    OrderProfessionalView
WHERE
    profession_id NOT IN (2, 3)  -- Excluding professions SINGER and PRODUCER
GROUP BY
    profession_name,
    profession_id
ORDER BY
    number_of_orders DESC; -- Ordering by number of orders

-- Query to calculate the total price of each order, excluding orders that include professions with IDs 2 and 3
-- Returns the total price for each order
SELECT
    order_id,
    SUM(professional_price) AS total_order_price
FROM
    OrderProfessionalView
WHERE
    order_id NOT IN (
        SELECT DISTINCT order_id
        FROM OrderProfessionalView
        WHERE profession_id IN (2, 3) -- Excluding orders with professions SINGER and PRODUCER
    )
GROUP BY
    order_id; -- Grouping by order ID
    
--From their's point of view   
 
 -- Creating a view that consolidates data from multiple tables related to orders and instruments
CREATE VIEW OrderInstrumentView AS
SELECT
    e.event_id,
    e.event_date,
    e.place,
    c.client_id,
    c.fname AS client_first_name,
    c.lname AS client_last_name,
    co.order_id,
    co.order_date,
    i.instrument_id,
    i.instrument_name,
    i.price AS instrument_price
FROM
    Event e
JOIN
    CustomerOrder co ON e.event_id = co.event_id
JOIN
    Client c ON co.client_id = c.client_id
JOIN
    orderInstruments oi ON co.order_id = oi.order_id
JOIN
    Instrument i ON oi.instrument_id = i.instrument_id;

-- Selecting all data from the created view
SELECT * FROM OrderInstrumentView;

-- Query to get the total number of distinct orders and total instrument price for each client,
-- ordered by the number of orders in descending order.
SELECT
    client_id,
    client_first_name,
    client_last_name,
    COUNT(DISTINCT order_id) AS number_of_orders,
    SUM(instrument_price) AS total_instrument_price
FROM
    OrderInstrumentView
GROUP BY
    client_id,
    client_first_name,
    client_last_name
ORDER BY
    number_of_orders DESC;

-- Query to get the number of occurrences of each instrument in orders,
-- ordered by the number of occurrences in descending order.
SELECT
    instrument_id,
    instrument_name,
    COUNT(order_id) AS number_of_occurrences 
FROM
    OrderInstrumentView
GROUP BY
    instrument_id,
    instrument_name
ORDER BY
    number_of_occurrences DESC;
