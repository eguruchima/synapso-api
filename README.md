# Synapso API (Rails)

Synapso API is the backend for the Synapso app, a personal note-taking and AI assistant platform. It handles user authentication, notes management, and will eventually integrate with AI services (OpenAI GPT, Whisper, etc.).

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Requirements](#requirements)
- [Installation & Setup](#installation--setup)
- [Running the App](#running-the-app)
- [API Endpoints](#api-endpoints)
- [Testing](#testing)
- [Project Layout](#project-layout)
- [License](#license)
- [Further Documentation](#further-documentation)

---

## Overview

This repository contains the **Ruby on Rails** RESTful API that powers Synapso. It manages:

- **User Accounts** (signup, login, logout) using session-based cookies
- **Notes** (CRUD) – storing user-created notes
- **Authentication** – secure cookie-based session management
- Future expansions like:
  - **Tagging system** (for note organization)
  - **Voice notes** (file uploads with Active Storage)
  - **AI integration** (GPT summaries, Whisper transcription)

The Rails backend returns JSON responses consumed by the [Synapso Web Frontend](../synapso-web).

---

## Features

- **Cookie-based Auth**: Log in and out with secure cookies (`httpOnly`, `sameSite`).
- **User Model**: Uses `has_secure_password` for password hashing (via bcrypt).
- **Notes CRUD**: Each user can manage their own notes.
- **PostgreSQL**: Relational database for consistent, scalable data storage.

---

## Tech Stack

- **Ruby**: 3.0+ (check `.ruby-version` for exact version)
- **Rails**: 7.x
- **PostgreSQL**: As the primary database
- **bcrypt**: For password hashing
- **Active Storage** (planned): For voice note file uploads
- **OpenAI APIs** (planned): GPT & Whisper integrations

---

## Requirements

- **Ruby** (3.0 or higher recommended)
- **Rails** (7.0 or higher)
- **PostgreSQL** (latest stable version)
- **Node** & **Yarn** (for Rails asset pipeline if needed, though this is an API-only app)

Make sure you have a PostgreSQL server running locally or hosted. Update `config/database.yml` accordingly.

---

<!-- ## Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/synapso-api.git
   cd synapso-api
   ``` -->
