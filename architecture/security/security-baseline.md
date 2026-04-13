# Security Baseline

## Baseline
- **Encrypted Communication**: All communications must use TLS 1.2+ (HTTPS).
- **Secure Token Handling**: Access tokens handled according to platform-specific best practices (e.g., Secure Enclave for iOS).
- **Zero Sensitive Data in Logs**: Passwords, PII, and sensitive tokens must never be written to logs.
- **Microservice Protection**: All critical endpoints must implement rate limiting and audit trails.
- **Identity Provider**: `hira-auth` (Better Auth) is the single source of truth for identity management.

## Review
Security reviews are required for every significant architectural change or new public endpoint implementation.
