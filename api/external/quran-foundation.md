# Quran Foundation Integration Specification

This document details the active integration between Hira and the Quran Foundation ecosystem, focusing exclusively on the services and endpoints utilized in the core application.

---

## 1. Network Architecture

Hira routes requests through two secondary base URLs managed by [`FoundationClient`](../../Hira/Shared/Data/Network/FoundationClient.swift):

| Service | Base URL | Usage |
| :--- | :--- | :--- |
| **Content v4** | `https://apis.quran.foundation/content/api/v4` | Public scriptures, audio manifest, and resource lists. |
| **User Data v1** | `https://apis.quran.foundation/auth` | Synchronized bookmarks, activity, and progress. |

### Global Headers
All authenticated requests (User Data v1) automatically include:
- `Authorization: Bearer [TOKEN]`
- `x-auth-token: [TOKEN]`
- `x-client-id: [CLIENT_ID]`
- `x-timezone: [TIMEZONE]` (Required for correct activity-day day calculation)

---

## 2. API Reference (Core Content v4)

### 📖 Reading & Resources
| Endpoint | Method | Description | Key Parameters |
| :--- | :--- | :--- | :--- |
| `/chapters` | `GET` | Fetch all 114 Surahs. | `language` |
| `/chapters/{id}/info` | `GET` | Historical context of a Surah. | `language` |
| `/verses/by_chapter/{id}` | `GET` | Main reading content for a Surah. | `words=true`, `translations`, `audio`, `per_page=300` |
| `/verses/by_page/{page}` | `GET` | Verses appearing on a specific Mushaf page. | `words=true`, `translations` |
| `/juzs` | `GET` | Metadata for the 30 structural divisions. | N/A |
| `/resources/recitations` | `GET` | List of available reciters. | `language` |
| `/resources/translations` | `GET` | List of available translation resources. | `language` |
| `/resources/tafsirs` | `GET` | List of available tafsir resources. | `language` |

### 🎵 Audio & Timestamps
| Endpoint | Method | Description | Key Parameters |
| :--- | :--- | :--- | :--- |
| `/chapters/{id}/audio_files` | `GET` | Audio manifest for a specific surah. | `recitation_id`, `segments=true` (for timestamps) |

---

## 3. API Reference (User Data v1)

### 🏷️ Bookmarks & Last Read
| Endpoint | Method | Description | Payload / Params |
| :--- | :--- | :--- | :--- |
| `/v1/bookmarks` | `GET` | Fetch user's synchronized bookmarks. | `mushafId`, `first`, `after` |
| `/v1/bookmarks` | `POST` | Create a bookmark or "Last Read" position. | `type`, `key`, `verseNumber`, `isReading`, `mushafId` |
| `/v1/bookmarks/{id}` | `DELETE` | Permanently remove a specific bookmark. | Path Variable: `id` |
| `/v1/bookmarks/ayahs-range`| `GET` | Check bookmark status for a range of ayahs. | `chapterNumber`, `rangeStartAyahNumber`, `rangeEndAyahNumber` |

### ⚡ Tracking & Progress
| Endpoint | Method | Description | Payload / Params |
| :--- | :--- | :--- | :--- |
| `/v1/reading-sessions`| `GET` | Fetch user reading session history. | `first`, `after` |
| `/v1/reading-sessions`| `POST` | Log active reading presence. | `chapterNumber`, `verseNumber` |
| `/v1/activity-days` | `GET` | Fetch historical activity and heat-map data. | `from`, `to`, `type="QURAN"` |
| `/v1/activity-days` | `POST` | Post incremental reading time and ranges. | `type`, `seconds`, `ranges` (JSON Array), `mushafId`, `date` |

---

## 4. Technical Implementation Constants

- **Range Limit**: Individual `ayahs-range` checks must not exceed **30 ayahs**. Repository handles chunking automatically.
- **Reading Session Debounce**: Tracking begins after **15 seconds**; updates are posted with a **2 second** debounce.
- **Activity Persistence**: `ranges` post payload must be a **JSON Array of Strings** (e.g., `["1:1-1:7"]`).
- **Timezone Header**: `x-timezone` is mandatory for `/v1/activity-days` to maintain accurate streaks.

---

## Reference Map
- **Networking Core**: [`FoundationClient.swift`](../../Hira/Shared/Data/Network/FoundationClient.swift)
- **Endpoints Logic**: [`FoundationEndpoints.swift`](../../Hira/Shared/Core/Constants/FoundationEndpoints.swift)
- **ViewModel Orchestration**: [`QuranViewModel.swift`](../../Hira/Apps/iOSApp/Features/Quran/QuranViewModel.swift)
