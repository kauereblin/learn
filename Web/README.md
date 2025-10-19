# curl



# Load Balancer

Balance the load of requests between services

#### Pros:
- Scalability
- Performance
- Availability

#### Main features
- Health services check
- TLS Termination (encrypt/decrypt data transfer)
- DDOs security
- Service discovery
- Analytics

It can be applied between services with multiple instances (user/web server, web server/app server, app server/database)

# Rate Limiter

- Prevent overload;
- Protect against DDoS attacks;
- Fair usage;
- Cost management;

## Requirements

- Specify Rate Limits: Establish boundaries to ensure fair usage, prevents abuse, and protect system resources from being overwhelmed;
- Configurability and Flexibility: Adapt to changing requirements and handle diverse traffic patterns (Per endpoint | Per User/IP);
- Low latency and High performance: Process requests quickly;

## Implementations

#### Client Side

Pros✅|Cons❗
-|-
Immediate feedback|Easily bypassed
Reduced server load|Inconsistent enforcement

#### Server Side

Pros✅|Cons❗
-|-
Centralized control|Increased server load
Enhanced security|Scalability challenges

#### Middleware

Pros✅|Cons❗
-|-
Scalable management|Additional complexity
Flexible policies|Potential bottlenecks

## Algorithms

### Token Bucket

- Allow bursts of traffic while maintaining a steady average rate;
- Tokens are added to the bucket at a fixed rate;
- Each request consumes a token;
- If the bucket is empty, requests are denied or delayed until tokens are available;

### Leaky Bucket

- Smooth out bursts of traffic by processing requests at a constant rate;
- Requests are added to a queue;
- The bucket leaks at a fixed rate, processing requests one at a time;
- If the bucket is full, incoming requests are discarded or delayed;

### Fixed Window

- Count requests in fixed time intervals;
- If the count exceeds the limit, further requests are denied until the next window;
- Simple to implement but can lead to bursts of traffic at the start of each window;

### Sliding Window

- More granular control over request rates by maintaining a rolling count of requests over a specified time period;
- Each request is timestamped, and the count is updated by removing timestamps that fall outside the sliding window;
- Provides a smoother rate limiting experience compared to fixed window;
- More complex to implement and may require additional storage for timestamps;

> All denied requests can be added to a retry queue.

# CORS (Cross-Origin Resource Sharing)

### Origin

Defined by three things:
- Protocol: `https://`
- Domain: `api.example.com`
- Port: `:3000`

### Same-Origin Policy (SOP)

> A web page can only make requests to the same origin it was loaded from.

CORS is a system that allows a server to be reached by another.

It works through HTTP headers that the server sends in its response.

```
Access-Control-Allow-Origin: https://app.com
```

For development, all origin can access, unsafe for production:
```
Access-Control-Allow-Origin: *
```

#### How it works:

- Simple Request: `GET` / `POST` with `application/x-www-form-urlencoded`, the browser sends it directly. Checks the response for *ACAO*, if it's missing the browser blocks the response;
- **Preflight** Request: request with params (headers, body) or `PUT` / `DELETE` methods, the browser sends an OPTIONS request first (**preflight**) checking the permission to complete the request. The server must respond with headers like:
  - `Access-Control-Allow-Origin: https://app.com`
  - `Access-Control-Allow-Methods: GET, POST, PUT, DELETE`
  - `Access-Control-Allow-Headers: Content-Type, Authorization`

#### Common CORS Headers

| Header                             | Purpose                                     |
| ---------------------------------- | ------------------------------------------- |
| `Access-Control-Allow-Origin`      | Which origins can access the resource       |
| `Access-Control-Allow-Methods`     | Which HTTP methods are allowed              |
| `Access-Control-Allow-Headers`     | Which custom headers can be used            |
| `Access-Control-Allow-Credentials` | Whether cookies or auth headers are allowed |
| `Access-Control-Max-Age`           | How long the preflight result can be cached |

## CSRF (Cross-Site Request Forgery)

Is an attack where a malicious site tricks a logged-in user's browser into sending unauthorized requests to another site because the browser automatically includes cookies.

- Cause: Browser send authentication cookies automatically on cross-site requests.
- **Goal: Make the victim's browser perform actions as if they were the legitimate user**

#### Protections:

- *CSRF Token*: unique, secret value that must be sent with each sensitive request;
- *SameSite Cookie*: tells the browser not to send cookies on cross-site requests;
- *Double Submit Cookie*: compares a token in both cookie and request.

> CSRF prevents unwanted actions.

