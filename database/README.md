# Database Features

## ACID

- **[A]tomicity**: All operations in a transaction must be completed successfully, otherwise the transaction is aborted.

- **[C]onsistency**: The database must remain in a consistent state before and after the transaction.

- **[I]solation**: Transactions should be isolated from each other.

- **[D]urability**: Once a transaction is committed, it must remain committed.

## CAP Theorem

> Brewer’s Theorem

- **[C]onsistency**: All nodes see the same data at the same time.

- **[A]vailability**: A guarantee that every request receives a response about whether it was successful or failed.

- **[P]artition Tolerance**: The system continues to operate despite network partitions.

**Take Two.**

The CAP theorem states that it is not possible to guarantee all three of the desirable properties — consistency, availability, and partition tolerance at the same time in a distributed system with data replication.

## Hash Index

Used on RAM, not on HDs. The random insertion by the hash function may impair data access on the HD. 
But RAM is expensive and ephemera. For this, WAL was created.

With conflict:
- Chaining: Linked-list;
- Open Addressing: The next available;
- Resizing the Hash Table by a certain threshold: Rehash the existing keys;

##### WAL (Write Ahead Log)

Create logs for all RAM operations used by the Hash Index, then commit the changes.

> Hash Index don't support **Range Queries**

## B-Trees

Storage in solid drive (HD/SSD). Most used in SQL;

#### Pro ✅

- No storage limit;
- Fast reads;
- Support for Range Queries;

#### Cons ❗

- Make writing worse (Balance the tree)

## LSM Trees (Log-structured merge-tree)

Storage in both RAM and solid drive. Best for writes and good for reads.

Cassandra, DynamoDB, MongoDB, ScyllaDB.

#### Process

Write data in RAM, save using WAL.

During periodic service or full RAM (MemTable) using B-Trees/AVL/Self-balanced tree, with read O(1), the data is written to solid drive in Sorted Strings Tables (SSTables). Read is O(log(N))

With more data insertions, the number of SSTable increase, to solve this, **Compaction** is used, comparing the most recent data and overwriting in the result SSTable, merging both. Read is O(N)

#### Bloom Filter

Probabilistic data structure that enables you to check if an element is present in a set using a very small memory space of a fixed size. Improving search in SSTables.

## Replication

The data can be saved across different geographic regions to reduce the latency.

- Synchronous: The user waits until the data is updated across all databases, prioritizing consistency adding delay to the application; (CA - Consistency / Availability)

- Asynchronous: The other user can get the non-updated data. (AP - Availability / Partition Tolerance)

#### Single-Leader Replication

- Don't have written conflicts;
- Low throughput (data processed);
- Single point of failure;

#### Multi-Leader Replication

- Many write conflicts;
- High throughput;
- Solution for huge geographic areas

#### Leaderless Replication

- Write conflicts;
- Read with latency;
- High availability;

Uses **Quorum** to determine the number of databases to interact with.

### Conflicts

Solutions:
- **LWW - Last Write Wins** (save timestamp for each increment)
- Write with conflict, user decides;
- Use **CRDT - Conflict-free Replicated Data Type**

## Sharding / Data Partitioning

#### Range-based Partitioning

Based in range of some discreet column (ex: A-D, E-H).

Support for range-based queries but has hotspot as tradeoff.

#### Hash-based Partitioning

Use some hash function in a column to insert the data into separate databases.

Don't support range-based queries.

#### Round-robin Partitioning

The first record goes to the first node, the second to the second node, and so on.

#### Horizontal & Vertical partitioning

- Horizontal divides the data with hash or range based smaller tables;
- Vertical divides the columns of the tables creating extensions of the main table.

There may be hotspots in some cases.

## SQL ✕ NoSQL

#### SQL

Relational database, table based. Consistency, Security, Backup and Recovery;

**Vertical scale**;

Multirow transactions;

> [ACID](#acid)
> [B-trees](#b-trees)

#### NoSQL

Non-structured data, big data. Flexibility, Scalability, Cost efficiency;

**Horizontal scale**;

Built-in clustering;

Types:
- Key-values: Games, publicity, IoT;
- Graphs: Social media, fraud recognition;
- Documents: Semi-structured, JSON;
- Search: Indexing, aggregation;
- Columns: Analytics search;

## Cloud Store / Blob Stores

Stores static *Binary Large OBjects*

- Easy use;
- Autoscaling;
- Auto replication;

Solutions: S3, Google Cloud Store, Azure Blob Store.

## Cache

Faster than database.

#### Write types

- Write through;
- Write-Around;
- Write-Back;

#### Eviction Policies

- Least Recently Used (LRU);
- First In First Out (FIFO);
- Least Frequently Used (LFU);

## Lock types

### By Level (Granularity)

Locks can be applied at different levels of hierarchy:
- Database;
- Table;
- Page (fixed-size block of rows);
- Row (Online Transaction Processing - OLTP Systems);
- Column (rare);

### By Mode

Type of Access Control:
- Shared (S): Read-only, multi-read;
- Exclusive (X): Prevent read or writing;
- Update (U): Avoid deadlocks when upgrading to *Exclusive*;
- Intent (IS / IX / SIX): Indicate intention to lock at a lower level;
- Schema (SCH-S / SCH-M): Protects schema changes (DLL);
- Bulk Update: Used for bulk inserts to improve performance;

### By Duration

- Transaction: Held until transaction commits or rolls back;
- Statement: Released immediately after the SQL statement executes;
- Session: Held as long as the session is active;

### By Behavior

- Pessimistic: Locks resources before access to avoid conflicts;
- Optimistic: Doesn't lock, checks if data changed before commit (version/timestamp);

### By Purpose | Use Case

- Read: Locks while reading;
- Write: Prevents others from reading or writing;
- Intent: Marks intent to acquire lower-level locks;
- Gap / Predicate / Range: Locks a range of key values (serializable isolation);
- Key-Range: Prevents phantom reads locking index ranges;
- Next-Key (Row + Gap): Locks the index record and the gap immediately before it;
- Deadlock Detection: Track dependencies;

### By Application

- Advisory: Application code decides when to acquire/release;
- Application: Similar to *advisory*. Offered as built-in service by the DB or middleware;

### Multi-Version Concurrency Control (MVCC)

DB creates versions of rows. Writes work on a new version, and readers see a snapshot from before the transaction;

### Protocols and related rules

#### Two-Phase locking (2PL)

Guarantees serializability. With two phases:
- Growing: Transaction can acquire locks, but not release any;
- Shrinking: Once a lock is released, no new locks can be acquired;

## Transaction Isolation

| Isolation Level      | Prevents                    | Allows                         |
| -------------------- | --------------------------- | ------------------------------ |
| **Read Uncommitted** | Nothing                     | Dirty reads                    |
| **Read Committed**   | Dirty reads                 | Non-repeatable reads, phantoms |
| **Repeatable Read**  | Dirty, non-repeatable reads | Phantoms                       |
| **Serializable**     | All above                   | None                           |
