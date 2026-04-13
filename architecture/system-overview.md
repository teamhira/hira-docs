# System Overview

## Objective
To provide a high-level architectural overview across iOS/macOS/visionOS, Android, Web, and the backend services.

## Key Components
1. **hira-swiftui (Client Apps)**: Native multi-platform frontend for Apple devices, utilizing modern SwiftUI patterns.
2. **hira-gateway (API Gateway)**: The unified entry point for all client requests, orchestrating data from multiple backend services.
3. **hira-core (Core Services)**: A high-performance Go-based service managing the primary Islamic content (Quran, Hadith, Prayer Times).
4. **hira-auth (Authentication)**: A dedicated identity service powered by **Better Auth** to manage user sessions and security.
5. **hira-infra (Infrastructure)**: DevOps and infrastructure management ensuring automated and reliable deployments.
6. **Data Storage**: Multi-layered storage including relational databases for structured content and caching layers for performance.
7. **Observability Stack**: Centralized logging, metrics, and alerting for system health tracking.

## Design Principles
- **Contract-first**: API contracts are defined before implementation.
- **GraphQL-driven**: Unified data access through a single schema.
- **Modular and Scalable**: Services are decoupled to allow independent growth.
- **Backward Compatible**: Ensuring public contracts remain stable over time.