## XSS (Cross-Site Scripting)

Web security vulnerability that allows attackers to inject malicious scripts into web pages by other users.

The injected code can:
- Steal cookies, session tokens;
- Impersonate users;
- Deface websites;
- Redirect users to malicious sites;
- Perform actions on behalf of the victim.

#### How it works

If the input isn't sanitized the attacker can include HTML/JavaScript code. Then when another user views the page, that malicious code executes in their browser.

#### Types

| Type              | Where Code Lives | Triggered When                 |
| ----------------- | ---------------- | ------------------------------ |
| **Stored XSS**    | Server/database  | Page loads data from storage   |
| **Reflected XSS** | URL/request      | User visits crafted link       |
| **DOM-Based XSS** | Client/browser   | Client-side JS manipulates DOM |

### How to Prevent XSS

| Layer                  | Defense                                                                                        |
| ---------------------- | ---------------------------------------------------------------------------------------------- |
| **Input Handling**     | Validate and sanitize user inputs. Use libraries like DOMPurify for HTML.                      |
| **Output Encoding**    | Escape dynamic data before rendering in HTML, JavaScript, or URLs.                             |
| **HTTP Headers**       | Use security headers: `Content-Security-Policy (CSP)`, `X-XSS-Protection`, `HttpOnly` cookies. |
| **Framework Defenses** | Use frameworks that automatically escape data (React, Angular, Django, ASP.NET Razor).         |
| **Avoid `eval()`**     | Never use functions like `eval()`, `innerHTML`, or `document.write()` with untrusted input.    |

# API Gateway

Creates the API routes with authentication, authorization, monitoring, traffic management.

Don't invoke the server, creates the routes for the microservices;

Centralizes the business rules.

# Reverse Proxy

Acts as gate for many servers, client only see as one;

- Load Balancer (cloud provider manage all the topics bellow);
- TLS Termination;
- Cache;
- Security;

# DNS (Domain Name System)

Translate domain to IP address

- Browser request to **Internet Service Provider (ISP)** by **DNS query**;
- *ISP* request to DNS infrastructure, that response with a list of IPs;
- *ISP* receive the list, send to browser and redirect the browser to the content with HTTP 

**Name servers**: Infrastructure for the DNS, store the domains and IPs;
**Resource Records**: Table that maps the domains;
**Caching**: Provide performance for searching;
**Hierarchy**: Performance for searching, tree-based search;

#### DNS Resolver

- Root-level: manage the subdomains;
- **Top-level domain (TLD)**: .com, .br, .io, .org;
- Authoritative: google.com;

#### Search Types

- Iterative: The client (*ISP*) manage all the DNS queries;
- Recursive: Most used, more overload, request root many times;

# Latency

Delay in first response.

# Throughput

Operations per time unit.

# CDN (Content Delivery Network)

Static assets regional providers.

Save static data from live servers to give more performance in requests.

#### Feeding

- **Push**: Service knows which data is most used data, bringing it to the CDN server;
- **Pull**: The server is fed by user experience.

# Search Engine Optimization (SEO)


# Common API styles

