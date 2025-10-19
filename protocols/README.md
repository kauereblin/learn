# Physical Layer

Transmit raw bits over physical medium.
It handles cables, connectors, and electrical signals.

- Ethernet (IEEE 802.3);
- Wi-Fi (IEEE 802.11);
- Bluetooth (IEEE 802.15);
- USB;
- DSL;
- SONET;
- Fiber Channel;

# Data Link Layer

Responsible to transfer frames between directly connected nodes.
*MAC address*, error detection, framing.

- Ethernet;
- Point-to-Point Protocol - **PPP**;
- High-Level Data Link Control - **HDLC**;
- Address Resolution Protocol - **ARP**;
- VLAN (IEEE 802.1Q);
- Logical Link Control - **LLC** (IEEE 802.2);

# Network Layer

Move packets through network. Routing and logical addressing.

- *Internet Protocol* - **IP**;
- Internet Control Message Protocol - **ICMP** (ping);
- Internet Group Management Protocol - **IGMP**;
- OSPF;
- RIP;
- BGP;
- IPsec;

# Transport Layer

Provide reliable or fast delivery between endpoints.

- *Transmission Control Protocol* - **TCP**;
- *User Datagram Protocol* - **UDP**;
- Stream Control Transmission Protocol - **SCTP**;
- Datagram Congestion Control Protocol - **DCCP**;

# Session Layer

Manage sessions or dialogs, establishing, maintaining, and terminating connections.

- *Remote Procedure Call* - **RPC**;
- Network Basic I/O System - **NetBIOS**;
- Point-to-Point Tunneling Protocol - **PPTP**;
- Server Message Block - **SMB**;
- Layer 2 Tunneling Protocol - **L2TP**;

# Presentation Layer

Translate, encrypt, compress, or serialize data.

- **TLS** / **SSL**;
- Multipurpose Internet Mail Extensions - **MIME**;
- XDR / ASN.1;
- JPEG / MP3 / MPEG / GIF / PNG;
- Encryption (*AES*, *RSA*, etc);

# Application Layer

## HTTP/HTTPS (HyperText Transfer Protocol)

#### Methods:
- GET: retrieve data;
- POST: create data;
- PUT: update data;
- DELETE: remove data;
- PATCH: partial update;

#### Status Code:
- 2xx: Success;
- 3xx: Redirection;
- 4xx: Client Error;
- 5xx: Server Error;

https://http.cat/

#### Common Headers:
- Content-Type:
- Authorization;
- Accept:
- Cache-Control;
- User-Agent;

### HTTPS (Secure)

HTTP + TLS/SSL Encryption

Benefits | Risks
-|-
Data encryption | Main in the middle attack
Data integrity | Data tampering
Authentication | Information theft
SEO benefits | Loss of user trust

## WebSockets

Ideal for real-time communication.

Solve HTTP polling problems:
- Latency;
- Wasted bandwidth;
- Server resources overhead;

Client and Server do a handshake. Server and Client push data to each other, allowing bidirectional communication.

## AMQP (Advanced Message Queuing Protocol)

Consists in three components:
- Producer: send messages;
- Message Broker: routing messages;
- Consumer: process the message;

The message broker has a queue to store the messages until the consumer are free, pulling to the message.

#### Exchange types

- Direct;
- Fanout;
- Topic;

# generic Remote Procedure Calls (gRPC)

*RPC* enables a program to execute a procedure on a remote server as if it were a local call. Limited support in Web using *gRPC-Web*.

It uses *Protocol Buffer* as its default *interface definition language (IDL)*. This defines the service and message structure.

It also uses *HTTP/2* for transport, providing multiplexing, binary framing, header compression, and full-duplex streaming (bidirectional).

### How it works

Define the data structures and services using a `.proto`:

```protobuf
syntax = "proto3";

service UserService {
  rpc GetUser (UserRequest) returns (UserResponse);
}
```

That compile to:
- Server stubs (for implementing services);
- Client stubs (for calling services);

```csharp
var user = client.GetUser(new UserRequest {Id = 1});
```

Some benefits:
- Language and platform agnostic;
- Streaming: supports unary, client streaming, and bidirectional streaming;
- Pluggable support: Offers built-in support for pluggable features like load balancing, health checking, tracing, and authentication;

Use cases:
- Microsservices;
- Low-latency data exchange;
- Connecting Distributed Systems;
- Real-time Services;

#### Authentication and Security

- Custom metadata-based authentication;
- JWT (JSON Web Token);
- [OAuth 2.0](../oauth/README.md);
- [TLS](../protocols/README.md#presentation-layer) encryption
