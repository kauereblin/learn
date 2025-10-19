# Module 8 - AI ML and Data Analytics

**Artificial Intelligence (AI)** is a broad field focused on the development of intelligent computer systems capable of performing humanlike tasks.

**Machine Learning (ML)** is a type of AI for training machines to perform complex tasks without explicit instructions. ML model are trained with historical data to predict the best options.

> Natural Language Processing (NLP)

### Common Use Cases

- Predict trends: future stock price;
- Make decisions: routing callers to departments;
- Detect anomalies: bank fraud;

## AI Services

Pre-built models that are trained to perform specific functions.

This managed services tier have three different topics:

### Language Services

- **Amazon Comprehend**: Uses NLP to extract key insights from documents;
  - Cases: Content classification, customer sentiment analysis, and compliance monitoring.
- **Amazon Polly**: Converts text into lifelike speech;
  - Cases: Virtual assistants, e-learning apps, and accessibility enhancements.
- **Amazon Transcribe**: Converts speech into text;
  - Cases: Customer call transcription, automated subtitling, and metadata generation.
- **Amazon Translate**: Text translation service, supporting real-time;
  - Cases: Document translation and multi-language apps.

### Computer Vision and Search Service

- **Amazon Kendra**: Uses NLP to search for answers within large amounts of enterprise content;
  - Cases: Intelligent search, chatbots, and app search integration.
- **Amazon Rekognition**: Video analysis service;
  - Cases: Content moderation, identity verification, media analysis, and home automation.
- **Amazon Textract**: Extracts typed and handwritten text; (OCR)
  - Cases: Financial, healthcare, and government form text.

### Conversational AI and Personalization services

- **Amazon Lex**: Uses Natural Language Understanding (NLU) and Automatic Speech Recognition (ASR) to create conversations;
  - Cases: Virtual assistants, natural language search.
- **Amazon Personalize**: Use historical data to build personalized recommendations;
  - Cases: Personalized streaming, product, and trending recommendations.

## ML Services

A fully managed service that are more customized approach with **Amazon SageMaker** where you build, train, deploy your own ML models.

### Amazon SageMaker AI

It has a proprietary IDE to control your ML projects.

You can track model training experiments, visualize data, and debug your workflows.

Also, it offers access to hundreds of pre-trained models.

Some benefits:
- Choice of ML tools: Data scientists can use the IDE and business analysts can use the no-code interface;
- Fully managed infrastructure;
- Repeatable ML workflows: Automate and standardize your [MLOps](../../AI/MLOps/README.md).

## ML Frameworks and Infrastructures

A completely custom approach to building models.

### ML Frameworks

Is a software library or tool that provides experienced ML practitioners with pre-built, optimized components for building ML models. AWS supports PyTorch, Apache M-X Net, and TensorFlow.

### AWS ML Infrastructure

Such as ML-optimized Amazon Elastic Compute Cloud (EC2), EMR, ECS, can support custom solutions.

## Generative AI

**Deep Learning (DL)** is a subset of ML where models are trained using layers of artificial neurons that mimic the human brain.

**Generative AI** is a type of DL powered by extremely large ML models known as **Foundation Models (FM)**. FMs are pre-trained on large datasets, that enable them to perform multiple tasks.

**Large Language Models (LLM)** are a popular type of FM trained to use human language.

On AWS, there are three popular services:

### Amazon SageMaker Jumpstart

An ML hub with FMs and pre-built ML solutions.

Offers a library across various domains such as computer vision, NLP, and tabular data.

Cases:
- Rapid ML model deployment;
- Custom fine-tuned solutions;
- ML experiments and prototypes;

### Amazon Bedrock

A fully managed service for adapting and deploying FMs.

It provides access to FMs from Amazon and AI startups (Claude and Stable Diffusion), unified in one API. You can experiment with FMs, fine-tune them, and integrate into your AWS applications.

Cases:
- Enterprise-grade generative AI;
- **Multimodal** content generation;
- Advanced conversational AI;

### Amazon Q

An AI assistant that can be integrated with a company's information repositories.

- Amazon Q Business: Provides a tailored assistance to commonly used systems;
  - Cases: Information requests, automated workflows, and insight from data.
- Amazon Q Developer: Provides code recommendations (C#, Java, JavaScript, Python, and TypeScript), integrates with many IDEs;
  - Cases: Code generation, reliability and security, and automated code reviews.

## Data Analytics

> Extract / Transform / Load - ETL

AI/ML and Analytics needs data normalization, followed by the key concepts:

### Data pipelines for ETL processes

ETL processes are used for the analysis, separate in these steps:

1. *Extract* data from various sources and store it;
2. *Transform* it into a consistent for downstream tools to consume;
3. *Load* it into a destination system (data warehouse or analytics platform);

Data pipelines are automated assembly lines used to make ETL process *efficient* and *repeatable*

### Data Analytics

When analysts transform raw historical data to uncover valuable insights and trends.

Cases:
- Loan companies explaining lending decisions to customers;
- Medical researchers analyzing data through hypothesis testing;

## Data Pipeline

### Data ingestion services

- Amazon Kinesis Data Streams: *Real-time* ingestion of terabytes of data;
- Amazon Data Firehose: Fully managed service near real-time;

### Data storage services

- [Amazon S3](./module6.md#amazon-simple-storage-service-s3)
- Amazon Redshift: Fully managed data warehouse service that can store petabytes of structured or semistructured data;

### Data cataloging services

- AWS Glue Data Catalog: Provides a metadata repository enhancing data discovery, delivering metadata to various data stores and analytics services;

### Data processing services

- AWS Glue: Fully managed ETL service, that its jobs can use the AWS Glue Data Catalog to access metadata;
- [Amazon EMR](../Services/README.md#emr-elastic-mapreduce): Ideal for large scale processing and organizations with existing big data expertise;

### Data analysis and visualization services

- Amazon Athena: Fully managed serverless service that you can run SQL queries to analyze data in relational, nonrelational, object, and custom data sources. You can access on S3, on-premises, or multi-cloud envs.
- Amazon Redshift: Its columnar storage and massively parallel processing architecture;
- Amazon QuickSight: Technical and Non-technical user can create dashboards and reports;
- Amazon OpenSearch Service: Search for content within keyword matching or natural language;

