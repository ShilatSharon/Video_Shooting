CREATE OR REPLACE PROCEDURE find_replacement(
    p_id IN INT,
    p_date IN DATE
) IS
    profession_id INT;
    replacement_count INT := 0;
    
    -- User-defined exception
    no_replacement_found EXCEPTION;
    
    CURSOR c_replacements IS
        SELECT p.professional_id
        FROM Professional p
        WHERE p.prof_id = profession_id --the same profession
        AND p.professional_id != p_id --not him
        AND NOT EXISTS ( --doesn't have event in p_date
            SELECT 1
            FROM CustomerOrder co
            JOIN include i ON co.order_id = i.order_id
            JOIN Event e ON co.event_id = e.event_id
            WHERE i.professional_id = p.professional_id
            AND e.event_date = p_date
        );
BEGIN
    -- Get the profession ID of the original professional
    SELECT prof_id INTO profession_id
    FROM Professional
    WHERE professional_id = p_id;

    -- Print potential replacements
    DBMS_OUTPUT.PUT_LINE('Potential replacements:');
    FOR replacement IN c_replacements LOOP
        DBMS_OUTPUT.PUT_LINE('Professional ID: ' || replacement.professional_id);
        replacement_count := replacement_count + 1;
    END LOOP;

    -- Raise the user-defined exception if no replacements found
    IF replacement_count = 0 THEN
        RAISE no_replacement_found;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Total replacements found: ' || replacement_count);

EXCEPTION
    WHEN no_replacement_found THEN
        DBMS_OUTPUT.PUT_LINE('No replacement found. It''s impossible to find a substitute.');
END;
/
