# Authentication Page

The authentication module handles user identification and security through the Quran Foundation ecosystem. It provides a streamlined entry flow for users to access their synced data across platforms.

## User Interfaces

### 1. Login Screen
The login interface is focused on a unified authentication experience via the Quran Foundation OAuth2 service.
- **Main Action**: "Login with Quran Foundation" button triggers the secure web-based OAuth flow.
- **Account Recovery**: "Forgot password?" link redirects to the official Quran Foundation password recovery page.
- **Support**: "Need help?" provides guidance for users facing technical difficulties.
<img src="login.png" alt="Login Screen" width="250" />

## Interaction Flow
1. **OAuth Initialization**: User clicks the Quran Foundation login button.
2. **Secure Verification**: Redirection to the official Quran Foundation login portal for secure credential handling.
3. **Success**: Upon successful authorization, the user is issued a token and transitioned to the main dashboard.