-- SESSION 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION ;
SET @bal = (SELECT balance FROM accounts WHERE id = 1 );

UPDATE accounts SET balance = @bal + 10 WHERE id = 1;
-- UPDATE accounts SET balance = balance + 10 WHERE id = 1;


-- SESSION 2

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SET @bal = (SELECT balance FROM accounts WHERE id = 1 );
UPDATE accounts SET balance = @bal - 20 WHERE id = 1;
-- UPDATE accounts SET balance = balance - 20 WHERE id = 1;
SELECT balance FROM accounts WHERE id = 1 ;
COMMIT;


-- SESSION 1
COMMIT;


