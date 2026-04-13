# Repository Map

This document lists all repositories within the Hira ecosystem and their respective responsibilities.

| Repository | Primary Technology | Responsibility |
| :--- | :--- | :--- |
| **[hira-docs](https://github.com/teamhira/hira-docs)** | Markdown | Centralized documentation (SSOT). |
| **[hira-infra](https://github.com/teamhira/hira-infra)** | YAML, Docker, IaC | Infrastructure, CI/CD, and DevOps configurations. |
| **[hira-auth](https://github.com/teamhira/hira-auth)** | TS / Better Auth | Identity and Authentication service. |
| **[hira-core](https://github.com/teamhira/hira-core)** | Go | Core business logic and content API. |
| **[hira-gateway](https://github.com/teamhira/hira-gateway)** | Apollo / GraphQL | Unified API Gateway (Gateway GraphQL). |
| **[hira-app](https://github.com/teamhira/hira-app)** | Web / TS | User Web Dashboard. |
| **[hira-web](https://github.com/teamhira/hira-web)** | Web / TS | Portfolio Web / Landing Page. |
| **[hira-admin](https://github.com/teamhira/hira-admin)** | Web / TS | Admin Web Dashboard. |
| **[hira-swiftui](https://github.com/teamhira/hira-swiftui)** | SwiftUI | Multi-platform frontend (iOS, macOS, visionOS). |
| **[hira-kotlin](https://github.com/teamhira/hira-kotlin)** | Kotlin / KMP | Android and multi-platform frontend components. |

## Navigation Rule
- Documentation for specific services should reside in `/docs` within that service's repository.
- Cross-domain and high-level architectural documentation must reside in `hira-docs`.
