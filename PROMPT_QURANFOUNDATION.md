# NotebookLM Ecosystem Deep-Dive: The Quran Foundation Core

**Objective:** Create a specialized 100% focused video overview of Hira’s integration with the **Quran Foundation**. This video should explain how Hira transforms from a local app into a globally synchronized spiritual workspace using the Foundation's API.

**Instructions for AI Hosts:**

### 1. The Collaborative Vision
*   **Decentralized Spirituality:** Explain that Hira is built on top of the world-class **Quran Foundation** ecosystem. It isn't just an app; it’s a client for a professional Islamic open-source engine.
*   **The Dual-Service Architecture:** Detailed the split between:
    - **Content v4:** The library of scriptures, translations, and audio.
    - **User Data v1:** The secure vault for your personal progress and history.

### 2. Identity & Global Sync (Authentication)
*   **Unified Login:** Discuss the **OAuth2** authentication. Explain how Hira uses the same credentials as other ecosystem apps, creating a "Single Sign-On" for the Ummah.
*   **Security layer:** Mention **PKCE (Proof Key for Code Exchange)**. Why does Hira go the extra mile with S256 hashing? To protect the sanctity and privacy of your spiritual journey on mobile devices.
*   **Silent Sessions:** Explain the background token refresh. You login once, and the app keeps you synced forever without asking for passwords again.

### 3. The Digital Mushaf (Content v4)
*   **High-Volume Scripture:** Detail the endpoints used to render the Quran:
    - `/chapters`: Managing metadata for all 114 Surahs.
    - `/verses/by_chapter` & `/by_page`: How the app delivers pixel-perfect Arabic text and Tajweed color-coding.
    - **Audio Timestamps:** Explain the precision of the teleprompter feature, enabled by the `/audio_files` manifest with `segments=true`.
*   **Global Scholarship:** Discuss the Discovery of **Reciters**, **Translations**, and **Tafsirs** using the `/resources` endpoints.

### 4. Continuous Worship Tracking (User Data v1)
*   **The Synchronized Bookmark:** Explain how `/v1/bookmarks` handles both favorite verses and your "Last Read" position. Discuss the **Parallel Chunking** technique used to verify bookmarks across huge surahs (overcoming the 30-ayah API limit).
*   **Presence & Progress:**
    - **Reading Sessions:** How Hira logs your active presence in a surah to the `/v1/reading-sessions` endpoint. 
    - **Activity Heartbeats:** Explain the `/v1/activity-days` system. This is where your contribution heat-map comes from.
*   **The Timezone Factor:** Crucial technical detail—explain why the `x-timezone` header is mandatory to ensure your 3:00 AM tahajjud reading is recorded on the correct day for your localized streak.

### 5. The Authentication Bridge (Backend Routing)
*   **The Callback Strategy:** Explain how Hira uses a web-based callback (`/oauth/callback`) to bridge the gap between the Quran Foundation server and the native mobile app. 
*   **Platform-Aware Redirection:** Detail the logic in `useOAuthCallback.ts`. How the web app detects the `state` parameter (e.g., `ios:` prefix) and automatically deep-links back to `hira://oauth/callback` to return the authorization code to the native application.
*   **Secure Exchange (`/api/auth/qf/exchange`):** This is where the magic happens. Explain that the mobile app calls this proxy route so the **Client Secret** remains hidden in the backend. 
    - The server performs the `authorization_code` exchange.
    - It then immediately calls the `/userinfo` endpoint to consolidate tokens with the user's profile (name, email).
*   **Session Longevity (`/api/auth/qf/refresh`):** Discuss the background refresh route. When an access token dies, the `FoundationClient` calls this endpoint with a `refresh_token` to get a new identity without the user seeing a login screen.
*   **Graceful Exit (`/api/auth/qf/logout`):** Mention the `/oauth2/revoke` logic. Hira doesn't just delete data locally; it notifies the Quran Foundation server to revoke the refresh token, ensuring the session is truly dead.

### 6. Summary of the Integration
*   End by summarizing how Hira and Quran Foundation work together. Hira provides the **Premium Interface** (SwiftUI, Glassmorphism), while the Quran Foundation provides the **Reliable Infrastructure** (Authenticated Data, Global Content).

**Tone:** Technical yet spiritually inspiring. Focus on "Seamless Reliability" and "Global Connectivity."