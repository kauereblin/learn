# Module 10 - Monitoring

Is the process of collecting, visualizing, and tracking the health and performance of AWS infrastructure, services, and applications.

> Observing systems, collecting metrics, and then using data to make decisions.

### Secure

Protect data, systems, and infrastructure.

### Monitor

Continuously observe and analyze system activity, network traffic and security events.

Some benefits:
- Keep security;
- Respond proactively;
- Ensure reliability;
- Monitor costs;
- Improve performance;

#### Amazon CloudWatch

It monitors AWS resources and the applications that run on AWS in real time.

Some features:
- CloudWatch metrics: collect all metrics from resources, apps, and services from AWS and on-premise;
- CloudWatch alarms: define thresholds on metrics and send notifications or auto change the resources;
- CloudWatch dashboards: customizable home page in CloudWatch console;
- CloudWatch logs: centralize all logs from resources, apps, and services;

It can be used to monitor and troubleshoot infrastructure.

#### AWS CloudTrail

It provides auditing, **logging every request**, in the AWS Cloud, on premises, and with other cloud providers.

It logs *changes*, *who*, *when*.

Some features:
- Events: Capture actions (API calls, console actions, others) with 90 days expiration;
- Logs: Delivers events as log files to S3;
- Insights: Analyzes your normal patterns of API call volume and API error rates;

### Audit

Periodically reviews and assess the effectiveness of security controls and check requirements.

### Compliance

Help ensurer security practices and controls meet the requirements of regulations, industry standards, and contractual obligation.

Common laws: **General Data Protection Regulation (GDPR)** or **Health Insurance Portability and Accountability Act (HIPAA)**

AWS helps with:

- Inheriting the latest security controls that AWS uses on its own infrastructure;
- Third-party validation for thousands of global requirements;
- Streamlining and automating compliance;
- On-demand compliance reports;

#### AWS Artifact

It provides no-cost, on-demand access to AWS security and compliance reports and select online agreements.

Used to manage select online agreements and assess third-party security and compliance.

- Agreements: You can review, accept, and manage agreements for an individual account and all accounts in **AWS Organizations**;
- Reports: Provide compliance reports from **third-party auditors**, that have tested and verified that AWS is compliant with a variety of *global*, *regional*, and *industry-specific* security standards and regulations.

## AWS Config

Is a service that you can use to assess, audit, and evaluate the configurations of AWS resources.

## AWS Audit Manager

Is a service that continually audits your AWS usage to simplify risk and compliance assessment. It helps collect evidence and manage audit data.

## AWS Organizations

A central location to manage multiple AWS accounts hierarchically tree-like structure with a root at the top and **Organizational Units (OU)** nested.

It provides management on groups of accounts and automate account creation.

Simplify permission management with **Service Control Policies (SCP)** used on OUs or individual member accounts.

Member accounts with unique requirements can be out of OUs.

## Governance

> A framework to manage your IT goals with policies, processes, and structures to ensure adherence.

### AWS Control Tower

You can use to enforce and manage governance rules for security, operations, and compliance across all your **Organizations** and accounts.

- Dashboard: Continuos oversight, has control for policy enforcement, and help to detect noncompliant resources;
- Account Factory: Standardizes the provisioning of new accounts;
- Controls (Guardrails): High-level rules that provide governance;
- Landing zone: Holds all the OUs, accounts, users, and resources you want to regulate for compliance;

### AWS Service Catalog

Platform to request permissions.

You can create, share, and organize from a catalog of AWS resources.

You can deploy baseline networking resources and security tools for new accounts.

#### AWS Bring Your Own License (BYOL)

With BYOL you can use existing software licenses purchased directly from vendors.

### AWS License Manager

It helps you manage your software licenses and fine-tune your licensing costs.

## AWS Health

Is the go-to data source for events and changes affecting the health of your resources.

It notifies about service events, planned changes, and account notifications.

You can use the dashboard or API to retrieve account-specific health data and AWS event updates.

## AWS Trusted Advisor

With it, you can continuously evaluate your AWS environment by using checks across several categories (costs, performance, security, and resilience).

### IAM Access Analyzer

It provides capabilities to set, verify, and refine permissions by analyzing external access and validating your policies compliance.