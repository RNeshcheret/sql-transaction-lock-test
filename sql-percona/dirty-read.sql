-- SESION 1
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
UPDATE accounts SET balance = 50 WHERE id = 1;



-- SESSION 2
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
SELECT balance FROM accounts WHERE id = 1;
-- Reads value from uncommitted transaction(SESSION 1)
COMMIT;


-- SESSION 1
ROLLBACK;