-- SESION 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT balance FROM accounts WHERE id = 1;




-- SESSION 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE accounts SET balance = 200 WHERE id = 1;
COMMIT;


-- SESSION 1
SELECT balance FROM accounts WHERE id = 1;
-- The balance might have changed, leading to a non-repeatable read
COMMIT;