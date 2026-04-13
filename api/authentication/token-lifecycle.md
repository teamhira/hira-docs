# Session Lifecycle (Better Auth)

## Flow
1. **User Login**: User authenticates and receives session metadata.
2. **Session Persistence**: Better Auth manages session persistence via secure browser-side cookies or client-side tokens.
3. **Session Validation**: The `hira-gateway` gateway validates the session before proxying requests to internal services like `hira-core`.
4. **Session Refresh**: Sessions are automatically extended based on activity, as configured in Better Auth.
5. **Revocation**: Sessions are invalidated upon logout or account compromise via the Better Auth administration API.
