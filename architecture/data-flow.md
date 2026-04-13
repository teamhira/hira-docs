# Data Flow

## General Flow
1. **Client** sends a request to the `hira-gateway` gateway.
2. **hira-gateway** performs initial validation and routes requests to the appropriate service (`hira-auth` or `hira-core`).
3. **hira-auth** handles authentication/identity logic via Better Auth if required.
4. **hira-core** executes business logic for Islamic content, user progress, etc.
5. **Data Storage**: Services read from/write to their respective databases or caches.
6. **Unified Response**: `hira-gateway` aggregates the data and returns a consistent response to the client.

## Notes
- Any significant changes to the data flow between domains must be documented in an **ADR**.
- Cross-service communication details should be updated as more microservices are introduced.
