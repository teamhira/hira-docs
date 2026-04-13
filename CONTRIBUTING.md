# Contributing Guide

Thank you for contributing to the Hira documentation.

## General Rules
- Every feature or architectural change must update the corresponding documentation.
- Each Pull Request (PR) should focus on a single topic to facilitate review.
- Avoid ambiguous terms; clearly explain the context, decisions, and impact.
- PRs touching critical areas must involve the area owner.

## File Naming Standards
- Use lowercase letters.
- Use hyphens as word separators.
- Example: `payment-state-machine.md`.

## Recommended Content Structure
1. Background / Context
2. Problem Statement
3. Solution / Decision
4. Impact and Risks
5. Follow-up Actions

## Pull Request Checklist
- [ ] New documents are placed in the correct folder.
- [ ] Links between documents are valid.
- [ ] Terminology is consistent with other documents.
- [ ] No sensitive information is included.
- [ ] Changelog is updated if changes have a wide team impact.
- [ ] Reviewers are assigned based on `MAINTAINERS.md` / `CODEOWNERS`.

## Review Process
- At least one technical reviewer.
- For architectural changes: request cross-platform review if they have a global impact.

## Local Validation
Run validation before opening a PR:

```bash
./scripts/check-docs.sh
```

If there are major structural changes, also update:
- `README.md`
- `onboarding/repository-map.md`
- `CHANGELOG.md`
