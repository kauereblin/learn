# Domain-Driven Design (DDD)

OOP Philosophy.

Principles:

- Eric Evans;
- Domain;
- Models exploration;
- Ubiquitous language based on the bounded context;
- Used in complex systems;
- Easy to understand;
- Hard to implement;
- Implement many patterns;

## Pillars

- **Ubiquitous Language**;
- **Bounded Context**;
- **Context Mapping**;

### Domain

The domain is the problem space that the software is trying to solve. It includes all the rules, processes, and entities that are relevant to the business or application.

### Ubiquitous Language

Ubiquitous language is a common language used by both developers and non-developers to describe the domain. It ensures that everyone involved in the project has a shared understanding of the concepts and terms used, reducing ambiguity and miscommunication.

### Bounded Context

A bounded context is a boundary within which a particular model is defined and applicable. It helps in managing complexity by separating different parts of the system, allowing teams to work on different contexts without interference.

Each context can have its own models, rules, and *ubiquitous language*, which can be integrated with other contexts as needed.

### Models Exploration

Models exploration involves understanding the domain by creating models that represent the entities, relationships, and behaviors within that domain. This helps in visualizing and refining the domain concepts.

#### Strategic modeling

Strategic modeling focuses on the high-level structure of the system, identifying key entities, relationships, and interactions. It helps in defining the overall architecture and boundaries of the system.

- Main;
- Generic;
- Assistant;

### Context Mapping

Context mapping is the process of defining how different bounded contexts interact with each other. It involves identifying relationships, dependencies, and integration points between contexts.

#### Patterns

- **Shared Kernel**: A shared kernel is a common model that is used by multiple bounded contexts. It allows for shared understanding and collaboration between teams.

- **Customer/Supplier**: In this relationship, one context (the supplier) provides services or data to another context (the customer). The customer relies on the supplier for specific functionality.

- **Conformist**: A conformist context adopts the model and rules of another context without making changes. It conforms to the supplier's model and does not introduce its own variations.

- **Anticorruption Layer**: An anticorruption layer is a boundary that protects one context from the influence of another. It translates and adapts the model of the supplier context to fit the needs of the customer context, preventing direct dependencies.

- **Open Host Service**: An open host service provides a well-defined interface for other contexts to interact with. It allows for integration without exposing internal details, promoting loose coupling.

- **Published Language**: A published language is a shared language or model that is used by multiple contexts. It provides a common understanding and allows for communication between contexts without direct dependencies.

- **Separate Ways**: In this relationship, two contexts operate independently without any direct interaction. They may share some common concepts but do not rely on each other for functionality.

- **Partnership**: A partnership is a close collaboration between two contexts, where they work together to achieve a common goal. They share models and collaborate on development, ensuring alignment and mutual understanding.

- **Open Host Service**: An open host service provides a well-defined interface for other contexts to interact with. It allows for integration without exposing internal details, promoting loose coupling.

- **Published Language**: A published language is a shared language or model that is used by multiple contexts. It provides a common understanding and allows for communication between contexts without direct dependencies.

## Domain Model Patterns

- Entities & Aggregates;
- Value objects;
- Repositories;
- Services;
- Factories;

### Entities & Aggregates

Entity is not from Databases, they are the objects that make the system works.

Aggregate merge entities of same context. Every aggregator has a root entity. The entities have all the properties and logic methods to guarantee the manipulated data. 

### Value Objects

Immutable attribute collection. Using the constructor to instantiate the object and can't modify its attributes. Use of different types to shape it, not only primitive types.

### Repositories

Access the data layer, using the entities as contracts with the respective methods. Only one repository per aggregate. Can consult external services.

### Services

Implements the business logic based in the domain expert.
Operate with different workflows, entities and aggregations.
Uses repositories to access data from database.
Consumes resources from infrastructure layers.

# Links

https://fullcycle.com.br/domain-driven-design/
Domain-Driven Design - Tackling Complexity in the Heart of Software - by Eric Evans
