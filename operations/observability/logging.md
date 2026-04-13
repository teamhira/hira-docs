# Logging Standard

## Principles
- **Structured Logging**: Use structured formats (e.g., JSON) to ensure machine-readability.
- **Data Privacy**: Never log sensitive data (PII, passwords, full tokens).
- **Request Tracing**: A correlation ID must be present in every log statement to enable end-to-end request tracing across services.
