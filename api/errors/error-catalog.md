# Error Catalog

## Format
- **`code`**: Machine-readable error identity (e.g., `AUTH_INVALID_TOKEN`).
- **`message`**: Concise, human-readable summary.
- **`details`**: Additional context where applicable (e.g., field-level validation errors).

## Initial Categories
- **Authentication Errors**: Issues with sessions, tokens, or credentials.
- **Validation Errors**: Malformed payloads or invalid field values.
- **Permission Errors**: Unauthorized access to specific resources.
- **Domain Business Errors**: Logic violations (e.g., `QURAN_AYAH_NOT_FOUND`).
