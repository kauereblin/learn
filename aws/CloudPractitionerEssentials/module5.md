# Module 5 - Networking

Interconnected devices that can exchange data and resources.

## Amazon Virtual Private Cloud (VPC)

Provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network.

With VPC, you can provision an isolated section of the AWS Cloud, in this section, you can launch resources in a virtual network providing three main benefits:

- Increase security: monitor connections, screen traffic, and restrict instance access;

- Save time: Setting up, managing, and validating;

- Control environment: Resource placement, connectivity, and security.

**Internet Gateway** is a connection between a VPC and the internet.

#### Virtual Private Network (VPN)

Creates a connection that is more like a secure tunnel through the internet, using encryption.

Use case:

- Secure;
- Flexible;
- Remote access;
- Small-scale;
- Dedicated isn't necessary;

Failover for *[Direct Connect](#aws-direct-connect)*.

### Virtual Private Gateway

A Virtual Private Gateway is the component that makes it possible for you to connect this protected traffic to enter the VPC.

#### AWS Client VPN

Is a networking service you can use to connect your remote workers and on-premises network to the cloud.

Fully managed, elastic VPN service, on user demand.

Provides advanced authentication, remote access.

#### AWS Site-to-Site VPN

Creates a secure connection between your data center and your AWS Cloud resources.

Provides high availability, secure and private sessions, and accelerates applications.

#### AWS PrivateLink

Is a highly available, scalable tech that you can use to privately connect your VPC to services and resources as if they were in your VPC. You control the specific API endpoints, sites, services, and resources that are reachable from your VPC.

Helps you secure your traffic and connect with simplified management rules.

#### AWS Direct Connect

Is a service that makes it possible for you to establish a dedicated private connection between your network and VPC.

- Latency-sensitive applications: Direct Connect bypass the internet and provides consistent, low-latency experience. Ideal for applications that require high performance.

- Large-scale data migration or transfer: Ensure smooth and reliable data transfer at massive scale for real-time analysis, data backup, broadcast media processing.

- Hybrid cloud architectures: You can use to link your AWS and on-premises networks without compromising performance.

Use case:

- High bandwidth;
- Low latency;
- Consistent performance;
- Large data transfers;
- Critical applications;

#### AWS Transit Gateway

Is used to connect your Amazon VPCs and on-premises network through a central hub.

#### Network Address Translation (NAT) Gateway

The services instance in a private subnet can connect to services outside your VPC but not the other way.

#### Amazon API Gateway

Is a service for creating, publishing, maintaining, monitoring, and securing APIs.

## Subnet

A section of a VPC for grouping resources based on security or operational needs, and can be *public* or *private*.

- **Private subnet** usually contains database or transactional information;

- **Public subnet** is commonly used for resources like a customer-facing website.

In a VPC, you can define rules to allow resources in different subnets to communicate with each other.

### Network traffic

1. Client request (as packet) data from app;
2. Packet enters VPC through internet gateway;
3. Before a packet enter or exit from a subnet, it will run checks for permissions, one being a network **ACL (access control list)**

## Network ACLs (Access Control Lists)

A *Network ACL* is a virtual firewall that controls inbound and outbound traffic at the subnet level.

Works at the subnet level.

Each AWS account includes a default *Network ACL*.

By default, *Network ACLs* allows all traffic.

You can only create allow type rules.

#### Stateless packet filtering

*Network ACLs* perform stateless packet filtering. They remember nothing and check packets always.

## Security Groups

After a packet has entered a subnet, it must have its permissions evaluated for resources within the subnet.

Works at the instance level.

A *Security Group* is the VPC component that checks packet permissions. It's a virtual firewall that controls inbound and outbound traffic for specific AWS resources.

By default, *Security Group* denies all traffic.

You can create both allow and deny type rules.

#### Stateful packet filtering

Security groups perform stateful packet filtering, they remember previous decisions.

### Cloud Inter-Domain Routing (CIDR)

Allocate IP addresses with more efficiency. Allow the network administrator to create subnets with different sizes.

## Amazon Route53

Is a DNS service hosted on edge locations.

Routes user to infrastructure running in AWS and outside of AWS.

*Route53* can manage the DNS records for domain names.

Works with Amazon *CloudFront*.

## CloudFront

*CloudFront* is a CDN service that delivers your content with low latency and high speeds.

## AWS Global Accelerator

It uses the AWS global network to improve application availability, performance, and security. It uses intelligent traffic routing and fast failover.