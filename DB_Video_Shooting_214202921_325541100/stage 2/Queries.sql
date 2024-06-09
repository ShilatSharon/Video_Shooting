UPDATE CustomerOrder
SET order_date = (
  SELECT event_date - 1
  FROM Event
  WHERE Event.event_id = CustomerOrder.event_id
)
WHERE order_date >= (
  SELECT event_date
  FROM Event
  WHERE Event.event_id = CustomerOrder.event_id
);

UPDATE Payment
SET payment_date = (
  SELECT order_date
  FROM CustomerOrder
  WHERE CustomerOrder.order_id = Payment.order_id
)
WHERE payment_date < (
  SELECT order_date
  FROM CustomerOrder
  WHERE CustomerOrder.order_id = Payment.order_id
);

UPDATE CustomerOrder
SET order_id = event_id;

--FIRST
-- Delete payments for the orders older than 2001
DELETE FROM Payment
WHERE order_id IN (
    SELECT order_id FROM CustomerOrder
    WHERE EXTRACT(YEAR FROM ORDER_DATE)< 2001
);

-- Delete entries from the include table for the orders older than 2001
DELETE FROM include
WHERE order_id IN (
    SELECT order_id FROM CustomerOrder
    WHERE EXTRACT(YEAR FROM ORDER_DATE)< 2001
);

-- Delete the orders older than 2001
DELETE FROM CustomerOrder
WHERE EXTRACT(YEAR FROM ORDER_DATE)< 2001;

-- Delete events associated with orders older than 2001
DELETE FROM Event
WHERE event_id IN (
    SELECT event_id FROM CustomerOrder
    WHERE EXTRACT(YEAR FROM ORDER_DATE)< 2001
);

--SECOND
-- Delete from the include table where the professional hasn't taken any orders from 2001
DELETE FROM include
WHERE professional_id IN (
    SELECT professional_id
    FROM Professional
    WHERE professional_id NOT IN (
        SELECT professional_id
        FROM include
        JOIN CustomerOrder ON include.order_id = CustomerOrder.order_id
        WHERE EXTRACT(YEAR FROM CustomerOrder.order_date) > 2001
    )
);

-- Delete professionals who haven't taken any orders from 2001
DELETE FROM Professional
WHERE professional_id NOT IN (
    SELECT professional_id
    FROM include
    JOIN CustomerOrder 
    ON include.order_id = CustomerOrder.order_id
    WHERE EXTRACT(YEAR FROM CustomerOrder.order_date) > 2001
);


SELECT 
    c.client_id,
    c.fname AS client_fname,
    c.lname AS client_lname,
    event_data.total_events,
    payment_data.total_payments,
    EXTRACT(MONTH FROM event_data.last_event_date) AS last_event_month
FROM 
    Client c
JOIN 
    (SELECT 
        co.client_id,
        COUNT(DISTINCT co.event_id) AS total_events,
        MAX(e.event_date) AS last_event_date
     FROM 
        CustomerOrder co
     JOIN 
        Event e ON co.event_id = e.event_id
     GROUP BY 
        co.client_id
     HAVING 
        COUNT(DISTINCT co.event_id) > 2) event_data
ON 
    c.client_id = event_data.client_id
JOIN 
    (SELECT 
        co.client_id,
        SUM(p.payment_amount) AS total_payments
     FROM 
        CustomerOrder co
     JOIN 
        Payment p ON co.order_id = p.order_id
     GROUP BY 
        co.client_id) payment_data
ON 
    c.client_id = payment_data.client_id
ORDER BY 
    event_data.total_events DESC;


SELECT 
    p.professional_id,
    p.fname AS professional_fname,
    p.lname AS professional_lname,
    event_data.total_orders,
    payment_data.total_payments,
    p.price AS average_price
FROM 
    Professional p
JOIN 
    (SELECT 
        i.professional_id,
        COUNT(DISTINCT co.order_id) AS total_orders
     FROM 
        include i
     JOIN 
        CustomerOrder co ON i.order_id = co.order_id
     GROUP BY 
        i.professional_id
     HAVING 
        COUNT(DISTINCT co.order_id) > 3) event_data
ON 
    p.professional_id = event_data.professional_id
JOIN
(SELECT 
        i.professional_id,
        SUM(p.payment_amount) AS total_payments
     FROM 
        include i
     JOIN 
        Payment p ON i.order_id = p.order_id
     GROUP BY 
        i.professional_id) payment_data
ON 
    p.professional_id = payment_data.professional_id
ORDER BY 
    payment_data.total_payments DESC;


SELECT 
    c.client_id, 
    c.fname AS client_fname, 
    c.lname AS client_lname, 
    e.event_id, 
    e.event_date, 
    e.place
FROM 
    Client c, 
    CustomerOrder co, 
    Event e
WHERE 
    c.client_id = co.client_id 
    AND co.event_id = e.event_id 
    AND e.event_date = (
        SELECT 
            MAX(e2.event_date)
        FROM 
            Event e2, 
            CustomerOrder co2
        WHERE 
            e2.event_id = co2.event_id 
            AND co2.client_id = c.client_id
    );

SELECT 
    c.client_id, 
    c.fname AS client_fname, 
    c.lname AS client_lname, 
    COUNT(DISTINCT p.pay_method_id) AS unique_payment_methods
FROM 
    Client c, 
    CustomerOrder co, 
    Payment p
WHERE 
    c.client_id = co.client_id 
    AND co.order_id = p.order_id
GROUP BY 
    c.client_id, c.fname, c.lname
HAVING 
    COUNT(DISTINCT p.pay_method_id) > 1
ORDER BY 
    unique_payment_methods DESC;