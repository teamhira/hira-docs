# NotebookLM Blueprint Prompt: Technical Architecture & Global Ecosystem

**Objective:** Conduct a technical post-mortem and architectural deep-dive into the Hira iOS application. This video should serve as a masterclass in modern SwiftUI engineering and ecosystem integration.

**Instructions for AI Hosts:**

### 1. The Architectural Blueprint (Clean + MVVM-C)
*   **The Foundation:** Explain how Hira utilizes a **Domain-Driven Design (DDD)** approach. Discuss the strict separation between the `Data` layer (Repositories, API Clients), the `Domain` layer (Pure Swift Use Cases like `GetJuzListUseCase`, `AddBookmarkUseCase`), and the `Presentation` layer.
*   **The Coordinator Pattern:** Detail the `AppRouter` using SwiftUI’s `NavigationPath`. Why is centralizing navigation critical for an app with 20+ modules?
*   **State Management:** Pivot to the **Observation Framework**. Discuss replacing `ObservableObject` with the `@Observable` macro to reduce view re-rendering and improve performance in the complex `QuranViewModel`.

### 2. High-Performance Persistence & Networking
*   **SwiftData Integration:** Discuss the "Offline-First" philosophy. How Hira uses **SwiftData** to cache massive amounts of text (Surahs, Translations, Daily Reminders) while maintaining a small memory footprint.
*   **The Unified FoundationClient:** This is the heart of the app. Explain the logic in `FoundationClient.swift`:
    - **Stampede Prevention:** How it uses `Task` grouping to ensure that multiple concurrent requests don't all trigger a token refresh at once.
    - **401 Retry Strategy:** The recursive logic that seamlessly refreshes tokens in the background and reapplies the original request.
    - **Authentication:** Discuss the **KeychainService** and why storing sensitve tokens in the system keychain is a non-negotiable for religious/personal privacy.

### 3. Integrated Ecosystem (Quran Foundation)
Hira isn't an island; it's a window into a larger ecosystem. Detail the following:
*   **Endpoint Dualism:** Explain why we split traffic between **Content v4** (for heavy binary data like audio/maps) and **User Data v1** (for synced personalized state like bookmarks).
*   **Parallel Chunking Mastery:** Discuss a specific engineering hurdle: The 30-ayah limit on the `ayahs-range` endpoint. Explain how `BookmarkRepositoryImpl` solves this by chunking large requests and merging them with the `combineLatest` operator.
*   **Activity Synchronization:** Focus on the `/v1/activity-days` POST payload. Explain the importance of sending the `x-timezone` header to ensure heartbeats align with the user's localized "Active Day" for streak accuracy.

### 4. Professional Identity & Security
*   **OAuth2 + PKCE:** Explain the **Proof Key for Code Exchange (S256)** implementation. Why is it more secure for a mobile app than standard Authorization Code flows?
*   **Identity Provisioning:** Discuss the redirect scheme (`hira://oauth`) and the handoff between `ASWebAuthenticationSession` and the app's internal `TokenManager`.

**Tone:** Intellectual, engineering-centric, authoritative. Use terms like "Separation of Concerns," "Thread Safety," "Geodesic Paths," and "Idempotency."