# Global Test Strategy

## Testing Layers
1. **Unit Tests (Dev)**: Focus on logic and component isolation. High speed and high volume.
2. **Integration Tests (QA/Dev)**: Focus on interaction between services and contracts.
3. **End-to-End (E2E) Tests (QA)**: Validating critical user flows from the UI.
4. **Smoke Tests (STG/PROD)**: Quick validation post-deployment.

## Quality Gate
Merging to `main` requires all Unit and Integration tests to pass. Releases to Staging require a full Regression check.
