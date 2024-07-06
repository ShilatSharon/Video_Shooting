CREATE OR REPLACE PROCEDURE add_payment(
    p_order_id IN NUMBER,
    p_amount IN NUMBER,
    p_pay_method_id IN NUMBER
) IS
    v_payment_id NUMBER;
BEGIN
    -- Generate new payment_id
    SELECT NVL(MAX(payment_id), 0) + 1 INTO v_payment_id FROM Payment;
    
    -- Insert new payment
    INSERT INTO Payment (payment_id, payment_amount, payment_date, pay_method_id, order_id)
    VALUES (v_payment_id, p_amount, SYSDATE, p_pay_method_id, p_order_id);
    
    -- Print all payments for this order
    FOR payment_rec IN (SELECT * FROM Payment WHERE order_id = p_order_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Payment ID: ' || payment_rec.payment_id || 
                             ', Amount: ' || payment_rec.payment_amount || 
                             ', Date: ' || payment_rec.payment_date);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END add_payment;
/
