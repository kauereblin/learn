# Module 1

### What is cloud computing?

AWS computing was formed from the necessity of having a more flexible and scalable computing environment to deploy its ecommerce.

> On-demand delivery of IT resources over the internet with pay-as-you-go pricing.

#### Cloud deployment types

- Cloud: Migrate all resources to the cloud, design and build apps in cloud. First migrate the data then develop an app comprised of virtual servers, databases and networks.

- On-premises: Deploying using virtualization and resource management tools to manage resources in your own data center. This deployment type is often used for legacy applications or when data residency is a concern, to try increasing resource utilization.

- Hybrid: cloud-based and on-premises resources working together. This is often used to gradually migrate to the cloud or to keep sensitive data on-premises while using cloud resources for other workloads.

### Benefits

- Variable expense
- Automatic scalability based in the traffic
- Increase speed and agility
- Globalized

#### Availability Zones (AZ)

Distributed power, networking and connectivity in different regions;

- **High availability**: Affordable application with minimal downtime
- **Fault tolerance**: Keep the application up if multiple services fail

#### Shared Responsibility Model

Both the customer and AWS are responsible for the security of the service.

The AWS is responsible for the security of the cloud.

The customer is responsible for the security in the cloud.

![Shared Responsibility Model](./assets/M01_L5_SRM_Intro.png "Shared Responsibility Model")

---

# Module 2

## Compute in the Cloud (CaaS)

Compute refers to the processing power needed to run applications, manage data, and perform calculations. In the cloud it's provide by VMs over the internet.

### Amazon Elastic Compute Cloud (EC2)

- Highly flexible
- Cost-effective
- Quick

#### Multitenancy

Sharing underlying hardware between virtual machines.

Hypervisor software manage the multitenancy in each machine.

#### Configuration / Launch

- OS: Windows | Linux;
- Runs: Internal business apps | Web apps | Databases | Third-party software
- Vertical scaling;
- Control networking aspect;

#### Connect

- SSH for Linux images;
- RDP for Windows instances;
- By web;

#### Use

- Run commands;
- Install software;
- Manage storage;

#### Types

> *Instance family* and *instance size*

- **General purpose**:
  - Balanced resources
  - Diverse workloads
  - Web servers
  - Code repositories

- **Compute optimized**: 
  - Compute-intensive tasks
  - Gaming servers
  - High performance computing
  - Scientific modeling

- **Memory optimized**:
  - Memory-intensive tasks (Data lakes)

- **Accelerated computing**:
  - Floating point number computing
  - Graphic processing
  - Data pattern matching
  - Hardware accelerators

- **Storage optimized**:
  - High performance for locally stored data;

#### Interact

- **AWS Management Console**:
  - Setup test environments
  - View bills
  - View Monitors
  - Non-technical resources;
  - Chance of getting errors by manual configuration

- **AWS Command Line Interface (CLI)**:
  - Scripting
  - Automation

- **AWS Software Development Kit (SDK)**:
  - Programming languages
  - Libraries

#### Shared Responsibility EC2

Requires all the security configuration and management tasks.

- Configure security;
- Managing the guest OS;
- Apply updates;
- Set firewalls;

![Shared Responsibility Model EC2](./assets/M02_L3_SRM_Unmanaged.png "Shared Responsibility Model EC2")

## Amazon Machine Images

Pre-built VM images that have the basic components to start an instance.

Includes the OS, storage setup, architecture type, permissions for launching.

The AMI can be used to launch several EC2 instances that have the same setup.

- Ways to use:

1. Custom a AMI by yourself;
2. Use pre-configured AMIs;
3. Purchase AMIs from the AWS Marketplace, where vendors offer specialized software.

#### AMI Repeatability (AMI)

AMI provide repeatability through a consistent environment for every new instance. Helps when scaling, reduces errors, streamlines managing large-scale environments.

## Pricing

#### On-Demand

Pay for the compute capacity you consume. No upfront payments or long-term commitments.

#### Savings Plans

Save up to 72% across a variety of instance types by committing to a consistent usage for 1 or 3 years.

#### Reserved Instances

Save up to 75% by committing to a 1 or 3 years term for predictable workloads, using specific instance families and AWS Regions.

#### Spot Instances

The AWS can reclaim the instance, but you can save up to 90% off of On-Demand.

#### Dedicated Hosts

Dedicated hardware for you. This option offers full control, and is ideal for strict security or licensing needs.

