# Module 6 - Storage

Three main types:

- Block;
- Object;
- File;

## Block Storage

Provide persistent, low-latency block-level storage volumes that attach to EC2 like physical HD. *Block Storage* volumes can be encrypted, backed up via snapshots, and modified while in use.

AWS offers two primary *Block Storage*:

- **Amazon EC2 instance storage**: Unmanaged non-persistent, high-performance block storage for temporary data;

- **Amazon Elastic Block Store (EBS)**: Managed service that provides persistent block storage volumes for EC2.

### EC2 Instance Storage

Is a block-level storage that is physically attached to the EC2 instance host computer.

When an instance is stopped or terminated its data is deleted. Is best for temporary memory-based like buffers, caches, and scratch data.

**Benefits**:

- Automatically available storage: Come automatically to many EC2 instance types at no additional cost.

- Cost: You don't have to pay any additional fees for storage because EC2 instance store is included in the price;

- High performance: Because the storage is direct attached to the host server, it offers high I/O performance.

### Elastic Block Storage (EBS)

Provides persistent block-level storage volumes, acting like external drives, used for databases and file systems.

EBS volumes can be conveniently backed up, resized, and attached to different EC2 instances.

It's important to back up the data, it's recommended that you take incremental backups by creating EBS snapshots.

Use cases: database hosting, backup storage for apps, and rapid deployment of development environments using snapshots.

As the customer, you are responsible for scheduling and managing regular EBS snapshots as part of your backup strategy. This includes monitoring snapshot costs and deleting unnecessary snapshots. You also need to make sure the data is encrypted, verify integrity, and test restoration procedures.

**Benefits**:

- Data Migration: Can be easily migrated between AZ using snapshots;

- Instance type change: Lets you upgrade or downgrade instances without losing data;

- Disaster Recovery: EBS Snapshots provide reliable backup solutions;

- Performance Tuning: EBS offers various volume types to match different workload requirements and IOPS (I/O per second) needs;

- Cost: Incremental backup reduce storage costs and time.

#### EBS Snapshots

Are point-in-time backups of EBS volume. Used for disaster recovery, data migration, volume resizing, and for creating consistent backups. EBS snapshots are **incremental**.

Snapshots are stored redundantly in multiple *AZ* using *S3*.

#### EBS Lifecycle

- Schedule automatic snapshot creation;

- Set retention policies;

- Manage snapshot lifecycle;

- Apply consistent backup policies;

## Amazon Data Lifecycle Manager Workflow

Automate creating, retention, and deletion of EBS snapshots. ADLM can schedule snapshots during off-peak and automatically delete outdated backups. It's valuable for large-scale deployment.

## Object Storage

Is a data storage architecture that manages data as objects in a *flat address space*. With unlimited scalability. *Object Storage* provides enhanced metadata capabilities for more efficient, management, search, and analytics.

The primary AWS *Object Storage* is:

- **Amazon Simple Storage Service (S3)**: Fully managed scalable object storage service for storing and retrieving any amount of data.

### Amazon Simple Storage Service (S3)

Is a fully managed, high-available object storage for storing and retrieving any amount of data as objects. And offers features like versioning, lifecycle management, and various storage classes.

S3 stores data as objects (max 5TB) in containers known as buckets without size limit;

When you upload a file to S3, it becomes an object and is stored durably across multiple facilities within your chosen *Region*. Each object includes the *data* itself, *metadata* and a unique identifier, or *key*. Objects also have properties like version ID, access control info, and user-defined metadata.

Buckets have globally unique name across all of AWS.

Benefits:
- Virtually unlimited storage;
- Object lifecycle management;
- Broad range of use cases: content distribution, hosting static websites, and delivering media files, application data storage, archiving, data lakes, and compliance-driven data retention;

#### Security

- Private access by default;
- Buckets policies: Are resource-based policies, attached to *S3 Buckets*;
- Identity-based policies: Permissions that control what actions users, groups, or roles can perform.
- Encryption: *at rest*, and *in transit*.
- Presigned URLs;
- Amazon S3 access points;
- Amazon S3 audit logs;

#### S3 Storage Classes

- **Standard**: Considered general-purpose storage, is the default storage class. Uses three **AZ** redundancy;

- **Intelligent-Tiering**: Useful if your data has unknown or changing access patterns. It's stores in three tiers: frequent access, infrequent access, and archive instant access. S3 Monitor automatically moves your data to the most cost-effective storage tier;

- **Standard Infrequent Access (Standard-IA)**: Is for data that is accessed less frequently but requires rapid access. Ideal for long-term backups, disaster recovery files;

- **One Zone Infrequent Access (One Zone-IA)**: Stores data in a single *AZ*, reducing costs compared to *Standard-IA*. Ideal for secondary backups or easily recreatable data, infrequently accessed data without high availability.

- **Express One Zone**: Single *AZ*. S3 Express One Zone delivers data access speed up to 10x faster and request cost up to 80% lower than *S3 Standard*. It used for most frequently accessed data and latency-sensitive apps;

- **Glacier Instant Retrieval**: It's for data rarely access and requires millisecond retrieval. Offers a cost savings of up to 68% compared to *S3 Standard-IA*

