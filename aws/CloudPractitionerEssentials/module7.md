# Module 7 - Databases

Relational databases store data in a way that relates it to other pieces of data, and they use **Structured Query Language (SQL)** to manage and query data. Also, you need some **Relational Database Management System (RDBMS)** to manage the databases.

> AWS Database Migration Service (DMS)

## Amazon Relational Database Service (RDS)

Is a managed service that handles routine database tasks such as backups, patching, and hardware provisioning. It's supports multiple database instance class types that optimize for memory, performance, or I/O.

*RDS* offers Multi-*AZ* deployment and automated backups, but you can use DB backups. RDS also offers security features such as network isolation, encryption in transit an at rest. It can be *vertically* or *horizontally* scaled.

### Engine support

- Amazon Aurora;
- MySQL;
- PostgreSQL;
- Microsoft SQL Server;
- MariaDB;
- Oracle Database;

Some benefits:

- Multi-*AZ* deployment;
- Performance optimization;
- Security controls;

## Amazon Aurora

Is a managed relational database designed to help reduce unnecessary I/O operations. It provides high performance, availability, and automatically scales. It's also Multi-*AZ*, automated backups, encryption at rest, and continuous monitoring.

### Engine support

- MySQL;
- PostgreSQL;

Some benefits:
- High performance and availability;
- Automated storage and backup management;
- Advanced replication and fault tolerance;

## NoSQL

NoSQL databases build a structure for the data that they contain using key-value pairs, with it, the data is organized into items identified by unique keys.

Each key has one or more attributes, or values, that represent various characteristics of the data. Not every item has to have the same attributes, and you can add or remove attributes at any time.

### Amazon DynamoDB

Is a fully managed NoSQL database service that provides fast and predictable performance for both document and key-value data structures. Ideal for high performance and seamless scaling.

It also includes built-in security features for enhanced protection, and automatically spreads your data across multiple servers to handle your workload.

Some benefits:
- Scalability with provisioned capacity;
- Consistent high performance;
- High availability and durability;
- Data encryption;

> DynamoDB Accelerator (DAX)

## In-memory caches

Is a high-speed storage layer that temporarily stores frequently accessed data in a computer's main memory, or RAM.

When applications need specific information, they first check the cache before requesting it from the original data source. Ideal for storing session data, API responses, database query results.

### Amazon ElastiCache

Is a fully managed in-memory caching service. You can use Redis, Valkey, or Memcached tools and configurations to scale your workloads. It automatically detects and replaces failed nodes.

Some benefits:
- High performance for Redis, Valkey, or Memcached instances;
- High availability;
- Replication across multi-*AZ*;
- Data encryption;

### Amazon DocumentDB

With MongoDB compatibility.
Is a fully managed service designed to handle semistructured data.
It manages JSON-like documents with dynamic schemas.

Ideal for applications that frequently changes schema and document-oriented data.

Can store, query, and index JSON data, all while benefiting from automatic scaling, continuous backup, and enterprise-grade security features.

Some benefits:
- MongoDB compatibility;
- Performance and scalability;
- Increased read throughput;

### AWS Backup

It streamlines data protection across many AWS resources and on-premises deployments by providing a single dashboard for monitoring and managing backups.

Supports *EBS*, *EFS*, and various databases.

*AWS Backup* centralizes and automates data protection processes.
It offers flexible scheduling options, encryption capabilities, and cross-Region backup support.

Some benefits:
- Centralized backup management;
- Cross-region backup redundancy;
- Streamlined regulatory compliance;

### Amazon Neptune

Is a fully managed, purpose-built graph database service that manages highly connected data sets.

Some benefits:
- Purpose-built for complex relationships;
- High performance and scalability;

> Amazon Managed Blockchain