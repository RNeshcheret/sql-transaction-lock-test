# Test Transaction Isolation levels

### Setup

Run DBs within the docker

```sh
docker compose up -d
```

### Access the Databases

##### Percona (MySQL) client

```sh
docker exec -it percona-isolation-test mysql -u root -p
```

##### PostgreSQL

```sh
docker exec -it postgres-isolation-test psql -U testuser -d testdb
```

## Isolation levels

> NOTE: To simulate parallel execution run db clients in 2 separate terminals

#### Lost Update

Isolation Level: _Repeateable read_
This scenario tests for a "lost update," where two concurrent transactions read the same data and then update it, resulting in one of the updates being lost.

#### Dirty Read

Isolation level: _Read uncommited_
Description: This scenario tests for "dirty reads," where one transaction reads uncommitted changes made by another transaction.
PG: not occure
MySql: occure

#### Non-Repeatable Read

Isolation Level: _Repeatable Read_
Description: This scenario tests for "non-repeatable reads," where a transaction reads the same row twice and gets different values because another transaction has modified the row.

#### Phantom Read

Isolation Level: _Read Commited_
Description: This scenario tests for "phantom reads," where a transaction re-executes a query returning a set of rows that satisfy a condition and finds that the set of rows satisfying the condition has changed due to another recently-committed transaction.
