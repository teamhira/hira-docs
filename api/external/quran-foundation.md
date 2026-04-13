# Quran Foundation API (v4) Integration

This document details the external API endpoints provided by the [Quran Foundation](https://quran.foundation/docs) and used within the Hira application to source Quranic text, translations, and audio assets.

**Base URL**: `https://apis.quran.foundation/content/api/v4`

---

## 1. Core Quran Content

### List All Chapters (Surahs)
Fetches the metadata for all 114 Surahs.
- **Endpoint**: `GET /chapters`
- **Used in**: [`SurahListView.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/Views/SurahListView.swift)
- **Query Parameters**:
  - `language` (string): ISO code (e.g., `en`, `id`) to localize chapter names.

### Chapter Information
Retrieves historical background and revelation context.
- **Endpoint**: `GET /chapters/{chapter_id}/info`
- **Used in**: [`SurahInfoSheet.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/Views/Subviews/SurahInfoSheet.swift)
- **Query Parameters**:
  - `language` (string): Localization for the info text.

### Verses by Chapter
Fetches verses for a specific chapter. Used for the primary reading list.
- **Endpoint**: `GET /verses/by_chapter/{chapter_id}`
- **Used in**: [`QuranAyahListView.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/Views/Subviews/QuranAyahListView.swift)
- **Query Parameters**:
  - `language` (string): General content language.
  - `words` (boolean): `true` to include word-by-word data (required for Tajweed and Word-Audio).
  - `translations` (int array): IDs of the translations to include (e.g., `85` for Abdel Haleem).
  - `audio` (int): ID of the reciter for verse-level audio association.
  - `page` (int): Page number (defaults to 1).
  - `per_page` (int): Number of verses (Hira typically uses `300` to fetch whole chapters).

### Verses by Page (Mushaf Mode)
Fetches verses that appear on a specific physical page of the Madinah Mushaf.
- **Endpoint**: `GET /verses/by_page/{page_number}`
- **Used in**: [`QuranMushafView.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/Views/Subviews/QuranMushafView.swift)
- **Query Parameters**: Same as *Verses by Chapter*.

---

## 2. Structural Navigation

### List All Juzs
Provides the mapping of the 30 Juz divisions.
- **Endpoint**: `GET /juzs`
- **Used in**: [`QuranJuzListView.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/Views/QuranJuzListView.swift)

---

## 3. Resource & Settings Discovery

### Available Languages
Populates the language selection interface for documentation and UI.
- **Endpoint**: `GET /resources/languages`
- **Used in**: [`QuranLanguageSelector.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/Views/Subviews/QuranLanguageSelector.swift)

### Translation Resources
Lists available translations for a given language.
- **Endpoint**: `GET /resources/translations`
- **Query Parameters**:
  - `language` (string): Filter translations by language.

### Tafsir Resources
Lists available exegesis resources.
- **Endpoint**: `GET /resources/tafsirs`
- **Query Parameters**:
  - `language` (string): Filter tafsirs by language.

### Recitation Resources
Lists available world-renowned reciters.
- **Endpoint**: `GET /resources/recitations`
- **Used in**: [`QuranResourceSelector.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/Views/Subviews/QuranResourceSelector.swift)

---

## 4. Audio & Precision Timing

### Chapter Audio Files
Retrieves audio manifest with precise word-level and verse-level timestamps.
- **Endpoint**: `GET /chapters/{chapter_id}/audio_files`
- **Used in**: [`QuranViewModel.swift`](https://github.com/teamhira/hira-swiftui/blob/main/Apps/iOSApp/Features/Quran/QuranViewModel.swift) (Auto-scroll/Teleprompter logic).
- **Query Parameters**:
  - `recitation_id` (int): The selected reciter's ID.
  - `segments` (boolean): `true` to include word-level timing (essential for word-level highlighting).

---

## Summary of Usage Logic
1. **Initial Load**: App calls `/chapters` to build the navigation list.
2. **Reading View**: Calls `/verses/by_chapter` or `/verses/by_page` with `words=true` to enable Tajweed rendering.
3. **Teleprompter**: Calls `/audio_files?segments=true` to calculate scroll duration per verse based on `timestamp_from` and `timestamp_to`.
