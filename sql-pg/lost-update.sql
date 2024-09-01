-- SESSION 1
BEGIN; -- start transaction
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

DO $$
DECLARE
    bal NUMERIC;
BEGIN
    SELECT balance INTO bal FROM accounts WHERE id = 1;
    UPDATE accounts SET balance = bal + 10 WHERE id = 1;
    -- UPDATE accounts SET balance = balance + 10 WHERE id = 1; 
    RAISE NOTICE 'balance is %', bal;
END $$;



-- SESSION 2

BEGIN; -- start transaction
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

DO $$
DECLARE
    bal NUMERIC;
BEGIN
    SELECT balance INTO bal FROM accounts WHERE id = 1;
    UPDATE accounts SET balance = bal - 20 WHERE id = 1;            -- takes balance from variable (lost update)
    -- UPDATE accounts SET balance = balance - 20 WHERE id = 1;     -- takes balance from table state (correct update)
    RAISE NOTICE 'balance is %', bal;    
END $$;
COMMIT;


-- SESSION 1
COMMIT;


