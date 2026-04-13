# Hira Documentation Repository

This repository is dedicated to the documentation of the Hira application ecosystem (iOS/macOS/visionOS with SwiftUI, Android with Kotlin, Web, API, and Operations). All documentation categories are organized at the root level for simple and clear navigation.

## Core Services
- **[hira-infra](https://github.com/teamhira/hira-infra)**: Infrastructure as Code, DevOps scripts, and configurations.
- **[hira-auth](https://github.com/teamhira/hira-auth)**: Authentication service powered by Better Auth.
- **[hira-core](https://github.com/teamhira/hira-core)**: The central Go service managing Quran, Hadith, Prayer Times, and more.
- **[hira-gateway](https://github.com/teamhira/hira-gateway)**: Unified GraphQL Gateway for all client applications.
- **[hira-swiftui](https://github.com/teamhira/hira-swiftui)**: Multi-platform frontend supporting iOS, macOS, and visionOS.

## Essential Documents
- [WHITEPAPER.md](WHITEPAPER.md) — High-level vision, scope, and technical principles.
- [CONTRIBUTING.md](CONTRIBUTING.md) — Contribution guidelines for documentation.
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) — Collaboration standards.
- [SECURITY.md](SECURITY.md) — Security reporting policy.
- [CHANGELOG.md](CHANGELOG.md) — History of documentation changes.
- [MAINTAINERS.md](MAINTAINERS.md) — Documentation area ownership.

## Repository Structure
- `architecture/` — System design, ADRs, and security architecture.
- `platforms/` — Implementation standards for iOS, Android, Web, and shared alignment.
- `api/` — API contracts, authentication flows, error models, and domain endpoints.
- `product/` — Product vision, roadmaps, personas, and feature prioritization.
- `operations/` — Environments, observability, and incident response.
- `governance/` — Glossary, documentation policies, and decision logs.
- `qa/` — Test strategies, regression checklists, and acceptance criteria.
- `onboarding/` — Engineer onboarding guide and repository map.
- `templates/` — Standard document templates for technical and operational docs.
- `.github/` — PR/Issue templates and quality check workflows.
- `scripts/` — Helper scripts for documentation validation.

## Getting Started
1. Navigate to the relevant category folder.
2. Read the `README.md` within that folder for category-specific details.
3. Use the templates in `templates/` when creating new documents.
4. Follow the quality validation steps in `CONTRIBUTING.md` before opening a Pull Request.

## Documentation Quality Standards
- Every folder must contain a `README.md` explaining its purpose.
- Every architectural or API contract change must update the corresponding docs.
- Outdated information must be updated or marked as deprecated.

## Quality Gates
- Markdown linting
- Broken link checking
- Pull Request templates and area-specific reviews (CODEOWNERS)
