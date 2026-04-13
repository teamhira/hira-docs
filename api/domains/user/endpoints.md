# User & Identity Endpoints (hira-auth)

These endpoints are managed by the `hira-auth` service using Better Auth and or proxying via `hira-core` for profile metadata.

## Identity & Session
- `POST /api/v1/auth/login` — Authenticate user.
- `POST /api/v1/auth/register` — Create new user account.
- `POST /api/v1/auth/logout` — Invalidate current session.
- `GET /api/v1/auth/me` — Get current session metadata.

## Profile Management (hira-core)
- `GET /api/v1/users/me` — Retrieve full user profile.
- `PATCH /api/v1/users/me` — Update profile information.
- `POST /api/v1/auth/change-password` — Update account credentials.

Refer to the [Better Auth documentation](https://better-auth.com/docs) for direct API usage if not using the GraphQL gateway.
