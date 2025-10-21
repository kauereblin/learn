# Module 9 - Security

### Authentication

Verify the identity of a user or entity through credentials.

### Authorization

Granting authenticated users with certain access rights and permissions.

## AWS Identity and Access Management (IAM)

By default, all actions are denied.

Grant permissions to access only need-to-have. This concept is called the principle of least privilege.

> The principle of least privilege dictates that you should only give people and systems access to what they need and nothing else.

IAM provides users, groups, and roles segregation to use IAM policies.

### Root user

All AWS accounts are given an AWS account root user.

Is the account owner and can do anything inside the AWS account.

Uses **Multifactor Authentication (MFA)** to access it is ideal.

It's not ideal to handle daily tasks, create IAM users to it.

### IAM users

It represents a person or application that interacts with AWS services and resources.

### IAM groups

Is a collection of IAM users.

The permissions assigned to a group is inherited to its users.

### IAM roles

Is an identity you can assume to gain temporary access to permissions.

### IAM policies

Is a JSON document that allows or denies permission (levels) to access AWS services and resources.

## AWS IAM Identity Center

Centralizes identity and access management across AWS accounts and applications.

Can also connect to an existing identity source and provide a single sign-on access to all your connected AWS services and accounts. This is called **Federated Identity Management**.

> **Federated Identity Management** is a system that allows users to access multiple applications, services, or domains using a single set of credentials.

## AWS Secrets Manager

It provides a secure way to manage database credentials, API keys, and other secrets throughout their lifecycle.

## AWS Systems Manager

It provides a centralized view of nodes across your organization's accounts and Regions and multi-cloud and hybrid environments.

## Network Security

### Denial of Service (DoS) attack

An attacker floods a web app with excessive network traffic. All requests are denied if the app becomes overloaded and can no longer respond.

### Distributed Denial of Service (DDoS) attack

An attacker uses multiple computers to send excessive traffic to a web app.

### AWS Protection

- Security groups: Only allow in proper request traffic, operating at the AWS network level using the AWS Region's capacity;
- [ELB](./module2.md#elastic-load-balancing-elb): Handles traffic first before handing it off, runs at the Region level;
- AWS Regions: It's expensive to achieve the capacity of Regions;

### AWS Shield

- AWS Shield Standard is designed to protect AWS customers from frequently occurring types of DDoS at no cost.

- AWS Shield Advanced is a paid service that provides detailed attack diagnostics and the ability to detect and mitigate sophisticated DDoS.

### AWS WAF

Is a Web Application Firewall that monitors network requests. It checks the IP address against a web [ACL](./module5.md#network-acls-access-control-lists)

## Data encryption

It works like a lock and key mechanism. If you have the right key, you can access the encrypted data.

#### Types

- At Rest: Like when it's stored;
- In Transit: Data is moving between locations;

### AWS built-in data protection

- Amazon S3: all new S3 buckets have encryption;
- Amazon EBS: EBS volumes and snapshots can be encrypted at rest;
- Amazon DynamoDB: Server-side encryption at rest using keys stored in AWS Key Management Service (AWS KMS);

### AWS Key Management Service (KMS)

Used to create and manage cryptographic keys.

You can control the use of keys across services and your applications.

### Amazon Macie

You can monitor your sensitive data at rest to make sure it's safe.

Macie uses ML and automation to discover sensitive data stored in S3.

### AWS Certificate Manager (ACM)

It centralizes the management of your SSL/TLS certificates.

## Detection and Response

### Amazon Inspector

It runs automated security assessments for EC2, containers, and Lambda.

It has a console to complete view of assessments.

It also has an API.

### Amazon GuardDuty

Provides intelligent threat detection across your infrastructure and resources using continuously monitoring streams of your account metadata and network activity.

The output is on AWS Management Console. And can apply fix recommendations with Lambda functions.

### Amazon Detective

After a threat has been detected, you can use Amazon Detective to find the root cause.

You can see the result in AWS Management Console too.

### AWS Security Hub

It brings multiple security services together.

Automatically aggregates security finding from AWS and partner services.

It can accelerate **time to resolution (TTR)**.

## AWS Marketplace Security Resources

- Threat detection and prevention tools: Identify and block malicious activities;
- Identity and access management tools: Control user permissions and authentication;
- Data protection tools: Encrypt and safeguard sensitive information;
- Compliance and governance tools: Meet security regulatory requirements;

