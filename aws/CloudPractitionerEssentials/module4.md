# Module 4 - Going Global

- Choose Regions: Consider factors to deploy.

- **Edge locations**: Cache items, and other resources, minimizing latency.

- **CloudFormation**: Help to automate the deployment of cloud resources. Uses Infrastructure as Code (*IaC*).

## Choose Region

- Compliance;

- Proximity;

- Feature availability;

- Pricing;

## Available Architectures

Deploying multi-Region and muilt-AZ resources;

Improve application reliability by building redundant architecture or replicating your resources across multiple levels of AWS infrastructure.

#### High Availability

Refers to the capability of a system to operate continuously without failing.

#### Agility

The ability to quickly adapt to changing requirements or market conditions. Modify and deploy services rapidly.

#### Elasticity

The ability of a system to scale resources up or down automatically in response to changes in demand.

### Edge Locations

In addition to **AWS Regions** *that contain* **Availability Zones**, AWS has a global edge network that provides quicker content access to users outside standard Regions. Edge Locations offer multiple services like *Amazon CloudFront*.

**CloudFront** is a *Content Delivery Network (CDN)*.

## CloudFormation

Is a service that helps to model and set up AWS resources in different regions.

CloudFormation allow defines infrastructure as code. You create a template that describes all the AWS resources, and it will be provisioned and configured automatically.

## Interact with AWS resources

#### Programmatic access

- AWS CLI: Manage multiple AWS services directly from command line. Automate tasks through scripts;

- AWS SDK: Provide APIs to help integrate AWS services to the application.

#### AWS Management Console

Web interface to manage AWS services. Option for beginners to AWS environment and coding. Billing and cost optimization dashboards.

#### Infrastructure as Code

Automate resource management across your organization with AWS service integrations.