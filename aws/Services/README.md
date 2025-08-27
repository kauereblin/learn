Deploy: CDK (Cloud developer kit), SAM (Serverless App Model), Serverless framework, CloudFormation, Terraform, Kubernetes;

## S3 Bucket (Simple Storage Service)

Store:
- Data;
- Documents;
- Backups;
- Archives;
- Assets;
- Static sites*;

✅ Cheap, scalable;
❗ Latency, cost on-demand;

## EC2 (Elastic Compute Cloud)

VM:
- Servers;
- Processing (jobs/workers);

✅ Versatility;
❗ Cost on-demand;

## ECS (Elastic Container Service)

- Orchestration;
- Docker instances;
- EC2 Clusters;

✅ Simplify scale, Resource optimization;
❗ Configuration complexity, Vendor lock-in;

## EKS (Elastic Kubernetes Service)

## ALB (Amazon Load Balancer)

- Balance request load/traffic;
- Based on: Http/Https, Routes;

✅ Advanced Routing, SSL Termination;
❗ Cost, Configuration;

## Elastic Beanstalk

- Servers;
- PaaS;

✅ Less complexity, on-demand, web server;
❗ Vendor lock-in, black box;

## Lambda

1 req -> 1 endpoint -> 1 invocation;

- Low configuration;
- Pay-per-use;
- Manage the processes (can cost more for wrong code)

✅ Cheap, Scalable;
❗ Timeout, Memory, Cold-start;

## API Gateway

- Create, Publish, Maintain, Monitoring APIs;

✅ Support, integration;
❗ Cost on-demand, Latency, Timeout, Vendor lock-in;

## Step Functions

- FSM;
- Coordinate workflows;

✅ Retry, Queue;
❗ Vendor lock-in, Complexity;

## RDS (Relational Database Service)

Database;

✅ Monitoring;
❗ Vendor lock-in;

## DynamoDB

Database NoSQL;

- Hash Key + Sort Key = More Performance;

✅ Scalable, Latency, Global table, Events support;
❗ Cost pay-per-use, Learning curve;

## EMR (Elastic MapReduce)

Managed cluster platform to run big data frameworks.
Process and analyze vast amounts of data.

✅ Data lakes, batch jobs, process big data;
❗ Cost;

## SQS (Simple Queue Service)

Queues;

## SNS (Simple Notification Service)

Notifications (Event-driven);

- Pub/Sub;

## Cloudwatch

- Transactional Logs

## Secret Manager

- Environment variables;

## Cloudfront

- CDN (Content Delivery Network);