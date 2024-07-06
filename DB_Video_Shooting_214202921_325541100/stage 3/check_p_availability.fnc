CREATE OR REPLACE FUNCTION check_p_availability(p_id IN INT, p_date IN DATE
) RETURN BOOLEAN IS
    CURSOR prof_events IS
        SELECT e.event_id, e.event_date, e.place, co.order_id
        FROM CustomerOrder co
        JOIN include i ON co.order_id = i.order_id
        JOIN Event e ON co.event_id = e.event_id
        WHERE i.professional_id = p_id
        AND e.event_date = p_date;
    event_count NUMBER := 0;
    prof_event_row prof_events%ROWTYPE;
    is_available BOOLEAN;
BEGIN
   FOR  prof_event_row IN prof_events LOOP
        event_count := event_count + 1;
        
        IF event_count = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Professional is not available on ' || TO_CHAR(p_date, 'YYYY-MM-DD') || '. Event details:');
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('Event ID: ' || prof_event_row.event_id);
        DBMS_OUTPUT.PUT_LINE('Event Date: ' || TO_CHAR(prof_event_row.event_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Place: ' || prof_event_row.place);
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || prof_event_row.order_id);
        DBMS_OUTPUT.PUT_LINE('---');
    END LOOP;
    
    is_available := (event_count = 0);
    
    IF is_available THEN
        DBMS_OUTPUT.PUT_LINE('Professional is available on ' || TO_CHAR(p_date, 'YYYY-MM-DD'));
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total events found: ' || event_count);
    END IF;
    
    RETURN is_available;
END check_p_availability;
/
