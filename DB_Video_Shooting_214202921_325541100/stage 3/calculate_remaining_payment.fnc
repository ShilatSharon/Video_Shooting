CREATE OR REPLACE FUNCTION calculate_remaining_payment(p_order_id IN NUMBER)
RETURN NUMBER IS
    v_total_price NUMBER := 0;
    v_total_paid NUMBER := 0;
    v_remaining NUMBER := 0;
    
    CURSOR c_professionals IS
        SELECT p.price
        FROM Professional p
        JOIN include i ON p.professional_id = i.professional_id
        WHERE i.order_id = p_order_id;
    
    CURSOR c_payments IS
        SELECT payment_amount
        FROM Payment
        WHERE order_id = p_order_id;
    
BEGIN
    -- Calculate total price
    FOR prof_rec IN c_professionals LOOP
        v_total_price := v_total_price + prof_rec.price;
    END LOOP;
    
    -- Calculate total paid
    FOR payment_rec IN c_payments LOOP
        v_total_paid := v_total_paid + payment_rec.payment_amount;
    END LOOP;
    
    -- Calculate remaining payment
    v_remaining := v_total_price - v_total_paid;
    
    -- Raise exception if overpaid
    IF v_remaining < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Overpayment detected. Refund amount: ' || ABS(v_remaining));
    END IF;
    
    RETURN v_remaining;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN NULL;
END calculate_remaining_payment;
/
