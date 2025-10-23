# Module 11 - Pricing and Support

## Key Concepts

- **Pay as you go**: On-demand costs, you can adapt to changing business needs and reduce overprovisioning or missing capacity;
- **Save when you commit**: Savings Plans offers savings over On-Demand when you commit to a 1-year or 3-year;
- **Pay less by using more**: For some services, pricing is tiered, the more you use, the less you pay;

The pricing varies based on service category or type, configuration, Regions, and pricing model. There are three main drivers of cost:

- **Compute**: You pay by a span of time (sec or hour), from the launch to the stop;
- **Storage**: There are 6 cost components:
  - Storage type;
  - Request and data retrieval;
  - Data transfer and transfer acceleration;
  - Data management and analytics;
  - Replication;
  - Process your data with Amazon S3 Object Lambda;
- **Data Transfer**: Outbound data transfer is aggregated across services and then charged at the outbound data transfer rate. The more you transfer, the less you pay. (You can be charged in same Region);

## [AWS Organizations](./module10.md#aws-organizations)

You can consolidate billing with multiple accounts using a single payment method.

## AWS Billing and Cost Management dashboard

It centralizes cost management, showing current charges, usage, forecasts, and breakdowns.

It also provides tools to manage payments, view invoices, set budgets, and consolidate billing.

## AWS Budgets

It helps to set custom budgets and sends alerts when costs, usage, or Savings Plans and **Reserved Instances (RI)** utilization or coverage exceed defined thresholds.

## AWS Cost Explorer

It helps visualize, analyze, and manage AWS costs, showing interactive graphs, reports, and forecasts.

It provides insights into spending patterns, trends, and Reserved Instance recommendations.

## AWS Pricing Calculator

It is a web-based planning tool to create estimates.

## AWS Support Plans

Basic | Developer | Business | Enterprise On-Ramp | Enterprise
-|-|-|-|-
Access to docs, whitepapers, and AWS re:Post|Response times: <24h general guidance / <12h when system impaired|Response times: <4h when system impaired / <1h when system is down|Response times: <30min when system is down|Response times: <15min when system is down
Core AWS Trusted Advisor checks|Includes previous|Full set of AWS Trusted Advisor checks|Includes previous|Includes previous and prioritized recommendations
Technical Account Management not included|Same as previous|Same as previous|A pool of **technical account managers (TAM)** provides guidance|Designated TAM provides consultancy

#### Additional Resources

- AWS re:Post: community-driven, QA platform. It houses AWS Knowledge Center;
- AWS Trust and Safety Center: Provides information on how to report activity or content;
- AWS Solutions Architects: For Business or Enterprise Support, provides architectural guidance;
- AWS Professional Services: Is a consulting service that offers deeper, project-based support;
- Self-Support at AWS;

## AWS Marketplace

Is a catalog to find, test, buy, deploy, manage third party software running on AWS architecture.

It offers some categories:

- SaaS: business apps / marketing tools / collaboration tools;
- ML and AI: Prebuilt models / ML algorithms for training custom models;
- Data and analytics: BI platforms / Data integration tools;

## AWS Partner Network (APN)

Is a global community that uses AWS technologies, programs, expertise, and tools to build solutions and services for customers.

You can work with AWS Partners to create or use specialized solutions.

Some benefits:
- Funding: If you join, you can participate in specific programs available to build, market, and sell;
- Events: Include webinars, virtual workshops, and in-person learning;
- Training and Certification: From certification to a specific service or learning objective;

## Cost Optimization

### Compute

Rightsize your resources.

AWS Compute Optimizer can help rightsize your compute resources.

Using Spot Instances can help optimize cost, it works well for workloads that are tolerant to interruptions.

### Auto Scaling

Helps with compute resources.

Application load balancing also helps distribute traffic across EC2 instances.

### Storage

Rightsizing is important for RDS too.

It can scale storage using storage autoscaling.

Read replicas scale horizontally.

Using something like [Elasticache](./module7.md#amazon-elasticache) can also reduce the load on your primary instance and optimize cost.

Using the right storage class is key to cost optimization.

Using S3 Glacier Deep Archive for data accessed once or twice a year.

Using VPC for S3 access can help reduce data transfer costs.