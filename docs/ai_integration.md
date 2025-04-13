# 🤖 Synapso AI Integration

This document explains how Synapso will use AI features powered by OpenAI APIs (ChatGPT + Whisper). It covers architecture, routes, example prompts, and response formats.

---

## 🧠 GPT (Chat Completion) – Use Cases

### ✅ 1. Summarizing Notes

**Purpose:** Provide quick summaries of long notes using OpenAI GPT.

#### API Route (Planned):
`POST /notes/:id/summarize`

#### Flow:
- Frontend sends `note.content` to backend
- Rails backend sends formatted prompt to OpenAI GPT API
- Returns a short summary in JSON

#### Example Prompt:

#### Example GPT Response:
```json
{
  "summary": [
    "Added CRUD routes for the Rails API.",
    "Planned AI integration (summarize, transcribe).",
    "Worked on project documentation (endpoints.md)."
  ]
}

---

### ✅ 2. “Plan My Day” Assistant

**Purpose:** Help users start their day with an AI-generated plan based on recent notes.

#### API Route (Planned):
`POST /ai/daily_plan`

#### Flow:
- User triggers “Plan My Day” in UI
- Frontend sends user notes or context
- GPT generates 3–5 actionable tasks or goals

#### Example Prompt:

#### Example GPT Response:
```json
{
  "plan": [
    "Finish implementing the NotesController and test all CRUD actions.",
    "Write out initial design notes for the AI assistant features.",
    "Commit and push new documentation updates to GitHub."
  ]
}

---

## 🎙 Whisper (Audio Transcription)

### ✅ Use Case: Voice Notes → Text

**Purpose:** Transcribe voice notes into editable, searchable text.

#### API Route (Planned):
`POST /notes/:id/transcribe`

#### Flow:
- React sends audio file (via FormData)
- Rails backend forwards file to OpenAI Whisper API
- Transcription result is saved to `note.transcript` or returned directly

#### Supported File Types:
- `.mp3`, `.mp4`, `.m4a`, `.wav`, `.webm`

#### Example Whisper Response:
```json
{
  "transcription": "Today I built out the frontend note form and connected it to the API."
}

---

## 💸 Cost Awareness

OpenAI charges per usage:

- **GPT-4** (chat): ~$0.03–$0.06 per 1K tokens
- **Whisper** (audio): ~$0.006 per minute

⚠️ Synapso should:
- Trigger AI features manually (never automatic)
- Handle rate limits or API failures gracefully
- Consider usage limits or quotas for free users

---

## 🧩 Integration Tips

- Use the `ruby-openai` gem
- Store API keys in `ENV['OPENAI_API_KEY']`
- Use background jobs (Sidekiq or ActiveJob) for long-running tasks like audio transcription
- Prompt engineering matters — test and refine prompts over time

---

_Last updated: April 13, 2025_  
_Maintainer: Enrique Uruchima_