[gRPC](../protocols/README.md#generic-remote-procedure-calls-grpc)

## Representational State Transfer (REST)

It's an architectural style for designing networked applications.

It uses [HTTP](#http-request-parameters) as communication protocol.

Based on *resources* identified by [URLs](#uniform-resource-locators-url).

Each *resource* is represented by a [URI](#uniform-resource-identifier-uri).

Uses **Hypermedia as the Engine of Application State (HATEOAS)** that the RESTful API can provide links to guide clients dynamically.

#### Concepts

- Client-Server structured;
- Each request is [stateless](../Principles/README.md#stateless).
- Cachable;
- Uniform Interface, contract don't change;
- Layered System ([Load Balancer](#load-balancer), proxies, [Gateways](#api-gateway));

#### Authentication and Security

- API keys;
- JWT (JSON Web Token);
- [OAuth 2.0](../oauth/README.md);
- [TLS](../protocols/README.md#presentation-layer) encryption

## GraphQL

Is a query language and runtime for APIs.

It provides a more flexible and efficient alternative to REST. The client ask for exactly the data they need.

Usually there's a single endpoint.

Resolve over-fetching or under-fetching. Solve **N+1 selects problem**.

GraphQL server acts as a *gateway*, orchestrating multiple data sources into one unified response.

### Components

- Schema: Is the contract, defines the *types*, *fields*, and *relationships* available in the API;
- Queries: Read operation;
- Mutations: Write operation;
- Subscriptions: Real-time operations via [WebSockets](../protocols/README.md#websockets);
- Resolvers: Are functions that tell how to fetch the data for each field;
  - Make data-source agnostic: pulling from databases, other APIs, files, services, or memory;
- Single endpoint;

# HTTP Request Parameters

## Query Params

Sent in URL after `?`, separated by `&`.

```txt
GET /users?limit=10&page=2&sort=name
```

#### Use cases

- Filtering, pagination, sorting, and search params;
- *Optional* parameters that don't change the resource identity;

#### Characteristics

- Visible in browser URL and server logs;
- URL-encoded;
- Usually used with `GET`, but valid with any method;
- Cached by browsers and proxies;

#### Trade-offs

Pros✅|Cons❌
-|-
Easy to debug | Limit size (2Kb max)
Good for idempotent | Data security
Supported by caching layer (*CDN*, *proxy*) | Poor readability with many params

---

## Path Params (/:param)

Embedded with the URL path.

```txt
GET /users/42/orders/5
```

#### Use cases

- RESTful resource addressing;

#### Characteristics

- Visible in URL;
- Defines resource identity;
- Usually `GET`, `PUT`, `DELETE`
- Cacheable

#### Trade-offs

Pros✅|Cons❌
-|-
Semantic URLs | Fixed structure (not ideal for optional params)
Ideal for REST | Harder for versioning
Easy to route in frameworks | 

---

## Body Params

Payload of the HTTP request. (JSON, XML, form data...)

```txt
POST /users
Content-Type: application/json
```
```json
{
  "name": "John",
  "surname": "Doe"
}
```

#### Use cases

- Sending large, structure, sensitive data;
- Create / Update resources;
- Authentication payloads;

#### Characteristics

- Hidden from URL/logs (except request dump tools);
- Encoding defined by Content-Type header;
- Mostly `POST`, `PUT`, `PATCH`;
- Not cachable;
- Still need HTTPS for security;

#### Trade-offs

Pros✅|Cons❌
-|-
Handle complex payloads | Harder to debug
Not exposed in URL | Not auto cached
Sensitive or large data | Less *SEO*-friendly

---

## Header Params

Metadata included in request header section;

```txt
Authorization: Bearer <token>
Content-Type: application/json
Accept-Language: en-US
```

#### Use cases

- Authentication (Authorization, Cookies);
- Content negotiation (Accept, Content-Type);
- Custom metadata (X-Request-ID);

#### Characteristics

- Not visible in URL, logged or not by configuration;
- Transport-level metadata, not resource data;
- All HTTP methods
- May affect caching behavior;
- Ideal for tokens, keys, or language preferences;

#### Trade-offs

Pros✅|Cons❌
-|-
Widely supported across web stack | Not intuitive for debugging
Prevent leaking sensitive data via URL | Must be explicitly in backend
Custom headers | Custom headers (X-*) requires naming convetions

---

## Cookie Params

Sent automatically by browsers if the domain and path matchs.

```txt
Cookie: sessionId=abc123; theme=dark
```

#### Use cases

- User sessions;
- Preferences persistence (language, theme, etc);
- CSRF tokens;

#### Characteristics

- Hidden in browser dev tools (unless inspected);
- Survives across requests until expiry;
- Requires flags like `HttpOnly`, `Secure`, `SameSite` for security;
- All HTTP methods;
- Generally not cached;

#### Trade-offs

Pros✅|Cons❌
-|-
Auto managed by browsers | Not ideal for stateless APIs
Good for session continuity | Secure vulnerability (*XSS*, *CSRF*)
| | Harder to scale

---

## Form data

Legacy way to send key-value pairs or files (used by HTML forms).
`application/x-www-form-urlencoded` or `multipart/form-data`

```txt
POST /upload
Content-Type: multipart/form-data; boundary=...

------boundary
Content-Disposition: form-data; name="file"; filename="photo.png"
Content-Type: image/png
...
```

#### Use cases

- File uploads;
- Classic HTML forms;
- Hybrid text + binary data;

#### Trade-offs

Pros✅|Cons❗
-|-
Broad browser support | Harder to parse server-side
Handle mixed data | Legacy

---

## Matrix Params

Used for more expensive URIs

```txt
GET /users;active=true;role=admin
```

#### Use cases

- Advance routing schemes;
- Complex filtering in REST resources;

#### Trade-offs

Pros✅|Cons❗
-|-
More expensive than query params | Poor browser and caching support

---