#### S3 Lifecycle

You can choose to automate between two types of actions:

- *Transition actions*: Define when objects should transition to another storage class;
- *Expiration actions*: Define when objects expire and should be permanently deleted;

Without access:
1. 30 days: S3 Standard -> Standard-IA;
2. 60 days: Standard-IA -> Glacier Instant Retrieval;
3. 1 year: Glacier Instant Retrieval -> Deleted;

Use cases:
- Periodic logs: After a week or later you might to delete the logs;
- Data that changes in access frequency: After some time, the data becomes infrequently accessed, but some regulations require to archive them.

## File Storage

Provide shared file system accessible over network. It offers scalability and flexibility without managing physical infrastructure.

AWS offers two primary *File Storage*:

- **Amazon Elastic File System (EFS)**: Fully managed, scalable NFS file system for use with AWS Cloud and on-premise resources.

- **Amazon FSx**: Fully managed file storage services for popular file systems like Windows, Lustre, and NetApp ONTAP.

### Amazon Elastic File System (EFS)

Fully managed, scalable file storage service for use with hybrid resources (AWS or on-premises). It uses the *Linux Network File System (NFS)* protocol, and automatically scales. Accessed by multiple EC2 instances simultaneously.

- Multi-AZ redundancy: Automatically replicates data across multiple *AZs*;
- Shared Access: Supports concurrent NFS connections. Ideal for collaborative workloads and distributed systems.
- Elastic Storage: Automatically grows and shrinks (cost-effective).

#### EBS x EFS

EBS (Elastic Block Store) | EFS (Elastic File System)
-|-
Volume attach to EC2 | Multiple reading and writing simultaneously
*AZ* level resource | Regional resource
Need to be in the same *AZ* to attach to EC2 | Linux file system
Don't automatically scale | Automatically scales

#### EFS Storage Classes

- **Standard**: EFS Standard and EFS Standard-Infrequent Access (Standard-IA) storage classes offer Multi-AZ, durability and availability. Higher cost due to higher availability and durability;

- **One Zone**: EFS One Zone and One Zone-IA saves your data in a single AZ. Reduced cost compared to Standard.

- **Archive**: Is cost-optimized for data that is accessed a few times a year or less. Storage price up to 50% lower than EFS-IA.

#### EFS Lifecycle

You can create lifecycle policies that determine when and how files transition between storage tiers.

- Transition to IA: By default, data that are not accessed in Standard for 30 days are transitioned into IA.

- Transition to Archive: By default, the time limit is 90 days to transition data into Archive class.

- Transition to Standard: You can create a policy to transition data back to Standard, by default the data remains on IA or Archive, even when accessed.

### Amazon FSx

It's a fully managed service compared to *EFS*, *FSx* supports multiple filesystem protocols, including Windows File Server, Lustre, OpenZFS, and NetAPP ONTAP.

- File system integration;
- Managed infrastructure;
- Scalable storage;
- Cost effective;

#### For Windows File Server

- Accelerate hybrid workloads;
- Reduce SQL Server deployment cost;
- Streamline virtual desktops and streaming.

#### For NetAPP ONTAP

- Modernize your data management;
- Streamline business continuity.

#### For OpenZFS

- Deliver insights faster for data analytics
- Accelerate content management;
- Increase dev/test velocity;

#### For Lustre

- Accelerate machine learning;
- Enable high performance computing (HPC);
- Unlock big data analytics;
- Increase media workload agility;

## Additional Storage Services

- **AWS Storage Gateway**: Fully managed, hybrid-cloud storage service that provides on-premises access to virtually cloud storage.

- **AWS Elastic Disaster Recovery**: Fully managed service that streamlines the recovery of your physical, virtual, and cloud-based servers.

### AWS Storage Gateway

Hybrid cloud storage service that makes it possible to integrate on-premise with AWS Cloud storage.

Some Benefits:
- Seamless integration;
- Improved data management: centralized management;
- Local caching: keep frequent used data in local and less used in the cloud;
- Cost optimization: archiving, backup, and disaster recovery;

#### Types

- **Amazon S3 File Gateway**: provides on-premises apps with access to virtually cloud storage with familiar file protocols. Uploaded files appears as standard file server.

- **Volume Gateway**: You create virtual storage volumes while maintaining local access to your data. It presents the data as iSCSI volumes that can be mounted by your existing apps.
  - *Cached Volume mode* stores primary data in the cloud while frequently accessed data is cached locally;
  - *Stored volume mode* locally keeps your dataset while asynchronously backing it up to the cloud as *EBS snapshots*;

- **Tape Gateway**: Replace physical tape infrastructure with virtual tape. It provides an interface that works with existing tape backup. It presents to your backup as standard tape hardware. Your backup software writes data to these virtual tapes and store in *S3*.

## Amazon Elastic Disaster Recovery

It replicates critical workloads to AWS with minimum downtime. It supports both physical and virtual servers. You can use to reduce downtimes and data loss while eliminating the costs to maintaining secondary data centers.

Some benefits:

- Business resilience;
- Streamlined disaster recovery;
- Cost optimization;