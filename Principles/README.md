# SOLID

- **[S]ingle Responsibility Principle**: A class/method should have only one responsability.

- **[O]pen/Closed Principle**: A class should be open for extension but closed for modification.

- **[L]iskov Substitution Principle**: A superclass should be substitutable for its subclasses and the application should still function.

- **[I]nterface Segregation Principle**: A client should not be forced to implement an interface that it does not use.

- **[D]ependency Inversion Principle**: High-level should not depend on low-level. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions. Depend on abstraction, not on concretions.

# KISS

> Keep It Simple, Stupid.

Direct and clear codes are better for developing, maintaining, and scaling. Don’t optimize unless there is a requirement.

Break the problem into smaller parts and solve them one by one. Don't try to solve everything at once.

# DRY

> Don't Repeat Yourself.

*Rule of three*. Reuse and reduce duplicated code. Focus on centralize the business logic. Less code results in better maintainibility.

# YAGNI

> You aren't gonna need it.

It's a principle of XP, that suggest to don't create unessential code, avoiding over-engineering. Don’t optimize prematurely!

# TDA

> Tell, Don't Ask.

It's a principle that suggest to avoid asking for the state of an object to make a decision. Instead, tell the object what to do.

```
class Foo {
    private int value;
    get() {
        return value;
    }

    set(int value) {
        this.value = value;
    }
}

foo = new Foo();
if (foo.get() > 10) {
    foo.set(foo.get() + 1);
}

// ---

class Foo {
    // ...

    incrementGreaterTen(value) {
        if (value > 10) {
            value++;
        }
    }
}

foo = new Foo();
foo.incrementGreaterTen(11);

```

# TDD

> Test-Driven Development.

Write tests before writing the code:

1. Write a test that fails.

2. Write the code that makes the test pass.

3. Refactor the code.

4. Repeat.

# BDD

> Behavior-Driven Development.

It's a software development methodology that focus on the behavior of the software:

1. Define the behavior of the software.

2. Write the tests that describe the behavior.

3. Write the code that makes the tests pass.

4. Refactor the code.

5. Repeat.

# Load Balancer

Balance the load of requests between services

#### Pros:
    - Scalability
    - Performance
    - Availability

#### Main features
    - Health services check
    - TLS Termination (encrypt/decrypt data transfer)
    - DDOs security
    - Service discovery

It can be applied between services with multiple instances (user/web server, web server/app server, app server/database)

# API Gateway

Creates the API routes with authentication, authorization, monitoring.

Centralizes the business rules.

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

##### WAL (Write Ahead Log)

Create logs for all RAM operations used by the Hash Index, then commit the changes.

> Hash Index don't support Range Queries, because of it's hash function

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

#### Process

Write data in RAM, save usign WAL.

During periodic service or full RAM using B-Trees/AVL/Self-balanced tree O(1), the data is written to solid drive in Sorted Strings Tables (SSTables). O(log(N))

With more data insertions, the number of SSTable increase, to solve this, **Compaction** is used, comparing the most recent data and overwriting in the result SSTable. O(N)

## Replication

The data can be saved across different geographic regions to reduce the latency.

- Synchronous: The user waits until the data is updated across all databases, prioritizing consistency adding delay to the application;

- Asynchronous: The other user can get the non-updated data.

#### Single-Leader Replication

- Dont have write conflicts;
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

Uses quorum to determine the number of databases to interact with.

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
- Vertical divides the columns of the tables creting extensions of the main table.

There may be hotspots in some cases.

> Amazon approaches: Local & Global secondary index - DynamoDB.

# CDN (Content Delivery Network)

Static assets regional providers.

Save static data from live servers to give more performance in requests.

#### Feeding

- **Push**: Service knows which data is most used data, bringing it to the CDN server;
- **Pull**: The server is fed by user experience.

# Monoliths ✕ Microservices

## Monolith

Coupled services, but can be structured as distributed systems.

#### Pro ✅

- Easy first deployment (monorepo);
- Centralized dependencies management;

#### Cons ❗

- Scale all structure;
- One problem in one service can reflect in multiples services;

## Microservices

#### Pro ✅

- Each service can be scaled individually;
- Multirepo, for different teams;

#### Cons ❗

- More management in deployment

> Docker + Kubernetes for orchestrate the Microservices

# Event Driven

> RabbitMQ, Kafka

Include a Order **Topic** in the middle of the communication between Order Service and Order Processor. Ensuring that requests are processed with delay if processor crashes, or service crash and there are requests to process in the Topic.

The data maybe inconsistent, because the operation is assynchronous.

The scalability is better than Request Response because it doesn't need the dependency between services. It's not coupled.

### Request Response

> REST, gRPC, GraphQL

Order service and order processor are very coupled. If one crashes, all falls down.

As synchrounous operations, the data may be inconsistent.

|Event Driven|Request Response|
|-|-|
|Flexible Architecture|Coupled services|
|Decoupled services|Hard integration|
|More availability|More overload|
|Less overload|More failure poitns|