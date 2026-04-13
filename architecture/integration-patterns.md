# Integration Patterns

## Objective
Standardizing integration patterns between components to prevent inconsistency and reduce system fragmentation.

## Adopted Patterns
- **Synchronous Request-Response**: Used for real-time data requirements (e.g., Client -> GraphQL Gateway).
- **Asynchronous Event-Driven**: Used for non-critical background processes (e.g., Notifications, Analytics).
- **Retry + Idempotency**: Applied to risk-prone double-operations (e.g., Payment/Bookmarking).
- **API Composition**: The GraphQL gateway orchestrates data from multiple microservices (`hira-auth`, `hira-core`).

## Anti-Patterns
- **Direct Database Access**: Services must not shared databases; access must go through the service's API.
- **Tightly Coupled Domain Logic**: Avoid combining business logic from multiple domains into a single service without a clear interface.
