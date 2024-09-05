# The Twelve-Factor App

A methodology for building software-as-a-service apps that:

- Use **declarative** formats for setup automation, to minimize time and cost for new developers joining the project;

- Have a **clean contract** with the underlying OS, offering **maximum portability** between execution environments;

- Are suitable for **deployment** on cloud plataforms, obviating the need for servers and systems administration;

- **Minimize divergence** between development and production, enabling **continuous deployment** for maximum agility;

- And can **scale up** without significant changes to tooling, architecture, or development practices.

---

## I. Codebase

A 12FA is tracked in a version control system, with one codebase per app.

Distrubuted systems are composed of many apps, each with its own codebase, which are sometimes deployed together.

Sharing the same code in multiple codebases is a violation of the 12FA. Instead, extract the shared code into libraries, and include through *dependencies*.

An app have one codebase, but might have many deploys (developer environments, staging, production, etc).

---

## II. Dependencies

Libraries can be installed in two ways:

- **System-wide (Site packages)**: Libraries that are installed on the system, and are available to any app.

- **Scoped (Vendoring / Building)**: Libraries that are vendored into the app, and are available to that app only.

A 12FA never relies on implicit existence of system-wide packages. It declares all dependencies via a *dependency declaration manifest*. And uses a *dependency isolation* for implicit dependencies leak in from system.

> Simplifies setup for developers new to the app.

---

## III. Config

The config of an app is everything that vary between deploys:

- Resources handles to the database, Memcached and others [backing services](#iv-backing-services);

- Credentials to external services;

- Per-deploy values (scripts, tasks, config, permissions, etc);

Save credentials as constants in the code is a violation of 12FA. Config varies across deploys, code does not.

> There is a tendency for config files to be scattered about in different places and different formats, making it hard to see and manage all the config in one place. Further, these formats tend to be language or framework-specific.

The 12FA stores config in **environment variables**.

Another aspect of config management is grouping. As the app grows, more batch configs are needed to run the deploy. In 12FA, the env var are granular controls, and agnostic of each other, never grouped.

## IV. Backing services

It's any service the app consume over network. (datasore, messaging/queueing systems, SMTP services, caching systems).

In addition of locally-managed services, the app also gave services provided and managed by third parties. The 12FA make **no distinction between local or third party services**. The app should be able to swap out a local SQL database to an online managed without any changes in code, only the config needs change.

Each backing service is a resource. Resources can be attached to and detached from deploys.

## V. Build, Release, Run

Transform the codebase into a deploy through three stages:

- *Build*: Converts a code repo into an executable bundle, known as build. In this stage, vendors dependencies are fetched and compiles binaries and assets.

- *Release*: Combines the build with the deploy's current config.

- *Run* (runtime): Runs the app in the execution env, by launching some set of the app's [processes](#vi-processes)

Deployment tools typically offer release management tools, most notably the ability to roll back to a previous release.

Any change must create a new release, every release must have an unique ID, such as a timestamp.

## VI. Processes

Execute the app as one or more stateless processes.

12FA processes are stateless and share-nothing. Any data that needs to persist must be stored in a stateful [backing service](#iv-backing-services).

The 12FA **never** assumes that anything cached in memory or on disk will be available in the future.

Some web systems rely on "sticky-sessions", which caches user session data in memory and in future requests, it's use the same previous process. That violates the 12FA and should never be used.

## VII. Port Binding

The 12FA is completely self-contained and does not rely on runtime injection of a webserver into the execution env to create a web-facing server.

> The web app exports HTTP as a service by binding to a port, and listening on that port.

HTTP is not the only service that can be exported by port binding.

## VIII. Concurrency

Processes in the twelve-factor app take strong cues from the **unix process model for running service daemons**. With this model, the developer can architect their app to handle diverse workloads.

> The process model truly shines when it comes time to scale out. The share-nothing, horizontally partitionable nature of twelve-factor app processes means that adding more concurrency is a simple and reliable operation.

12FA processes should never write PID files. Instead, rely on the OS process manager to manage output streams, respond to chashed processes and handle user-initiated restarts and shutdowns.

## IX. Disposability

The 12FA processes are disposable. They can be started or stopped at a moment’s notice.

> Processes should strive to minimize startup time.

For a worker process, shutdown is achieved by returning the current job to the work queue. Lock-based systems needs to be sure to release their lock on the job record.

In this model, all jobs are **reentrant** or make the operation **idempotent**.

Processes should be robust against sudden death. Recommended to use a queueing backend, that return jobs to the queue.

## Dev/prod parity

Development and production areas can manifest gaps, such as:

- Time: Developer may work on code that takes time to go into production;

- Personnel: Developer write code, ops engineers deploy it;

- Tools: Developer may use different tools than those in the production env.

The 12FA is designed to shorten the gap between this areas:

- Time: When finished its work, the code may be deployed hours or minutes later;

- Personnel: The developer are closely involved in deploying and watching code's behavior in production

- Tools: Keep development and production as similar as possible.

> [Backing services](#iv-backing-services) is the area where the parity is important.

Developers sometimes find great appeal in using lightweight backing service in their local env, different from robust and complex in production. The 12FA resists this urge of divergent tools between dev and prod.

Some errors are created from this disparity, causing inconvenient delay in continous delivery.

Adapters to different backing services are still useful. But all deploys of the app should be using the same type and version of each.

## Logs

Logs provide visibility into the behavior of a running app.

Logs are the stream of time-ordered events collected of all running processes and backing services. Logs are typically a text format with on event per line.

12FA never concerns with routing or storage its output stream. Instead, each process writes its event stream.

In development, these logs can be seen in terminal. In production each process stram will be captured by the execution env, and routed to one or more final destinations. These archival destinations are managed by the execution env.

The logs can be used to:

- Rewind events in the past;

- Graphing trends;

- Active alerting according to user-defined heuristic (ex: quantity of errors per minute).

## Admin processes

Many time the developer need to run one-off administrative or maintenance tasks for the app, such as:

- Running database migrations;

- Running a console (**REPL** shell) to run arbitrary code or inspect the database models.

One-off admin processes should be run in an identical environment as the regular long-running processes of the app, run in release, using the same codebase and config.

12FA favors languages which provide a REPL shell, and which make it easy to run one-off scripts.