#### Dedicated Instances

Instances running in dedicate hardware to your account, without sharing any resource.

### Cost Optimization

- Savings Plans: *Good for predictable workloads*. Discounts compared to On-Demand pricing, to use a specified amount of compute power (per hour) over a one-year or three-year period, regardless of instance type or AWS Region.
  - Payment options: All upfront, Partial upfront, or No upfront

- Capacity Reservations: *Good for critical workloads with strict capacity requirements*. Reserve compute capacity in specific AZ for critical workloads. Charged at the On-Demand rate.

- Reserved Instance Flexibility: *Good for steady-state workloads with predictable usage*. Discounts across instance sizes and multiple AZs within a Region, up to 75% over On-Demand.

## Scaling EC2

> **Scalability** is about a system’s potential to grow over time, whereas **Elasticity** is about the dynamic, on-demand adjustment of resources.

Increasing power, can **Scale Up** (vertical scaling) adding more power to existing machines or **Scale Out** (horizontal scaling) by adding more machines.
Decreasing, can **Scale Down** or **Scale In**.

Elasticity is the ability to automatically scale resources up or down base in real-time demand. Elasticity provides cost efficiency and optimal resource usage.

### EC2 Auto Scaling

Automatically adjusts the number of EC2 instances.

- *Dynamic Scaling*: Adjusts in real time to fluctuations in demand.
- *Predictive Scaling*: Preemptively schedules the right number of instances based on anticipated demand.

You can create Auto Scaling groups, which are collections of EC2 instances that can scale in or out to meet your application’s needs. Auto Scaling group is configured with *Minimum Capacity*, *Desired Capacity* and *Maximum Capacity*.

> [Amazon Resource Explorer](https://resource-explorer.console.aws.amazon.com/resource-explorer/home?region=us-east-2#/home)

## Elastic Load Balancing (ELB)

Load Balancers receive requests and distributed evenly them into instances.

A load balancer serves as the single point of contact for all incoming web traffic to an Auto Scaling group.

ELB and Amazon EC2 Auto Scaling are distinct services, they work together to enhance application performance and availability.

#### Benefits

- Efficient traffic distribution: ELB evenly distributes traffic across instances, preventing overload.

- Automatic scaling: ELB scales with traffic and adjusts to changes in demand.

- Simplified management: ELB decouples frontend and backend tiers and reduces manual synchronization. It handles maintenance, updates, and failovers.

### Routing methods

- **Round Robin**: Distributes across all available servers in a cyclic manner.

- **Least Connections**: Routes traffic to the server with the fewest active connections.

- **IP Hash**: Uses the client's IP to route traffic to the same server.

- **Least Response Time**: Directs traffic to the server with the fastest response time.

> [Elastic Load Balancing](https://aws.amazon.com/pt/elasticloadbalancing/)

## Messaging and Queuing

#### Monolithic Applications

Multiple components work together to transmit data, fulfill requests and keep the application running. In traditional approach to application architecture, the components are tightly coupled. If one component fails, it can cause the failure of others, potentially bringing down the app.

#### Microservices Architecture

To improve availability and resilience, the microservices architecture brings loosely relationship between components. If one fails, the others maintain working, the communication remains intact.

### EventBridge

EventBridge is a serverless service that helps connect different parts of an application using events. You can route events from sources like custom apps, AWS services, and third-party software to other applications.

EventBridge simplifies the process of *receiving*, *filtering*, *transforming*, and *delivering* events.

It can handle high volumes of events during peak times, making each service works independently. EventBridge will store the event and process it as soon as the service is available again.

### Amazon SQS

A message queuing service that facilitates reliable communication between software components.

It can *send*, *store*, and *receive* messages at any scale.

In SQS, an app places messages into a queue, and a user or service retrieves the message, process and then removes from the queue.

### Amazon SNS

SNS is a publish-subscribe service that publishers use to send messages to subscribers through SNS topics.

In SNS, subscribers can include web servers, email addresses, Lambda functions and various other endpoints.

> [EventBridge](https://us-east-2.console.aws.amazon.com/events/home?region=us-east-2#/)

> [Simple Queue Service (SQS)](https://us-east-2.console.aws.amazon.com/sqs/v3/home?region=us-east-2#/)

> [Simple Notification Service (SNS)](https://us-east-2.console.aws.amazon.com/sns/v3/home?region=us-east-2#/homepage)

---

