CREATE OR REPLACE PROCEDURE process_all_orders IS
    v_remaining NUMBER;
    v_random_pay_method NUMBER;

    -- Cursor to iterate through all orders
    CURSOR c_orders IS
        SELECT co.order_id, c.fname || ' ' || c.lname AS customer_name
        FROM CustomerOrder co
        JOIN Client c ON co.client_id = c.client_id;

BEGIN
    FOR order_rec IN c_orders LOOP
        BEGIN
            -- Calculate remaining payment
            v_remaining := calculate_remaining_payment(order_rec.order_id);
            
            -- Print order information
            DBMS_OUTPUT.PUT_LINE('Order ID: ' || order_rec.order_id);
            DBMS_OUTPUT.PUT_LINE('Customer: ' || order_rec.customer_name);
            
            IF v_remaining > 0 THEN
                DBMS_OUTPUT.PUT_LINE('Additional payment needed: ' || v_remaining);
                
                -- Generate random payment method (assuming 3 payment methods exist)
                v_random_pay_method := TRUNC(DBMS_RANDOM.VALUE(1, 4));
                
                -- Add new payment
                add_payment(order_rec.order_id, v_remaining, v_random_pay_method);
                
                DBMS_OUTPUT.PUT_LINE('New payment added successfully.');
            ELSIF v_remaining = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Order is fully paid.');
            END IF;
            
            DBMS_OUTPUT.PUT_LINE('----------------------------');
        EXCEPTION
            WHEN OTHERS THEN
                IF SQLCODE = -20001 THEN  -- Our custom exception for overpayment
                    DBMS_OUTPUT.PUT_LINE('Overpayment detected: ' || SQLERRM);
                ELSE
                    DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
                END IF;
                DBMS_OUTPUT.PUT_LINE('----------------------------');
        END;
    END LOOP;
END process_all_orders;
/
