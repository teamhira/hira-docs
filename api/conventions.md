# API Conventions

## Request
- **Consistency**: Use consistent field naming (camelCase for JSON).
- **Validation**: Payload validation must be performed at the service layer (hira-core/hira-auth).
- **Headers**: Required headers for authentication and localization must be provided in all gateway requests.

## Response
- **Envelope**: Use a uniform response envelope.
- **Error Format**: Include machine-readable `code`, human-readable `message`, and optional `details` for all errors.

## Versioning
- **Breaking Changes**: Must be announced and documented via an ADR before implementation.
- **Sunset Policy**: Old versions must be supported for a defined period after a major release.
