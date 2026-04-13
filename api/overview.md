# API Overview

## Objective
To standardize the API contract across iOS/macOS/visionOS, Android, and Web clients.

## High-Level Architecture
- **Unified Gateway**: All client communications are routed through `hira-gateway`.
- **Backend Services**: `hira-gateway` orchestrates data from domain-specific services like `hira-core` (Content) and `hira-auth` (Identity).
- **Contract-first Design**: Changes to API contracts must be discussed and documented before implementation.

## Key Principles
- **Domain-based Endpoints**: Services are divided by business domains (e.g., Quran, Hadith, User).
- **Versioned Contracts**: Ensuring stability for public-facing client applications.
- **Unified Error Model**: Standardized error responses across all service layers.
