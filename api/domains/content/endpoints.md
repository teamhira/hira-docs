# Content Endpoints (hira-core)

These endpoints are managed by the `hira-core` service and exposed via the `hira-gateway` gateway.

## Core Content List
- **Articles**:
    - `GET /api/v1/articles` — Retrieve articles with filtering.
    - `GET /api/v1/articles/{id}` — Get single article details.
- **Quran**:
    - `GET /api/v1/quran/surahs` — List all Surahs.
    - `GET /api/v1/quran/ayahs/{id}` — Get specific Ayah content.
    - `GET /api/v1/quran/ayahs/{id}/tafsir` — Get Tafsir for an Ayah.
- **Hadith**:
    - `GET /api/v1/hadiths` — Retrieve Hadith collections.
- **Duas**:
    - `GET /api/v1/dua/duas` — List available Duas.

Refer to the full [Swagger documentation](https://github.com/teamhira/hira-core/blob/main/docs/swagger.json) for schema details.
