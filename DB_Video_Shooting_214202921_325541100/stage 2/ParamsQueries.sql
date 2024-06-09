SELECT 
    p.professional_id, 
    p.fname, 
    p.lname, 
    p.phone, 
    p.email, 
    p.price, 
    p.start_year, 
    pr.prof_name
FROM 
    Professional p
JOIN 
    Profession pr ON p.prof_id = pr.prof_id
WHERE 
    p.start_year > &<name="start_year" hint= "a number between 1980 to 2024" type="integer" required="true"> 
    AND p.price > &<name="min_price" hint= "a number between 1000 to 100000" type="integer" required="true">;
    

    
SELECT 
    e.event_id, 
    e.event_date, 
    e.place, 
    c.client_id,
    c.fname AS client_fname, 
    c.lname AS client_lname
FROM 
    Event e
JOIN 
    CustomerOrder co ON e.event_id = co.event_id
JOIN 
    Client c ON co.client_id = c.client_id
WHERE 
    e.place=&<name="place_list" type="string" list="select place from event" restricted="no">
 ;


SELECT 
    e.event_id, 
    e.event_date, 
    e.place, 
    pm.type AS payment_type, 
    p.payment_amount
FROM 
    Event e
JOIN 
    CustomerOrder co ON e.event_id = co.event_id
JOIN 
    Payment p ON co.order_id = p.order_id
JOIN 
    PaymentMethod pm ON p.pay_method_id = pm.pay_method_id
WHERE 
    e.event_date BETWEEN TO_DATE(&<name="start_date" type="string" required="true" hint="Format: dd/mm/yyyy ">, 'dd/mm/yyyy') 
    AND TO_DATE(&<name="end_date" type="string" required="true" hint="Format: dd/mm/yyyy ">,'dd/mm/yyyy')
    AND e.place IN (&<name="place_list" type="string" list="select distinct place from event" restricted="no">)
ORDER BY 
    e.event_date;


SELECT 
    pr.prof_name,
    COUNT(p.professional_id) AS professional_count
FROM 
    Professional p
JOIN 
    Profession pr ON p.prof_id = pr.prof_id
WHERE 
    pr.prof_name IN (&<name="prof_name_list" type="string" list="select distinct prof_name from Profession" restricted="no">)
GROUP BY 
    pr.prof_name
ORDER BY 
    professional_count DESC;