# Module 12 - Migrating to the AWS

There are three phases of the migration process

### Assess

Build the business case for the migration and assess your readiness.

Service to help: *Migration Evaluator*.

### Mobilize

Prepare the organization and mobilize the resources needed.

Services to help: *AWS Application Discovery* and *AWS Migration Hub*.

### Migrate and Modernize

Use your strategy, plan, and the best practices.

Services to help: *AWS Application Migration Service* and *AWS Database Migration Service (DMS)*.

Tool for transfer data: *AWS DataSync*, *AWS Transfer Family*, and *AWS Snow Family*.

## AWS Cloud Adoption Framework (CAF)

Is a framework that brings AWS experience and best practices to companies.

It provides tools to help the migration journey, organize resources, and align management during the transition.

It improves sustainability and corporate transparency reducing business risks.

There are groups of stakeholders with perspectives to consider in the migration:

- **Business**: Align business strategies and goals with IT strategies and goals;
  - Business managers;
  - Finance managers;
  - Budget owners;
  - Strategy stakeholders;
- **People**: Structure the organization and roles, process requirements, and identify gaps;
  - Human resources;
  - Staffing;
  - People managers;
- **Governance**: Focuses on skills and processes to align IT with business. Max value x Min risks;
  - Chief Information Officer (CIO);
  - Program managers;
  - Enterprise architects;
  - Business analysts;
  - Portfolio managers;
- **Platform**: Includes principles and patterns for implementing and migrating on-premises;
  - Chief Technology Officer (CTO);
  - IT Manager;
  - Solutions architects;
- **Security**: Make sure the organization meets security objectives for visibility, auditability, control, and agility;
  - Chief Information Security Officer (CISO);
  - IT Security Managers;
  - IT Security Analysts;
- **Operations**: Helps you to enable, run, use, operate, and recover IT workloads to the level agreed with business stakeholders;
  - IT Operations Managers;
  - IT Support Managers;

### AWS CAF Action Plan

Helps guide your organization for cloud migration.

## The 7 Rs

The decision on which strategy depends on factors such as the complexity of existing apps, business goals, time constraints, and available resources.

### 1 Relocate

Is changing the hosting location to the cloud.

Could be if apps are already VMs or containers running on premises.

### 2 Rehost

> Lift-and-shift.

Moving apps without changes.

The company is looking to implement its migration and scale quickly.

### 3 Replatform

> Lift, tinker, and shift.

Making cloud optimizations (not the core) to achieve benefits.

### 4 Refactor

> Re-architecting.

Driven by business need to add features, scale, or improve performance.

### 5 Repurchase

Moving from a traditional license to a SaaS - to a different product.

### 6 Retain

Keeping apps that are critical, which includes apps that require refactoring before migrating.

### 7 Retire

Removing no-needed applications.

## Migration Evaluator

Is a migration assessment service that help you create a business case for AWS Cloud planning and migration.

Is *data-driven*, analyzing the current state, target, and developing migration readiness plan with projected costs.

## Application Discovery Service

Discovers on-premises server inventory and connections.

It gathers configuration, performance, and connection details for both servers and database to create migration plan.

## Migration Hub

Is a centralized hub to take you from discovery, assessment, planning, and execution of your migration.

It provides tools, guidance, and automated recommendations.

## Application Migration Service

Is a tool to move and improve your on-premises and cloud-based apps.

- Streamlined migration process;
- Reduced risk of errors or downtime;
- Cost savings;
- Faster time to value;

## Migrating Databases

Services to plan, migrate, and, convert.

You can redesign and improve your database architecture.

Homogeneous migration occur when both servers are using the same database engine.

### AWS Database Migration Service

It makes it possible to quickly and securely migrate databases and perform data replication tasks for live databases and data warehouses.

It provides a way to plan, assess, convert, and migrate databases even with data warehouses in one tool.

It supports homogeneous and heterogeneous migrations, maintaining high availability and low downtime.

### AWS Schema Conversion Tool

Convert database schemas and code objects (procedures, views, and functions) from one engine to another.

IT gives an estimate of how big of and effort a conversion is.

Automating schema analysis, recommendations, and conversions at scale.

## Transferring Data Online

Insurances: security, data validation, scheduling.

### AWS DataSync

Designed for automating and accelerating data transfer between on-premises and AWS.

It automates running instances, encryption, and network optimization, managing bandwidth throttling, migration scheduling, task filtering, and task reporting.

It also provides rapid data replication.

### AWS Transfer Family

Fully managed support for file transfers into and out S3.

It manages and share data with secure and scalable file transfers.

It supports different transfer protocols, like FTP, Secure FTP (SFTP), FTP Secure (FTPS).

It provides secure transfer with encryption and authentication. It is built to scale.

### Direct Connect

Is a service that makes it possible to establish a dedicated private connection between your network and VPC in AWS.

## Transferring Data Offline

### Snowball Edge Storage Optimized devices

These devices deliver high performance NVMe storage.
