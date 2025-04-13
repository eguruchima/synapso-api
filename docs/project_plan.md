# 📅 Synapso Development Plan

This file tracks your development progress, feature roadmap, and day-by-day breakdown.

---

## ✅ Phase 1: Foundation
- [x] User Authentication (Rails + React)
- [x] Cookie-based session management
- [x] Soft logout flow (no full page reload)

---

## 🧱 Phase 2: Core Features (In Progress)
- [ ] Notes model in Rails
- [ ] NotesController + CRUD routes
- [ ] React frontend for listing, creating, editing, deleting notes
- [ ] Protect note access to current user

---

## 🧠 Phase 3: Organization
- [ ] Tagging system (acts-as-taggable-on or custom)
- [ ] Tag filters / UI in frontend
- [ ] Search notes by keyword

---

## 🎙 Phase 4: Voice & AI
- [ ] Audio file attachment (Active Storage)
- [ ] Audio recording from browser (MediaRecorder API)
- [ ] Transcription via Whisper API
- [ ] AI summary of notes via GPT
- [ ] “Plan my day” assistant (prompt-driven daily planner)

---

## 🧼 Phase 5: Polish & Deploy
- [ ] UI cleanup (Tailwind or custom)
- [ ] Mobile responsive layout
- [ ] Deployment (Render, Fly.io for API, Netlify or Vercel for frontend)

---

## 🗓️ Daily Log

### Day 1
- Set up backend + frontend projects
- Initialized GitHub repos
- Set up Rails user model + authentication logic

### Day 2
- Created login/signup/logout React pages
- Connected React to Rails API using Axios
- Implemented and tested cookie-based auth

### Day 3 (Today)
- Wrote project README files ✅
- Created `/docs` folder ✅
- Added starter files: `project_plan.md`, `endpoints.md`, `ai_integration.md` ✅
- Committed docs and pushed to GitHub ✅
- Next up: build `Note` model and `NotesController` 🧠
