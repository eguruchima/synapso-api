# 🧪 Synapso API – Endpoints Documentation

This document tracks all API endpoints available in Synapso.

> Base URL (Dev): `http://localhost:3000`

---

## 🔐 Authentication Routes

### `POST /users` – Create account (Sign up)

#### Request Body:
```json
{
  "name": "Enrique",
  "email": "enrique@example.com",
  "password": "securepassword"
}

#### Success Response:
```json
{
  "id": 1,
  "name": "Enrique",
  "email": "enrique@example.com"
}

---

### `GET /me` – Get current user

Returns the logged-in user from `cookies.signed[:user_id]`.

#### Success Response:
```json
{
  "id": 1,
  "name": "Enrique",
  "email": "enrique@example.com"
}

---

### `DELETE /sessions` – Log out

Clears the current user's session.

#### Success Response:
```json
{
  "message": "Logged out successfully"
}

---

## 📝 Notes Routes (Coming Soon)

> These will be scoped to the current user only.

### `GET /notes` – List all notes

### `GET /notes/:id` – Show a specific note

### `POST /notes` – Create a new note

#### Example Request:
```json
{
  "title": "Synapso MVP Plan",
  "content": "Today I added a notes controller..."
}

---

## 🧠 AI Routes (Planned)

These routes will connect to external AI services like OpenAI's GPT and Whisper APIs.

### `POST /notes/:id/summarize` – Get AI-generated summary

Sends the note content to GPT and returns a summary or breakdown.

#### Example Response:
```json
{
  "summary": "This note describes a plan to add CRUD functionality using Rails and React."
}

---

## 🔖 Tags & Search (Planned)

These routes will support note organization and search functionality.

### `GET /notes?tag=work` – Filter notes by tag

Returns all notes tagged with `work`.

---

### `GET /search?q=rails` – Search notes by keyword

Returns notes where the title or content matches the given query.

#### Example Response:
```json
[
  {
    "id": 5,
    "title": "Learning Rails",
    "content": "Rails has a really intuitive routing system..."
  }
]

---

## 🔁 Sharing (Future)

These routes will support sharing notes with other users.

### `POST /notes/:id/share`

Creates a shared permission for another user (e.g., via email lookup or user ID).

#### Example Request:
```json
{
  "email": "collaborator@example.com"
}

#### Example Response:
```json
{
  "message": "Note shared successfully with collaborator@example.com"
}

---

_Last updated: April 13, 2025_  
_Maintainer: Enrique Uruchima_
