-- SESION 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM accounts WHERE balance > 50;



-- SESSION 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
INSERT INTO accounts (id, name, balance) VALUES (2, 'New Account', 60);
COMMIT;


-- SESSION 1
SELECT * FROM accounts WHERE balance > 50;
-- The new row might appear, creating a phantom read
COMMIT;