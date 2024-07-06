create or replace procedure manage_professional_schedule( p_id IN INT,
    p_date IN DATE) is
    is_available BOOLEAN;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Checking availability for Professional ID: ' || p_id || ' on date: ' || TO_CHAR(p_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('---');

    -- Check availability
    is_available := check_p_availability(p_id, p_date);

    -- If not available, find replacement
    IF NOT is_available THEN
        DBMS_OUTPUT.PUT_LINE('---');
        DBMS_OUTPUT.PUT_LINE('Searching for a replacement...');
        find_replacement(p_id, p_date);
    END IF;

    DBMS_OUTPUT.PUT_LINE('---');
    DBMS_OUTPUT.PUT_LINE('Process completed.');
END manage_professional_schedule;
/
