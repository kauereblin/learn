# MLOps

A set of practices to automate and simplify machine learning (ML) workflows and deployments.

The organization can deploy MLOps across the ML lifecycle, including model development, testing, integration, release, and infrastructure management.

#### ML Lifecycle

- Data Prep: Aggregation, duplicate cleaning, and feature engineering;
- Train & Tune: Validate the ML Model;
- Deploy & Monitor: Deploy and validate as a Prediction Service;
- Inference: 

Exploratory data analysis often requires you to experiment different models until the best model version is ready for deployment.

MLOps is critical to systematically and simultaneously manage the release of new ML Models with the code base and data changes.

## Principles

### Version Control

Track changes in the machine learning assets to reproduce results and rollback to previous versions if necessary.

Every ML training code or model specification goes through a code review.

Each phase should produce identical results given the same input.

### Automation

Automate various stages in the pipeline to ensure repeatability, consistency, and scalability.

It can be triggered by:

- Messaging;
- Monitoring or calendar events;
- Data changes;
- Model training code changes;
- Application code changes;

Automation is more efficient with **Infrastructure as Code (IaC)**.

### Continuous X

Four main activities if any change is made anywhere in the system:

- Continuous Integration: Extends the validation and testing to data and models;
- Continuous Delivery: Automatically deploys the newly trained model or prediction model service;
- Continuous Training: Automatically retrains ML models for deployment;
- Continuous Monitoring: Concerns data and models monitoring using metrics related to business;

### Model Governance

Governance involves managing all aspects of ML systems.

- Foster close collaboration between all teams;
- Create clear documentation and effective communication channels;
- Establish feedback mechanisms, about model predictions and retrain models;
- Ensure that sensitive data, access to models and infra, and compliance is requirements are met.

## Benefits

### Faster time to Market

### Improved productivity

### Efficient model deployment

## Implement MLOps



## MLOps x DevOps



### Link

https://aws.amazon.com/pt/what-is/mlops/
https://cloud.google.com/discover/what-is-mlops