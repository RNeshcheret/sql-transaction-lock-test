CREATE TABLE IF NOT EXISTS accounts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    balance NUMERIC(10, 2)
);

INSERT INTO accounts (id, name, balance)
VALUES (1, 'John Doe', 100.00)
ON CONFLICT (id) DO NOTHING;
